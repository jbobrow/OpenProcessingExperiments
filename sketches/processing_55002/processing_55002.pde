
int arraylength = 40;
int [] radiusX = new int [arraylength];
int [] locationX = new int [arraylength];
int [] locationY = new int [arraylength];
int [] dx = new int[arraylength];
int [] dy = new int[arraylength];

void setup() {
  smooth();
  size(400,400);
  background(#02271F);
  dySetup();
  dxSetup();
  locationX();
  locationY();
}
float y =0.0;
float i=0.0;
void draw() {
  drawLines();
      ellipse (i+25,100,30,30);
      fill(#29B99B);
    if (y>300){
    y=0;
  }
  if (i>300){
    i=0;
  }else{
    i+=50;
  }
     ellipse (i+20,300,30,30);
      fill(#C11D23);
    if (y>300){
    y=0;
  }
  if (i>300){
    i=0;
  }else{
    i+=50;
  }

}

void dySetup() {
  for (int i = 0; i<arraylength; i++) {
    dy[i] = int(random(5,500));
} }
 
void dxSetup() {
  for (int i = 0; i<arraylength; i++) {
    dx[i] = int(random (10,500));
} }
void locationX() {
  for ( int i = 0; i < locationX.length; i ++) {
    locationX[i] = int(random(0+radiusX[i],width-radiusX[i]));
} }
 
void locationY() {
  for ( int i = 0; i < locationY.length; i ++) {
    locationY[i] = int(random(0+radiusX[i],height-radiusX[i]));
} }
 

void drawLines() {
  smooth ();
color from = color(#DFCBFF);
color to = color(#0A3C5A);
color interA = lerpColor(from, to, .93);
color interB = lerpColor(from, to, .66);
  
if (mousePressed == true){
    strokeWeight(3);}else{
  strokeWeight(.1);}
  if (mousePressed == true){
  stroke(from,to);}else{
    stroke(interB,from,interA);}
  
  for(int i = 0; i<arraylength; i ++) {
    point(locationX[i], locationY[i]);
    for(int n = 0; n + i < arraylength; n = n + 1) {
      line(locationX[i], locationY[i], locationX[i+n],locationY[i+n]);
} } }
