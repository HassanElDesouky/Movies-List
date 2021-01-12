//
//  AddNewMovieController.m
//  Movies List
//
//  Created by Hassan El Desouky on 12/01/2021.
//

#import "AddNewMovieController.h"

@interface AddNewMovieController ()

@end

@implementation AddNewMovieController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)handleChooseImage:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)handleSave:(id)sender {
    UIImage *poster = self.posterImageView.image;
    NSString *movieTitle = self.titleLable.text;
    NSString *overview = self.overviewLable.text;
    NSDate *releaseDate = self.datePicker.date;

    Movie *movie = Movie.new;
    movie.image = poster;
    movie.title = movieTitle;
    movie.overview = overview;
    movie.releaseDate = releaseDate;

    [self dismissViewControllerAnimated:YES completion:^{
        [self.delegate addNewMovie:movie];
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.posterImageView.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
