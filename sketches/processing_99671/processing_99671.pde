
size(800,600);
smooth ();
fill (246,31,160);
float scaleVal = 22.0;
float angleInc = PI/28.0;
float angle = 3.5;
for (int offset = -9; offset < width +15; offset += 7){
for (int y =0; y <= height; y +=2) {
float x = offset + (sin(angle) *scaleVal);
noStroke ();
ellipse (x,y,10,10);
point (x, y);
angle +=angleInc;
}
angle +=PI;
}


