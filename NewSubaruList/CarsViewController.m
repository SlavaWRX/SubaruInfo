//
//  CarsViewController.m
//  NewSubaruList
//
//  Created by Viacheslav Goroshniuk on 26.05.17.
//  Copyright © 2017 Viacheslav Goroshniuk. All rights reserved.
//

#import "CarsViewController.h"
#import "CollectionViewCell.h"

@interface CarsViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    NSArray *cars;
}

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIView *darkView;
@property (weak, nonatomic) IBOutlet UIButton *roundButton;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation CarsViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Cars" ofType:@"plist"];
    cars = [[NSArray alloc] initWithContentsOfFile:path];
    

    
    UICollectionViewFlowLayout* viewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(13, 14, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:viewFlowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:collectionView];
                                        
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [cars count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
     
    for (int i = 0; i < cars.count; i++) {
        
        CollectionViewCell* viewCell = [[[NSBundle mainBundle] loadNibNamed:@"CollectionViewCell" owner:self options:nil] objectAtIndex:0];
        viewCell.imageCellView.image = [UIImage imageNamed:cars[i][@"Name"]];
        
    }
    
    return cell;
}

















@end
