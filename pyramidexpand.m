function imgNext = pyramidexpand(imgPrev)
%pyramidexpand ��˹�������ϲ���
%   imgNext = pyramidreduce(imgPrev)
%       ����ֵ��
%           imgNext:  ���²�ͼ���ϲ������˲���ͼ��  
%       ������
%           imgPrev: �ϲ������ͼ��
%
%   ע��: 
%       - �߽紦����ʽ��ͼ���Ե��һ��Ӱ�죬���öԳƲ��߽Ϻ�
%
%   ���ߣ�����
%   ���䣺hujie#szangell.com
%   ��ַ��http://www.szangell.com/
%
% ================================================
%   ��־��
%       2017-11-13�����
%       2017-11-20���޸��˸�˹�˵����ɷ�ʽ�����
%       2017-11-24���޸��˱߽紦����ʽ�����öԳ����ز���
% ================================================
%   Copyright (c) 2017 Angell.Co.Ltd. All rights reserved.

[heightPrev, widthPrev] = size(imgPrev);
radiusFilter = 2; % �˲�����СΪ����
kernelFilter = pyramidgaussian(0.375, 2*radiusFilter+1);
heightNext = 2*heightPrev;
widthNext = 2*widthPrev;
imgNext = zeros(heightNext,widthNext);
for iRow = 1:heightNext
    for jCol = 1:widthNext
        for iFilter = -radiusFilter:radiusFilter
            rowPrevImg = (iRow + iFilter)/2;
            if(rowPrevImg - floor(rowPrevImg) > 0)
                continue;
            end
            if(rowPrevImg < 1)
                rowPrevImg = 2*1 - rowPrevImg;
            elseif(rowPrevImg > heightPrev)
                rowPrevImg = 2*heightPrev - rowPrevImg;
            end % ���öԳ����ز��б�
            for jFilter = -radiusFilter:radiusFilter
                colPrevImg = (jCol + jFilter)/2;
                if(colPrevImg - floor(colPrevImg) > 0)
                    continue;
                end
                if(colPrevImg < 1)
                    colPrevImg = 2*1 - colPrevImg;
                elseif(colPrevImg > widthPrev)
                    colPrevImg = 2*widthPrev - colPrevImg;
                end % ���öԳ����ز��б�
                imgNext(iRow, jCol) = imgNext(iRow, jCol) + ...
                    4*kernelFilter(iFilter+radiusFilter+1, jFilter+radiusFilter+1)...
                    *imgPrev(rowPrevImg, colPrevImg);
            end
        end
    end
end