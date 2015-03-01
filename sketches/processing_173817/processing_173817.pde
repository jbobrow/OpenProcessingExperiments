

float y = 100;
int sen = 0;
 
void setup() {
  size(640, 360);  
  stroke(255);     
  noLoop();
  y = height*0.5;
  frameRate(20);
}

void draw() { 
  background(0);  
  for(int i = 0; i <= sen; i+=20){
  stroke(255);
  //line(0, y+i, width, y+i);
  noStroke();
  fill(random(255), random(255), random(255), 170);
  float pos = random(640);
  ellipse(pos, y+i, 100, 20);
  ellipse(pos-30, y+i-5, 5, 5);
  triangle(pos+45, y+i, pos+60, y+i-15, pos+60, y+i+15);
  }  
  
  y = y - 1; 
  if (y < 0) { 
    y = height; 
    sen+=10;
  } 
} 

void mousePressed() {
  if(mouseButton == LEFT){
  loop();
  }else if(mouseButton ==RIGHT){
    noLoop();
  }
}
  



