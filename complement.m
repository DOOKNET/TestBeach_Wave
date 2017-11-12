% 用于计算补码
% 参数x：原始十进制数组，正负数皆可
% 参数N：输出的二进制补码最小位数，如果位数不够会根据x的取值范围自动扩展
% 输出值c：转换得到的二进制补码字符串数组
% 输出值n：实际输出的二进制补码位数
function [c,n] = complement(x, N)
    n = 0;
    if(nargin == 2)
        n = max(n, N);
    end
    a = max(x);
    if(a > 0) % max(x) = 127,则n = 8; max(x) = 128,则n = 9
        n = max(n, ceil(log2(a+1)) + 1);
    end
    a = min(x);
    if(a < 0) % min(x) = -128,则n = 8; min(x) = -129,则n = 9
        n = max(n, ceil(log2(-a)) + 1);
    end
    for i = 1 : length(x)
        if x(i) < 0
            x(i) = x(i) + 2^n;
        end
    end
    c = dec2bin(x, n);
end
