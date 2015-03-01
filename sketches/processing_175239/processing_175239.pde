


float xpos;
float ypos;
  
float xspeed = random(1, 5);
float yspeed = 1;


void setup(){
  size(640, 400);
  background(0);
  smooth();
  stroke(0);
  xpos = 0;
  ypos = 25;
}

void draw(){
  
  for(int i = 0; i <= height; i+=50){
  line(0, i, width, i);
  strokeWeight(random(1, 2));
  stroke(random(255), random(255), random(255));
  fill(0);
  ellipse(xpos, ypos+(i+1), 20, 20);
  ellipse(xpos, ypos+(i+1), 5, 5);
  for(int j = 0; j <= 4 ;j++){
  if(ypos<i*j+10||ypos>i*j+40){
    yspeed*=-1;
  }
  }
  }
  
  xpos+=xspeed;
  ypos+=yspeed;
  
  if(xpos<0 || xpos>width){
    xspeed*=-1;
  }
  }
  
void mousePressed(){
  background(0);
}
 




