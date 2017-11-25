function filter = pyramidgaussian(a, sizeFilter)
%pyramidgaussian 金字塔的低通滤波器
%   filter = pyramidgaussian(a, sizeFilter)
%       返回值：
%           filter:  生成的滤波器核
%       参数：
%           a: 滤波器生成参数，一般设为0.375
%           sizeFilter: 滤波器大小
%
%   注意: 
%       - 下层图像大小是上层图像大小的一半
%
%   编者：胡杰
%   邮箱：hujie#szangell.com
%   网址：http://www.szangell.com/
%
% ================================================
%   日志：
%       2017-11-13：完成
%       2017-11-20：修改了高斯核的生成方式与参数
%       2017-11-24：修改了边界处理方式，采用对称像素补边
% ================================================
%   Copyright (c) 2017 Angell.Co.Ltd. All rights reserved.

filterCol = zeros(sizeFilter, 1);
filterCol(1:end) = [1/4-a/2; 1/4; a; 1/4; 1/4-a/2];
filterRow = filterCol';
filter = filterCol*filterRow;