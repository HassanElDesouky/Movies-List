//
//  Movie.h
//  Movies List
//
//  Created by Hassan El Desouky on 12/01/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *overview;
@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSDate *releaseDate;


@end

NS_ASSUME_NONNULL_END
