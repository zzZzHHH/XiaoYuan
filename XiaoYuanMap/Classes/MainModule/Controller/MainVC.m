//
//  MainVC.m
//  XiaoYuanMap
//
//  Created by 周立贺 on 17/7/12.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#define ScreenSize [UIScreen mainScreen].bounds.size
#define IsIphone6P ScreenSize.width==414
#define IsIphone6 ScreenSize.width==375
#define IsIphone5S ScreenSize.height==568

#define Max(iphone6)  (IsIphone6P?iphone6+0.4:(IsIphone6?iphone6:(IsIphone5S?iphone6-0.2:iphone6-0.2)))

#import "MainVC.h"

@interface MainVC () <BMKMapViewDelegate,BMKLocationServiceDelegate>

@property (nonatomic, strong) BMKLocationService *locService;

@property (nonatomic, strong) BMKMapView* mapView;

@property (nonatomic,strong)BMKPointAnnotation *point;




@end

@implementation MainVC

- (void)viewDidLoad {
    
    [super viewDidLoad];

    //地图配置
    [self setMap];
    
    //返回按钮
    [self addReturnBtn];
    
    [self removeReturnBtn];
    
    BMKPointAnnotation * point = [[BMKPointAnnotation alloc]init];

    self.point = point;
}

#pragma mark - 返回按钮
- (void)addReturnBtn{
    
    CGFloat x = [UIScreen mainScreen].bounds.size.width - 50;
    CGFloat y = 40;
    CGFloat wh = 30;
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"退出"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(returnClick) forControlEvents:UIControlEventTouchDown];
    btn.frame = CGRectMake(x, y, wh, wh);
    [self.view addSubview:btn];
}

//返回按钮点击
- (void)returnClick{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 地图相关设置
- (void)setMap{
    
    BMKMapView* mapView = [[BMKMapView alloc]init];
    self.mapView = mapView;
    self.view = mapView;
    mapView.delegate =self;
    
    /// 当前地图类型
    self.mapView.mapType = 1;
    /// 当前地图等级
    [self.mapView setZoomLevel:Max(18.2)];
    self.mapView.rotation = 168;
//    self.mapView.gesturesEnabled = NO;
    self.mapView.rotateEnabled = NO;
    /// 图层设置
    CLLocationCoordinate2D coordss[2] = {0};
    coordss[0].latitude = 41.928731;
    coordss[0].longitude = 123.45923;
    coordss[1].latitude = 41.936214;
    coordss[1].longitude = 123.466776;
    BMKCoordinateBounds bound;
    bound.southWest = coordss[0];
    bound.northEast = coordss[1];
    BMKGroundOverlay* ground;
    ground = [BMKGroundOverlay groundOverlayWithBounds:bound icon:[UIImage imageNamed:@"3333"]];
    [self.mapView addOverlay:ground];
    
    /// 中心点设置
    BMKCoordinateRegion region;
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 41.932511;
    coordinate.longitude = 123.462968;
    region.center = coordinate;//中心点
    [self.mapView setRegion:region animated:YES];
    
    ///精度圈去掉
    BMKLocationViewDisplayParam *displayParam = [[BMKLocationViewDisplayParam alloc]init];
    displayParam.isAccuracyCircleShow = false;
    [_mapView updateLocationViewWithParam:displayParam];
    
    ///定位服务
    BMKLocationService *locService = [[BMKLocationService alloc]init];
    locService.delegate = self;
    self.locService = locService;
    [locService startUserLocationService];
    self.mapView.showsUserLocation = YES;
    
    ///添加大头针
    [self addAnn];

}

#pragma mark - 显示/隐藏按钮
- (void)removeReturnBtn{
    
    CGFloat x = [UIScreen mainScreen].bounds.size.width - 50;
    CGFloat y = 40 + 50;
    CGFloat wh = 30;
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"标识"] forState:UIControlStateNormal];
   
    [btn addTarget:self action:@selector(removeClick:) forControlEvents:UIControlEventTouchDown];
    btn.frame = CGRectMake(x, y, wh, wh);
    [self.view addSubview:btn];
}

