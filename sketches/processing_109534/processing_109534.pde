
int m=10;
float r,g,b;
void setup(){
  size(600,600);
  background(250);
}

void draw(){
if(key=='1'){
r=random(255);
g=0;
b=0;}

if(key=='2'){
g=random(255);
r=0;
b=0;}

if(key=='3'){
b=random(255);
g=0;
r=0;}

if(key=='0'){
b=0;
g=0;
r=0;}
//set the color become random and key of changing color

if(m<0){
  m=10;}

if(m>600){
  m=10;}
}
//set up the maximum and minimum size of the circle

void mouseDragged(){
  fill(r,g,b);
  stroke(r,g,b);
  ellipse(mouseX,mouseY,m,m);}
//when dragging the mouse in the window,circle will be shown

void mousePressed(){
  fill(r,g,b);
  stroke(r,g,b);
  ellipse(mouseX,mouseY,m,m);}
//when pressing the mouse in the window,circle will be shown

void keyPressed() {
  if (key == ' ') {
    background(250);
    m=10;}
  if (key == '+') {
    m=m+5;}
  if (key == '-') {
    m=m-5;}
}
//when pressing the SPACE key in keyboard, window will be cleaned
//pressing'+'or'-'to increase or dicrease the size of circle


