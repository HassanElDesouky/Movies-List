//
//  MyMoviesController.m
//  Movies List
//
//  Created by Hassan El Desouky on 12/01/2021.
//

#import "MyMoviesController.h"

@interface MyMoviesController ()

@property (strong, nonatomic) NSMutableArray<Movie *> *movies;

@end

@implementation MyMoviesController

NSString *cellId = @"cellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.movies = NSMutableArray.new;
    [self setupTableView];
}

- (void)setupTableView {
    UINib *nib = [UINib nibWithNibName:@"MovieCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:cellId];
    self.tableView.rowHeight = [self.tableView estimatedRowHeight];
}

- (void)addNewMovie:(Movie *)movie {
    [self.movies addObject:movie];
    [self.tableView reloadData];
}

- (IBAction)handleAddNewMovie:(id)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddNewMovieController *addNewMovie = [sb instantiateViewControllerWithIdentifier:@"AddNewMovieController"];
    [addNewMovie setDelegate:self];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:addNewMovie];
    [self presentViewController:navController animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = (MovieCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    Movie *movie = self.movies[indexPath.row];
    cell.titleLabel.text = movie.title;
    cell.overviewLabel.text = movie.overview;
    cell.releaseDateLabel.text = [Helpers getStringFromDate:movie.releaseDate];
    cell.posterImage.image = movie.image;
    return cell;
}

@end
