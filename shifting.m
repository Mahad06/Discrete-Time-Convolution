function b = shifting(a)
% shifting = shift 1 unit to the right
% a = input sequence, b = output sequence
% add zero to the left and shift 1 unit the sequence. Last element is removed
b = zeros(1,length(a));
for i = 2:length(a)
    b(i) = a(i-1);
end


