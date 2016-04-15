//
//  ViewController.m
//  UIStackView纯代码
//
//  Created by ma c on 16/4/15.
//  Copyright © 2016年 lu. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic, strong) UIStackView *verticalStackView;
@property (nonatomic, strong) UIStackView *horizontalStackView;

@property (nonatomic, strong) UIStackView *btnStackView;

@property (nonatomic, strong) UILabel *textLabel;

@property (nonatomic, strong) UIImageView *logoImageView;

@property (nonatomic, strong) UIButton *addStarBtn;

@property (nonatomic, strong) UIButton *removeStarBtn;

@end

@implementation ViewController

- (UIStackView *)verticalStackView {
    
    if (!_verticalStackView) {
        
        _verticalStackView = [[UIStackView alloc] init];
        _verticalStackView.axis = UILayoutConstraintAxisVertical;
        _verticalStackView.alignment = UIStackViewAlignmentCenter;
        _verticalStackView.distribution = UIStackViewDistributionEqualSpacing;
        _verticalStackView.spacing = 30;
        [_verticalStackView addArrangedSubview:self.textLabel];
        [_verticalStackView addArrangedSubview:self.logoImageView];
        [_verticalStackView addArrangedSubview:self.btnStackView];
    }
    return _verticalStackView;
}

- (UIStackView *)horizontalStackView {
    
    if (!_horizontalStackView) {
        
        _horizontalStackView = [[UIStackView alloc] init];
        _horizontalStackView.axis = UILayoutConstraintAxisHorizontal;
        _horizontalStackView.alignment = UIStackViewAlignmentCenter;
        _horizontalStackView.distribution = UIStackViewDistributionFillEqually;
        _horizontalStackView.spacing = 10;
    }
    return _horizontalStackView;
}

- (UIStackView *)btnStackView {
    
    if (!_btnStackView) {
        
        _btnStackView = [[UIStackView alloc] initWithArrangedSubviews:@[self.addStarBtn, self.removeStarBtn]];
        _btnStackView.axis = UILayoutConstraintAxisHorizontal;
        _btnStackView.alignment = UIStackViewAlignmentCenter;
        _btnStackView.distribution = UIStackViewDistributionEqualSpacing;
        _btnStackView.spacing = 10;
    }
    return _btnStackView;
}

- (UILabel *)textLabel {
    
    if (!_textLabel) {
        
        _textLabel = [[UILabel alloc] init];
        _textLabel.text = @"Do you like me?";
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _textLabel;
}

- (UIImageView *)logoImageView {
    
    if (!_logoImageView) {
        
        _logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
        _logoImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _logoImageView;
}

- (UIButton *)addStarBtn {
    
    if (!_addStarBtn) {
        
        _addStarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addStarBtn setTitle:@"add Star  " forState:UIControlStateNormal];
        [_addStarBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_addStarBtn addTarget:self action:@selector(addStarAction:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _addStarBtn;
}

- (UIButton *)removeStarBtn {
    
    if (!_removeStarBtn) {
        
        _removeStarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_removeStarBtn setTitle:@"remove Star" forState:UIControlStateNormal];
        [_removeStarBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_removeStarBtn addTarget:self action:@selector(removeStarAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _removeStarBtn;
}

- (void)addStarAction:(UIButton *)sender {
    
    UIImageView *starImgVw = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star"]];
    starImgVw.contentMode = UIViewContentModeScaleAspectFit;
    [self.horizontalStackView addArrangedSubview:starImgVw];
    [UIView animateWithDuration:0.25 animations:^{
        
        [self.horizontalStackView layoutIfNeeded];
    }];
}

- (void)removeStarAction:(UIButton *)sender {
    
    UIView *star = self.horizontalStackView.arrangedSubviews.lastObject;
    [self.horizontalStackView removeArrangedSubview:star];
    [star removeFromSuperview];
    [UIView animateWithDuration:0.25 animations:^{
        
        [self.horizontalStackView layoutIfNeeded];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.verticalStackView];
    
    [_verticalStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(20);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-200);
    }];
    [self.view addSubview:self.horizontalStackView];
    
    [_horizontalStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.verticalStackView.mas_bottom);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
