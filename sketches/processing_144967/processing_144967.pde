
//Konkuk University
//SOS iDesign
   
//Name: choi in seo
//ID: 201420113
 
int x=0;
int y=0;
int xSpeed=2;
int ySpeed=3;

void setup(){
  size(1028,960);
  smooth();
  background(10);
}
void draw(){
  background(0);
  x=x+xSpeed;
  y=y+ySpeed;
if ((x > width) || (x < 0)) {
    xSpeed = xSpeed * -1;
  }
 if ((y > height) || (y < 0)) {
    ySpeed = ySpeed * -2;
 }
stroke(225);
strokeWeight(3);
fill(255,223,140);
quad(x, y, 0, 0, 0, 0, width+x, height+y);
fill(206,242,121);
quad(x, y, 0, 0, 0, 0, width-x, height-y);
fill(178,235,244);
quad(x,y,width-x,width+x,height+y,height-y,width*0.8,height*0.8);
fill(209,178,255);
quad(x,y,width+x,width-x,height-y,height+y,width*0.8,height*0.8);
 
 
}
