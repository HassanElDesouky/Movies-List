//
//  AllMoviesController.m
//  Movies List
//
//  Created by Hassan El Desouky on 12/01/2021.
//

#import "AllMoviesController.h"

@interface AllMoviesController ()

@property (strong, nonatomic) NSMutableArray<Movie *> *movies;

@end

@implementation AllMoviesController

NSString *cellID = @"cellID";
int pagingCount;

- (void)viewDidLoad {
    [super viewDidLoad];
    pagingCount = 1;
    self.movies = NSMutableArray.new;
    [self setupTableView];
    [self fetchMovies];
}

- (void)setupTableView {
    UINib *nib = [UINib nibWithNibName:@"MovieCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:cellID];
    self.tableView.rowHeight = [self.tableView estimatedRowHeight];
}

- (void)fetchMovies {

    NSString *urlString = [NSString stringWithFormat:@"https://api.themoviedb.org/3/discover/movie?api_key=acea91d2bff1c53e6604e4985b6989e2&page=%d", pagingCount];

    NSURL *moviesURL = [NSURL URLWithString:urlString];

    [[NSURLSession.sharedSession dataTaskWithURL:moviesURL completionHandler:^(NSData * _Nullable data,
                                                                               NSURLResponse * _Nullable response,
                                                                               NSError * _Nullable error) {
        // To make sure the activity indicator was showing.
//        sleep(3);

        NSError *err;
        NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        if (err) {
            NSLog(@"Error");
        }

        for (NSDictionary *movie in responseJSON[@"results"]) {
            NSString *movieTitle = movie[@"title"];
            NSString *releaseDate = movie[@"release_date"];
            NSString *overview = movie[@"overview"];
            NSString *posterURL = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/w200%@", movie[@"poster_path"]];

            Movie *movie = Movie.new;
            movie.imageURL = posterURL;
            movie.overview = overview;
            movie.releaseDate = [Helpers getDateFromString:releaseDate];
            movie.title = movieTitle;
            [self.movies addObject:movie];
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });

    }] resume];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = (MovieCell *)[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    Movie *movie = self.movies[indexPath.row];
    cell.titleLabel.text = movie.title;
    cell.overviewLabel.text = movie.overview;
    cell.releaseDateLabel.text = [Helpers getStringFromDate:movie.releaseDate];
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData *data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: movie.imageURL]];
        if (data == nil)
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.posterImage.image = [UIImage imageWithData: data];
        });
    });
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.movies.count - 1) {
        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
        [spinner startAnimating];
        spinner.frame = CGRectMake(0, 0, self.tableView.bounds.size.width, 44);
        self.tableView.tableFooterView = spinner;
        [self.tableView.tableFooterView setHidden:NO];

        pagingCount++;
        [self fetchMovies];
    }
}

@end
