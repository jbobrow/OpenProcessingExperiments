
// kate parsons // lesson 2 // 2011 //


float x = 100;
float y = 100;
int change = 1;
int circleX = 0; 
int circleY = 100;
int speed = 1;

void setup() { 
  size(200,200);
  smooth();
}
void draw() { 
  
  x = x + speed;
  if ((x>width) || (x<0)){
    speed = speed*-1;
  }
  
  background(250,177,249); 
  stroke(0); 
  fill(252,252,69); 
  ellipse(x,y,width/5,height/5);
  
  stroke (0);
  fill(69,174,252);
  ellipse(x-5,y-5,10,10);
  
  stroke(0);
  fill(69,174,252);
  ellipse(x+5,y-5,10,10);

  circleX = circleX + 1;
}

void mousePressed(){
  stroke(0);
  circleX = circleX + 5;
  circleY = circleY + 5;
}

