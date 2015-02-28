
void setup() {
  size(300,300);
  smooth();
  frameRate(100);
  colorMode(RGB, width);
}
int x=150;
void draw() {
  background(width);
  stroke(x,250,100);
  strokeWeight(x/20);
  fill(x,x/2,x);
  ellipse(x,height/2,30,30);         //right
  ellipse(width/2,x,30,30);          //down
  ellipse(width/2,height-x,30,30);   //up
  ellipse(width-x,height/2,30,30);   //left
  x++;
  if(x>width){
 ellipse(2*width-x,height/2,30,30);   //right
 ellipse(width/2,2*height-x,30,30);   //down
 ellipse(width/2,x-height,30,30);     //up
  ellipse(x-width,height/2,30,30);    //left
 if(x>1.5*width){
 x=width/2;
 x++;
 ellipse(x,x,30,30);
 }
 }
}
 



