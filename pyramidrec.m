function imgRec = pyramidrec(imgDec)
%pyramidrec ��˹���������ع�
%   imgRec = pyramidrec(imgDec)
%       ����ֵ��
%           imgRec: �ع���ͼ�� 
%       ������
%           imgDec: ������˹�������ֽ�ͼ��
%
%   ���ӣ� 
%       img = imread('ngc6543a.jpg');
%       img = imresize(img, [512, 512]);
%       level = 5;
%       imgLaplacian = pyramiddec(img,level);
%       imgRec = pyramidrec(imgLaplacian);
%
%   ע��: 
%       - ������˹�����������ϸ�˹������������1
%
%   ���ߣ�����
%   ���䣺hujie#szangell.com
%   ��ַ��http://www.szangell.com/
%
% ================================================
%   ��־��
%       2017-11-16�����
%       2017-11-17���޸����ع�����
% ================================================
%   Copyright (c) 2017 Angell.Co.Ltd. All rights reserved.

level = size(imgDec, 1);
imgRec = imgDec{level};
for i = level:-1:2
    imgRec = imgDec{i-1} + pyramidexpand(imgRec);
end
