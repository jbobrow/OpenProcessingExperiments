
//Catherine Steller Processing 2011
//Lesson Two Project

boolean movement = false;

int y = 0;
int x = 65;
int endLegs = 200;
int speed = 1;

 
void setup(){
  size(260,260);
  smooth();
}

void draw(){
  background(255);
  stroke(0);
  fill(y);
  
  for(int x = 50; x <= endLegs; x += 10){
    rect(x,y,5,40);
  }
  
  if (movement){
    y = y + speed;
  } else {
    y = y;
  }
  
  if ((y>215) || (y<0)){
    speed=speed*-1;
  }
 
}

void mousePressed(){
  if(mousePressed){
    movement = !movement;
  }
}

