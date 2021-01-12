//
//  AddNewMovieController.h
//  Movies List
//
//  Created by Hassan El Desouky on 12/01/2021.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CreateNewMovieDelegate <NSObject>

- (void)addNewMovie:(Movie *)movie;

@end


@interface AddNewMovieController : UITableViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *titleLable;
@property (weak, nonatomic) IBOutlet UITextField *overviewLable;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;

@property (weak, nonatomic) id<CreateNewMovieDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
