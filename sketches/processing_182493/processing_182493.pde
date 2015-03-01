
// Based on Daniel Shiffman's Example 5-10: Zoog and conditionals Tutorial 
// Austin S. Lee 1/25/2015

Smileboy smileboy;
Smileboy smileboy2;
Smileboy smileboy3;


float x = 100;
float y = 100;
float px, py;
//float w = 60;
//float h = 60;
//float eyeSize = 16;

// Zoog has variables for speed in the horizontal and vertical direction.
float xspeed = 15; //3
float yspeed = 2; //1

color c, c2, c3;

int X, Y;
int PX, PY;
int nX, nY;
int delay= 21;




void setup() {
  size(600,600);  
  //smooth();
  c= color(60, 200, 255);
  c2= color(255, 110, 100);
  c3= color(20, 255, 100);
  smileboy= new Smileboy(mouseX, mouseY, pmouseX, pmouseY, c);
  smileboy2= new Smileboy(mouseX, mouseY, pmouseX, pmouseY, c2);
  smileboy3= new Smileboy(mouseX, mouseY, pmouseX, pmouseY, c3);
  smooth();
  
  X= width/2;
  Y= height/2;
  nX= X;
  nY= Y;
  
  
}

void draw() {
  smileboy.update();
  
  
  X+=(nX-X)/delay;
  Y+=(nY-Y)/delay;
 
  smileboy.display(int(x), int(y), int(px), int(py), c);
  //smileboy2.update();
  px= x;
  py= y;
  
  smileboy2.display(mouseX, mouseY, pmouseX, pmouseY, c2);


  smileboy3.display(X, Y, PX, PY, c3);
  PX= X;
  PY= Y;

  // Change the location of Zoog by speed
  x = x + xspeed;
  y = y + yspeed;

  // An IF statement with a logical OR determines if Zoog has reached either the right or left edge of the screen.  
  // When this is true, we multiply speed by Ð1, reversing ZoogÕs direction!
  // Identical logic is applied to the y direction as well.
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }

  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }

  //background(255);  
  ellipseMode(CENTER);
  rectMode(CENTER); 

}

void mouseMoved(){
  nX= mouseX;
  nY= mouseY;
}
class Smileboy{
  int a= 0;
  int x, y, px, py;
  color c0;
  int r,g,b;
  
  Smileboy(int tempX, int tempY, int tempPX, int tempPY, color c){
    x= tempX;
    y= tempY;
    px= tempPX;
    py= tempPY;
    c0= c;
    
  }
  
  void update(){
    background(10); //10
    smooth();
    frameRate(30);
   // c0= color(r, g, b);
  }
  void display(int x, int y, int px, int py, color c){
    noCursor();
    c= c0;
    ellipseMode(CENTER);
    rectMode(CENTER);
    stroke(c); //20,200,300
    //body
    fill(c);
    //triangle
    triangle(x, y, px-30, py+100, px+20, py+100);
    
    //head
    fill(255);
    stroke(c);
    ellipse(x, y, 100,100);
    strokeWeight(2);
    //legs
    line(x, y+50, px+20, py+150);
    line(x-10, y+50, px-30, py+150);
    //left arm
    line(x+10, y+50, x+40, y+70);
    line(x+40, y+70, x+15, y+90);
    //right arm
    line(x-70, y+20, x-10, y+50);
    
    fill(c);//60,600,300
    ellipse(x+15, y, 6,17);
    ellipse(x-15, y, 7, 16);
    noFill();
    stroke(c);// lips (60,60,60)
    strokeWeight(3);
    arc(x-2, y+23,11, 16, HALF_PI, PI);
    arc(x-2, y+23, 20, 16, 0, HALF_PI);
    
 
    
  }
}


