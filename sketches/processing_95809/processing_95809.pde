
size(400, 400);
background(0);
colorMode(HSB, 255);
smooth();

for (int i=0;i<width;i=i+30) {
float h=map(i, 0, width, 0, 0);
stroke(h, 255, 255, 200);
line(width, i, i+200, 0);
line(i, width, 0, i+200);
line(width, i, i+200, 0);
line(i, width, 0, i+200);
line(width, i, i+200, 0);
line(i, width, 0, i+200);
line(width, i, i+200, 0);
line(i, width, 0, i+200);
line(width, i, i+200, 0);
line(i, width, 0, i+200);
line(width, i, i+200, 0);
line(i, width, 0, i+200);
line(width, i, i+200, 0);
line(i, width, 0, i+200);
line(height-200, i, 0, 200);
line(width+200, 0, 200, i);
}
for (int i=0; i<=width;i=i+5) {
float h=map(i, 0, width, 0, 255);
stroke(255,255,255,100);
line(0, i, i+10, height);
line(i, 0, width, i+10);
line(0, height-i, i+10, 0);
line(width, i, width-i, height);
}

for (int i=0; i<=width; i=i+5) {
stroke(255,255,255,100);
strokeWeight(3);
point(width/2, i);
}
if(mousePressed){
save("lazer en las estrellas.png");
}
