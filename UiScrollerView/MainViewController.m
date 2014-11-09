//
//  MainViewController.m
//  UiScrollerView
//
//  Created by wangweiwen on 14-11-9.
//  Copyright (c) 2014年 wangweiwen. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)loadView{
    [super loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, 320, 460)];
    tableview.backgroundColor = [UIColor blueColor];
    tableview.delegate = self;
    
    [self.view addSubview:tableview];
    
    UIScrollView *sview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
    sview.contentSize = CGSizeMake(320*5, 200);
    [sview flashScrollIndicators];
    float _x = 0;
    for (int index = 1 ; index < 6; index ++) {
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(_x + 0, 0, 320, 200)];
        NSString *imagename = [NSString stringWithFormat:@"image%d.jpg",index];
        imageview.image = [UIImage imageNamed:imagename];
        
        [sview addSubview:imageview];
        _x = _x + 320;
        
    }
    sview.delegate = self;
    
    
    sview.bounces = YES;
    sview.pagingEnabled = YES;
    sview.showsHorizontalScrollIndicator = NO; 
    sview.showsVerticalScrollIndicator = YES;
    sview.backgroundColor = [UIColor redColor];
    
    
    tableview.tableHeaderView = sview;
    
    UIPageControl *page = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 175, 320, 30)];
    page.numberOfPages = 4;
    page.tag = 101;
    [tableview addSubview:page];


}
#pragma mark -- scrollView的代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"scrollViewDidScroll");
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    NSLog(@"scrollViewWillBeginDragging");
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
 
    
    
   
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if ([scrollView isMemberOfClass:[UITableView class]]) {
        NSLog(@"UITableView is scrollViewDidEndDragging:%@",scrollView);
    }else{
        NSLog(@"scroll is scrollViewDidEndDragging:%@",scrollView);
        
        NSLog(@"pianyiliang is %f",scrollView.contentOffset.x);
        int current = scrollView.contentOffset.x/320;
        
        UIPageControl *page1 = (UIPageControl *)[self.view viewWithTag:101];
        page1.currentPage = current;
    }
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
}
//- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
//    
//}
//- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
//    
//}
//
//- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
//    
//}
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