- (void)removeClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected) {
        
        [self.mapView removeAnnotations:self.mapView.annotations];
    } else {
        
        ///添加大头针
        [self addAnn];
    }

}
//添加大头针
- (void)addAnn{
    [self setUpAnnWithTitle:@"运动场" Latit:41.93063692455699 Long:123.46494181479048];
    [self setUpAnnWithTitle:@"篮球场" Latit:41.9306704654951 Long:123.4635674073602];
    [self setUpAnnWithTitle:@"图书馆" Latit:41.934125086949955 Long:123.46301045794402];
    [self setUpAnnWithTitle:@"超市" Latit:41.931126620489266 Long:123.46204028799325];
    [self setUpAnnWithTitle:@"教学楼" Latit:41.93344759352446 Long:123.46110605026287];
    [self setUpAnnWithTitle:@"实验楼" Latit:41.93405800871638 Long:123.46020774475289];
    [self setUpAnnWithTitle:@"食堂" Latit:41.93187792743293 Long:123.46204028799325];
    [self setUpAnnWithTitle:@"办公楼" Latit:41.93421228854735 Long:123.46104316887717];
    [self setUpAnnWithTitle:@"礼堂" Latit:41.932857296312356 Long:123.46042333807527];
    [self setUpAnnWithTitle:@"A座" Latit:41.931716933838416 Long:123.46125876219956];
    [self setUpAnnWithTitle:@"B座" Latit:41.93135469675392 Long:123.46089045694048];
    [self setUpAnnWithTitle:@"C座" Latit:41.93089183524098 Long:123.46145638941177];
    [self setUpAnnWithTitle:@"D座" Latit:41.93050946883013 Long:123.46121384692407];
    [self setUpAnnWithTitle:@"E座" Latit:41.93063692455699 Long:123.46263316962983];
    [self setUpAnnWithTitle:@"F座" Latit:41.930247848376396 Long:123.46233672881154];
    [self setUpAnnWithTitle:@"北门" Latit:41.93564103607433 Long:123.46227384742583];
    [self setUpAnnWithTitle:@"南门" Latit:41.92915439734301 Long:123.46336079709292];
}

- (void)setUpAnnWithTitle:(NSString *)title Latit:(CLLocationDegrees)latit Long:(CLLocationDegrees)longs{
    
    BMKPointAnnotation *point1 = [[BMKPointAnnotation alloc]init];
    
    point1.coordinate = CLLocationCoordinate2DMake(latit, longs);
    
    point1.title = title;
    
    [self.mapView addAnnotation:point1];
}


#pragma mark - delegate
//实现相关delegate 处理位置信息更新
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation{
    
}

//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    [self.mapView updateLocationData:userLocation];
}

//图层代理
- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id <BMKOverlay>)overlay{
    
    if ([overlay isKindOfClass:[BMKGroundOverlay class]])
    {
        BMKGroundOverlayView* groundView = [[BMKGroundOverlayView alloc] initWithOverlay:overlay];
        
        groundView.backgroundColor = [UIColor redColor];
        
        return groundView;
    }
    return nil;
}

//大头针代理方法
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        BMKPinAnnotationView *newAnnotationView;
        if ([annotation.title  isEqual: @"集合地"]){
            
           newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"jihe"];
        }else{
        
            newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
        }
        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;

        ((BMKPinAnnotationView*)newAnnotationView).image = [UIImage imageNamed:annotation.title];

        newAnnotationView.animatesDrop = NO;// 设置该标注点动画显示

        newAnnotationView.paopaoView = [[BMKActionPaopaoView alloc] initWithCustomView:[[UIView alloc]init]];
        
        return newAnnotationView;
    }
    return nil;
}

- (void)mapView:(BMKMapView *)mapView onClickedMapBlank:(CLLocationCoordinate2D)coordinate {
    
    self.point.coordinate = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude);
    
    self.point.title = @"集合地";
    
    [self.mapView addAnnotation:self.point];
}
@end
