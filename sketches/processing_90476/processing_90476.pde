
//Lauren Lee
//Creative Computing
//HW 4 Bouncing Circle
//2/20/13

int x; //where the circle is horizontally
int y; //where circle is veritcally
float xspeed = 5.3; //speed horizontally
float yspeed = 4.5; //speed vertically

//Background and variable establishment
void setup() {
  background(255);
  size(400, 400);
  frameRate(40);
  x=0;
  y=0;
}
 
//White background with pink square
void draw() {
  background(255);
  noStroke();
  fill(255,203,226);
  rect(125, 125, 150,150);

//Shape movement
   x += xspeed;
   y += yspeed;

//Shape makeup and color
  fill(mouseX, random(255), random(255), 30);
  ellipse (x, y, 30, 30);
  ellipse(x, y, x/4, y/4);
  ellipse(x,y, y/5, x/5);
  ellipse(x, y, y/3, y/3);
  ellipse(x,y, x/4.5, y/4.5);
 
//Movement constraints
  if((x>width) || (x<0)) {
    xspeed =-xspeed;
  }
  if((y>height) || (y<0)) {
  yspeed = -yspeed;
  }
  
//Translucency when shape is in pink box
  if((x>125) && (x<275) && (y>125) && (y<275)) {
    fill(255,203,226, 75);
    ellipse (x, y, 30, 30);
    ellipse(x, y, x/4, y/4);
    ellipse(x,y, y/5, x/5);
    ellipse(x, y, y/3, y/3);
    ellipse(x,y, x/4.5, y/4.5);
  } 

//Further constraints when mouse is pressed (shape will either be trapped in box or reflected)
   if(mousePressed==true) {
     fill(201,244,255);
     rect(125, 125, 150,150);
    if((x>125) && (x<275) && (y>125) && (y<275)) {
     xspeed = -xspeed;
     yspeed = -yspeed;
     fill(249,201,255,100);
     rect(125, 125, 150,150);
     //shape trapped in box makes box purple
  }
   }
  }
        


