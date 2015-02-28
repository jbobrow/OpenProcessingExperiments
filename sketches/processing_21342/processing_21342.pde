
void setup(){
size(1000, 500);
}

float x = 0;
float y = 489;
float z = 1;
float a = 0;
float b = 50;
float c = 0;

void draw(){
  
  background(0);
  
  fill(255);
  ellipseMode(CENTER);
  arc(x,y,b,50,TWO_PI-PI/2,TWO_PI);//top moving half
  arc(x,y,b,50,0,PI/2);//bottom moving half
  arc(x,y,50,50,PI/2,TWO_PI-PI/2);//solid half
  stroke(255);
  fill(0);
  stroke(0);
  arc(x,y,c,50,PI/2,TWO_PI-PI/2);//sliver
  
  
  if (x > 1000) {
    x = 0;
    a = a + 1;
}
  if (x < 250) {z = 1;}
  if ((x > 501)&&(x < 749)) {z = -.5;}
  if ((x < 499)&&(x > 251)) { z = .5;}
  if (x > 750) {z = -1;}
  
  x = x + 1.5;
  y = y - z;
  b = (mouseY-250)/5;
  c = (250-mouseY)/5;
}

