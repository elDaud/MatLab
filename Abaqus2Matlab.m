s = fileread('Abaqus.inp');     % save Abaqus inp file in current directory and change name here
q = split(s,'*');
h = strfind(s,'*');
k = strfind(s,'*Node');
m = strfind(s,'*Element');
elementStr = q{find(h==m(1))+1};
elementStr = split(elementStr, newline);
elem = zeros(length(elementStr)-2,9);
for i = 2: length(elementStr)-1
    a = str2double(string(split(elementStr(i,:))));
    a(isnan(a)) = [];
    elem(i-1,:) = a';
end
    
nodeStr = q{find(h==k(1))+1};
nodeStr = split(nodeStr, newline);
nodes = zeros(length(nodeStr)-2,4);
for i = 2: length(nodeStr)-1
    a = str2double(string(split(nodeStr(i,:))));
    a(isnan(a)) = [];
    nodes(i-1,:) = a';
end

clearvars -except elem nodes
