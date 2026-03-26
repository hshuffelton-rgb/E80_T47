%MADE FOR E80 LAB 7 By "The Big Continental" -Hal s, 3/25/26
%Takes x,y data, and corners to scale image to fit map
function xyOverlay(x,y,corner00,cornerNM)
X=[corner00(1),cornerNM(1)];
Y=[corner00(2),cornerNM(2)];
clf
scatter(x,y,'filled')
% plot data to define axis
hold on

C = imread('ParsonsMap.png');
image(X,Y,C)
%Load and plot img
scatter(x,y,'filled')
%Plot data again, over img