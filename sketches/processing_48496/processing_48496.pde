
//Rayniel Estrella | Final
//Nick Lally | Math, Programming, and Art

/*In editing my final, I wanted to be able to reset my sketch.
In turn, the reset fuction only resets the background.
See below for the code I wrote. Thanks again for everything.*/

float x,y, angle;
float reset;

void setup(){
  background(0);
  size (800,800);
  colorMode(HSB,360,100,100,100);
  smooth();
  noStroke();
}

void draw(){
  beginShape();
  for(int i=0; i<=360; i+=360/angle*4){
      x = cos(radians(i)) * 200 +width/2;
      y = sin(radians(i)) * 200 +height/3;
      fill(0);
      float ellSize = sin(y*x+angle)*100;
      ellipse(x,y,ellSize,ellSize);
  }
  endShape();
  
    beginShape();
  for(int i=0; i<=360; i+=360/angle*4){
      x = cos(radians(i)) * 200 +width/2;
      y = sin(radians(i)) * 550 +height/4;
      fill(0);
      float ellSize = sin(y*x+angle)*100;
      rect(x,y,ellSize,ellSize);
  }
  endShape();
 
       fill(360);
for(int x = 0; x < width; x+=20){
  for(int y = 0; y < height; y+=10){
    float ellSize = sin(y*x+angle);
    ellipse(x,y,ellSize,ellSize);
    
  }
}

for(int x = 0; x < width; x+=11){
  for(int y = 0; y < height; y+=12){
    float ellSize = sin(y*x+angle)*15;
    fill(341,80,85);
    ellipse(x,y,ellSize,ellSize);
  }
 }
 angle+=.1;
}

void mouseClicked(){
  reset();
  setup();
  draw();
}

void reset(){
  beginShape();
  for(int i=0; i<=360; i+=360/angle*4){
      x = cos(radians(i)) * 200 +width/2;
      y = sin(radians(i)) * 200 +height/3;
      fill(0);
      float ellSize = sin(y*x+angle)*100;
      ellipse(x,y,ellSize,ellSize);
  }
  endShape();
  
    beginShape();
  for(int i=0; i<=360; i+=360/angle*4){
      x = cos(radians(i)) * 200 +width/2;
      y = sin(radians(i)) * 550 +height/4;
      fill(0);
      float ellSize = sin(y*x+angle)*100;
      rect(x,y,ellSize,ellSize);
  }
  endShape();
 
       fill(360);
for(int x = 0; x < width; x+=20){
  for(int y = 0; y < height; y+=10){
    float ellSize = sin(y*x+angle);
    ellipse(x,y,ellSize,ellSize);
    
  }
}

for(int x = 0; x < width; x+=11){
  for(int y = 0; y < height; y+=12){
    float ellSize = sin(y*x+angle)*15;
    fill(341,80,85);
    ellipse(x,y,ellSize,ellSize);
  }
 }
 angle+=.1;
}

