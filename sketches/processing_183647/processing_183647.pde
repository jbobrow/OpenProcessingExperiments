
// Based on Daniel Shiffman's Example 5-10: Zoog and conditionals Tutorial 
// Devin Spear 1/26/2015

Planet planet;
Planet planet2;
Planet planet3;

float x = 100;
float y = 100;
float px, py;

float xspeed = 15;
float yspeed = 2;

color c, c2, c3;

int X, Y;
int PX, PY;
int nX, nY;
int delay= 21;

void setup() {
  size(500,500);
  c= color(255,255,0);//yellow
  c2= color(199, 18, 18);//red
  c3= color(255,0,127);//pink
  planet= new Planet(mouseX, mouseY, pmouseX, pmouseY, c);
  planet2= new Planet(mouseX, mouseY, pmouseX, pmouseY, c2);
  planet3= new Planet(mouseX, mouseY, pmouseX, pmouseY, c3);
  smooth();
  
  X= width/2;
  Y= height/2;
  nX= X;
  nY= Y;
  
  
}

void draw() {
  planet.update();
  
  
  X+=(nX-X)/delay;
  Y+=(nY-Y)/delay;
 
  planet.display(int(x), int(y), int(px), int(py), c);
  //smileboy2.update();
  px= x;
  py= y;
  
  planet2.display(mouseX, mouseY, pmouseX, pmouseY, c2);


  planet3.display(X, Y, PX, PY, c3);
  PX= X;
  PY= Y;

  // Change the location of Zoog by speed
  //changing blue
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
class Planet{
  int a= 0;
  int x, y, px, py;
  color c0;
  int r,g,b;
  
  Planet(int tempX, int tempY, int tempPX, int tempPY, color c){
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
    ellipse(x, y, 100,100);
    fill(c);
    
    fill(c);
    ellipse(x+15, y-5, 10, 10);
    ellipse(x-15, y-5, 10, 10);
    noFill();
    stroke(c);// lips (60,60,60)
    strokeWeight(3);
    arc(x-5, y+20, 25, 25, HALF_PI, PI);
    arc(x-5, y+20, 25, 25, 0, HALF_PI);
    arc(x-5, y+25, 40, 15, -PI, 0);
    line(x+5, y-50, px+5, py-20);
    line(x, y-50, px, py-20);
    line(x-5, y-50, px-5, py-20);
    line(x+10, y-49, px+10, py-20);
    line(x-10, y-49, px-10, py-20);
    line(x+15, y-48, px+15, py-20);
    line(x-15, y-48, px-15, py-20);
    line(x+20, y-47, px+20, py-20);
    line(x-20, y-47, px-20, py-20);
    line(x+25, y-45, px+25, py-20);
    line(x-25, y-45, px-25, py-20);
    line(x+30, y-42, px+30, py-20);
    line(x-30, y-42, px-30, py-20);
    line(x+35, y-38, px+35, py-20);
    line(x-35, y-38, px-35, py-20);
    line(x+40, y-32, px+40, py-20);
    line(x-40, y-32, px-40, py-20);
//    stroke(c); //20,200,300
//    //body
//    fill(c);
//    //triangle
//    triangle(x, y, px-30, py+100, px+20, py+100);
//    
//    //head
//    fill(255);
//    stroke(c);
//    ellipse(x, y, 100,100);
//    strokeWeight(2);
//    //legs
//    line(x, y+50, px+20, py+150);
//    line(x-10, y+50, px-30, py+150);
//    //left arm
//    line(x+10, y+50, x+40, y+70);
//    line(x+40, y+70, x+15, y+90);
//    //right arm
//    line(x-70, y+20, x-10, y+50);
//    
//    fill(c);//60,600,300
//    ellipse(x+15, y, 6,17);
//    ellipse(x-15, y, 7, 16);
//    noFill();
//    stroke(c);// lips (60,60,60)
//    strokeWeight(3);
//    arc(x-2, y+23,11, 16, HALF_PI, PI);
//    arc(x-2, y+23, 20, 16, 0, HALF_PI);
    
 
    
  }
}



