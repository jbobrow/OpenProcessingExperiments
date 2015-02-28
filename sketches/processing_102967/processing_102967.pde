
size(500,500);
noStroke();
background(0);
colorMode(RGB,200,200,200);

for (int i=0;i<width;i+=25) {
for (int j=0;j<height;j+=25) {
fill(i,j,0);
rect(i,j,25,25);
 }
}
