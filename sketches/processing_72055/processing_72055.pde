
// Gravity Simulation

float x=100; //x location of square
float y=0; //y location of square

float speed=0; //speed of square
float gravity=.1; //acceleration

void setup(){
  size(200,200);
}

void draw(){
  background(255);
  
  //Draw the Square
  fill(0);
  noStroke();
  rectMode(CENTER);
  rect(x,y,10,10);
  
  //Add speed to location
  y=y+speed;
  
  //Add gravity to speed
  speed=speed+gravity;
  
  //If square reaches bottom, reverse speed
  if(y>height){
    speed=speed*-.95;
  }
}

