
float y=0.0;
float x=0.0;
float x1 = random(20, 220);
float y2 = 140;
float z3 = 70;

void setup(){
  size(250,250);
  smooth();
}

void draw(){
  stroke(x1, y2, z3);
  y+=0.5;
  line(y,x,y,250);
  line(x,y,250,y);
  if(y>250){
  y=0;
  } 
}

void mouseClicked(){
  x1 = 125;
  y2 = random(10, 240);
  z3 = 30;
}

