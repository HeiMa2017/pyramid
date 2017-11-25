function filter = pyramidgaussian(a, sizeFilter)
%pyramidgaussian �������ĵ�ͨ�˲���
%   filter = pyramidgaussian(a, sizeFilter)
%       ����ֵ��
%           filter:  ���ɵ��˲�����
%       ������
%           a: �˲������ɲ�����һ����Ϊ0.375
%           sizeFilter: �˲�����С
%
%   ע��: 
%       - �²�ͼ���С���ϲ�ͼ���С��һ��
%
%   ���ߣ�����
%   ���䣺hujie#szangell.com
%   ��ַ��http://www.szangell.com/
%
% ================================================
%   ��־��
%       2017-11-13�����
%       2017-11-20���޸��˸�˹�˵����ɷ�ʽ�����
%       2017-11-24���޸��˱߽紦��ʽ�����öԳ����ز���
% ================================================
%   Copyright (c) 2017 Angell.Co.Ltd. All rights reserved.

filterCol = zeros(sizeFilter, 1);
filterCol(1:end) = [1/4-a/2; 1/4; a; 1/4; 1/4-a/2];
filterRow = filterCol';
filter = filterCol*filterRow;