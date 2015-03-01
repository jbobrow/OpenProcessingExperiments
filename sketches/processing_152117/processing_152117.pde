
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
int num = 4;
float x [];
float y[];
float dx[];
float dy[];
float bx[];
float by[];
float rad ;
float radius;

void setup() {
  size(500, 500);
  fill(0);

   x = new float[num];
  y = new float[num];
  dx = new float[num];
  dy = new float[num];
  bx = new float[num];
  by = new float[num];


 for (int i=0; i< num; i++){
  x[i] =  width/2;
  y[i] =  height/2;
  dx[i] = random(-.2, .2);
  dy[i] = random(-.2, .2);

  bx[i] = 0;
  by[i] = 0;
  }
}
  
  




void draw() {
  // blend the old frames into the background
  //blendMode(BLEND);
  fill(red, green, blue, 3);
  rect(0, 0, width, height);
  rad = radians(frameCount);

  // calculate new position
  for (int i = 1; i<num; i++){
  x[i] += dx[i];
  y[i] += dy[i];

  float max = 1.5;
  float min = 0.5;

  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  if (x[i] > width-120 || x[i] < 120) {
    dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
  }

  if (y [i]> height-120 || y[i] < 120) {
    dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
  }

 
 if (i % 2 == 1){
     bx[i] = x[i]+100 * sin(rad);
     by[i] =  y[i] + 100 * cos(rad);
     
     
  //fill(180);

  float radius = 80 * sin(rad*.05);
  float handX = bx[i] + radius * sin(rad*4);
  float handY = by[i] + radius * cos(rad*5);

 
  strokeWeight(1);
  fill(blue, green, red, 180);
  line(bx[i], by[i], handX, handY);
  ellipse(handX, handY,4, 4);
  }
  else{
      bx[i] = x[i]+180 * sin(rad*.03);
     by[i] = y[i] + 180 * cos(rad*.03);
     
  fill( 20);

  float radius = 50 * sin(rad*.1);
  float handX = bx[i] + radius * cos(rad*3);
  float handY = by[i] + radius * cos(rad*3);
   stroke(blue, green, red);
 
  ellipse(handX, handY, 8, 8);
  }
  }


  if (keyPressed == true && key =='s'){
    saveFrame("Janeen3_04.jpg");
  }
}
// change the stroke color with rollover
void mouseMoved() {
    red = map(mouseX, 0, width, 0, 255);
    green = map(mouseY, 0, height, 0, 255);
    blue = map(mouseX+mouseY, 0, width+height, 255, 0);
}


