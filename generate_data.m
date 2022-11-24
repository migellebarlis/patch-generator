function generate_data(f)

if ~exist(strcat(f, '_p'), 'dir')
   mkdir(strcat(f, '_p'))
end

imds = imageDatastore(strcat(f, '\*.png'));

ims = readall(imds);

for i = 1:length(ims)
    pat = extract_patch(im2double(cell2mat(ims(i))), 128);
    imwrite(pat, strrep(cell2mat(imds.Files(i)), f, strcat(f, '_p')));
end

end