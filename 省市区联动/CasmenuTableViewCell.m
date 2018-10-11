//
//  CasmenuTableViewCell.m
//  省市区联动
//
//  Created by jx on 2018/10/11.
//  Copyright © 2018年 jx. All rights reserved.
//
#define COLORWITHRED(_redNum_,_greenNum_,_blueNum_,_alpha_)  [UIColor colorWithRed:_redNum_/255.0 green:_greenNum_/255.0  blue:_blueNum_/255.0  alpha:_alpha_]
#define COLOR(_redNum_,_greenNum_,_blueNum_) COLORWITHRED(_redNum_, _greenNum_, _blueNum_, 1)
#import "CasmenuTableViewCell.h"
#import "Masonry.h"

@interface CasmenuTableViewCell()
@property (nonatomic,strong)UILabel *labelContent;
@end
@implementation CasmenuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setContent];
    }
    return self;
}
-(void)setContent{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.labelContent = [[UILabel alloc]init];
    [self.contentView addSubview:self.labelContent];
    self.labelContent.font = [UIFont systemFontOfSize:14.f];
    [self.labelContent mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView.mas_leading).offset(25);
        make.top.equalTo(self.contentView.mas_top).offset(17);
        make.height.equalTo(@14);
        make.trailing.equalTo(self.contentView.mas_trailing);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-16);
    }];
    UILabel * heng_line = [[UILabel alloc]init];
    heng_line.backgroundColor = COLOR(233, 233, 233);
    [self.contentView addSubview:heng_line];
    [heng_line mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView.mas_leading);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.trailing.equalTo(self.contentView.mas_trailing);
        make.height.equalTo(@0.5);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
