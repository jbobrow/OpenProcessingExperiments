
//array for each object -> can alter how many of each object 
Ball[] balls = new Ball[4];
Rect[] rects = new Rect[4];
Square[] squares = new Square[4];

void setup(){
  size(640, 480);
  colorMode (HSB);
  //initialising the objects array
  //using variable i, instead of hard coded numbers
  //using .length relates back to the data set at the top
  for (int i=0; i< balls.length; i++){
  //initialises each object at random size  
  balls[i]=new Ball(random(30,60), color(random(0,255), random(0,255), random(0,255)));
  }
  for (int i=0; i< rects.length; i++){
  rects[i]=new Rect(random(30,60), color(random(0,255), random(0,255), random(0,255)));
  }
  for (int i=0; i< squares.length; i++){
  squares[i]=new Square(random(30,60), color(random(0,255), random(0,255), random(0,255)));
  }
}

void draw(){
  background(0);
  //continuously loops through the objects array
  for(int i=0; i< balls.length; i++){
  // . syntax to call the fuctionality from the classes
  balls[i].descend();
  balls[i].display();
  balls[i].bottom();
  }
  for(int i=0; i< rects.length; i++){
  rects[i].descend();
  rects[i].display();
  rects[i].bottom();
  }
  for(int i=0; i< squares.length; i++){
  squares[i].descend();
  squares[i].display();
  squares[i].bottom();
  }
  }

class Ball{
  //class data
  float x;
  float y;
  float yspeed;
  float diameter;
  color c;
  
  //constructors
  //contructor arguments = variables that are intialised in main code
  Ball(float tempD, color tempC){
    x=random(width);
    y=0;
    yspeed = random(0.5, 3.5);
    diameter = tempD;
    c= tempC;
  }
    //class methods
  void descend(){
    y = y + yspeed;
    x = x + random(-2,2);
  }
  
  void display(){
    noStroke();
    ellipse(x, y, diameter, diameter);
  }
  void bottom(){
    if(y > height){
     y = 0;
   } 
}
}

class Rect{
  float x;
  float y;
  float yspeed;
  float diameter;
  color c;
  
  Rect(float tempD, color tempC){
    x=random(width);
    y=0;
    yspeed = random(0.5, 3.5);
    diameter = tempD;
    c= tempC;
    
  }
  
  void descend(){
    y = y + yspeed;
    x = x + random(-2,2);
  }
  
  void display(){
    noStroke();
    rect(x, y, diameter, diameter/2.5);

  }
  void bottom(){
    if(y > height){
     y = 0;
   } 
}
}
class Square{
  float x;
  float y;
  float yspeed;
  float diameter;
  color c;

  Square(float tempD, color tempC){
    x=random(width);
    y=0;
    yspeed = random(0.5, 3.5);
    diameter = tempD;
    c= tempC;
  }
  
  void descend(){
    y = y + yspeed;
    x = x + random(-2,2);
  }
  
  void display(){
    noStroke();
    rect(x, y, diameter, diameter);

  }
  void bottom(){
    if(y > height){
     y = 0;
   } 
}
}


