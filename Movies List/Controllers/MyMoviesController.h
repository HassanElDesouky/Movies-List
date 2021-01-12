//
//  MyMoviesController.h
//  Movies List
//
//  Created by Hassan El Desouky on 12/01/2021.
//

#import <UIKit/UIKit.h>
#import "MovieCell.h"
#import "Movie.h"
#import "Helpers.h"
#import "AddNewMovieController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyMoviesController : UITableViewController<CreateNewMovieDelegate>

@end

NS_ASSUME_NONNULL_END
