
/*
 * Creative Coding
 * Week 3, 04 - spinning top: curved motion with sin() and cos()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch is the first cut at translating the motion of a spinning top
 * to trace a drawing path. This sketch traces a path using sin() and cos()
 *
 */
 Forma2 [] forma2 = new Forma2[500];
Forma [] forma = new Forma[500];
float x, y;      // current drawing position
float dx, dy;    // change in position at each frame
float rad;       // radius for the moving hand

void setup() {
  size(1000, 1000);


for(int i =0; i<forma.length; i++){
  forma[i] = new Forma (random(500,displayWidth-500), random(500,displayHeight-500));
}
for(int i =0; i<forma2.length; i++){
  forma2[i] = new Forma2 (random(500,displayWidth-500), random(500,displayHeight-500));
}
  
dx = 10;
dy = 10;


 
}


void draw() {
   
  // blend the old frames into the background
  //blendMode(BLEND);
  fill(0, 50);
  rect(0, 0, width, height);
  rad = radians(frameCount);
  for (int i=0; i <forma.length;i++){
  forma[i].mostrar();
  }
  for (int i=0; i <forma2.length;i++){
  forma2[i].mostrar();
  }
}
  
  class Forma {

  // calculate new position
  float x;
  float y;
 

Forma(float _x, float _y){
  x = _x;
  y = _y;
   x += dx;
   y += dy;

  
}
  
  void mostrar(){
  float max = 1;
  float min = 0.5;
  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  if (x > width-500 || x < 500) {
    dx = dx > 0 ? -random(min, max) : random(min, max);
  }

  if (y > height-500 || y < 500) {
    dy = dy > 0 ? -random(min, max) : random(min, max);
  }

  float bx = x + 30 * sin(rad);
  float by = y + 100 * cos(rad);

  //fill(180);

  float radius = 1000 * sin(rad*0.1);
  float handX = bx - radius * sin(rad*3);
  float handY = by - radius * cos(rad*3);

  stroke(255,50);
  line(bx, by, handX+20, handY+20);
  noStroke();
  fill(0,10);
  ellipse(handX+random(100), handY+random(100), 100, 100);
  //ellipse(handX, handY, 3, 3);
  //fill(0);
  //ellipse(bx,by, 3, 3);
}
  }
  
  class Forma2 {

  // calculate new position
  float x;
  float y;
 

Forma2(float _x, float _y){
  x = _x;
  y = _y;
   x += dx;
   y += dy;

  
}
  
  void mostrar(){
  float max = 1;
  float min = 0.5;
  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  if (x > width-500 || x < 500) {
    dx = dx > 0 ? -random(min, max) : random(min, max);
  }

  if (y > height-500 || y < 500) {
    dy = dy > 0 ? -random(min, max) : random(min, max);
  }

  float bx = x + 30 * sin(rad);
  float by = y + 100 * cos(rad);

  //fill(180);

  float radius = 1000 * sin(rad*0.1);
  float handX = bx - radius / sin(rad*3);
  float handY = by - radius / cos(rad*3);

  stroke(255,50);
  line(bx, by, handX, handY);
  noStroke();
  fill(0,50);
  ellipse(handX+random(100), handY+random(100), 10, 10);
  //fill(0);
  //ellipse(bx,by, 3, 3);
}
  }
  

