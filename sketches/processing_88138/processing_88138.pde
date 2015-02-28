
void setup(){
  size (900,600,P3D);
  background(90);
  strokeWeight(0);
  float centrX = width/2;
  float what = random(200,500);
  float centrY = height/2;
  

}  
void draw(){
 
int step = 15;
float lastx = -999;
float lasty = -999;
float ynoise = random(10);
float y;
background(90);
for (int x=20; x<=900; x+=step) {
y = 15 + noise(ynoise) * 300 ;



if (lastx > -999) {
triangle(x, y, lastx, lasty+mouseX,mouseX,mouseY);
rotateX(10+mouseX);
}
  if (mouseX<=250) {
fill (#F7FF27,80);}
else if (mouseX<=500) {
fill (#00CE81,80);}
else if (mouseX<=700) {
fill (#9471FF,80);}
else {
  fill (#F74DE7,70);}
lastx = x;
lasty = y;
ynoise += 0.90;
}
}
