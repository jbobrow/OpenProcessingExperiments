
float xpos;
float ypos;
float xspeed;
float yspeed;
//float xgravity;
//float ygravity;
float xdirection;
float ydirection;

void setup(){
  size(500, 500);
  noStroke();
  smooth();
  frameRate(60);
  
    xpos=random(0, width);
    ypos=random(0, height);
    
//    xspeed=24;
//    yspeed=30;
    
//    xgravity= xdirection;
//    ygravity= ydirection;
    
    xdirection=8;
    ydirection=12;
}

void draw(){
  background(255);
  fill(50, 80,100);
  ellipse(xpos, ypos, 15, 15);
  
  xpos += xdirection;
  ypos += ydirection;
  
  if(ypos >= height || ypos <= 0){
    ydirection *= -1;
  }
  if(xpos >= width || xpos <= 0){
    xdirection *= -1;
  }
  if(ypos <= height){
    ydirection *= 0.999;
  }
  if(xpos <= width){
    xdirection *= 0.999;
  }
}

