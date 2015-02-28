
// Homework #8 of Jim Robert's CFA-757
// @ Carnegie Mellon University
// Zoe Lu copyright Spring 2012, Pittsburgh PA15213

// move your mouse around to change the stroke color
// click/hold your mouse to fill color
// no fill color when you release your mouse
// press 'S' to pause
// press 'R' to keep running
// press space bar to clear the canvas
// have fun

void setup(){
  size(400,400);
  noFill();
  background(255);
//  frameRate(5);
}

void draw(){
  drawCircles(random(width),random(height));
}

void drawCircles(float x,float y){
  float wd=width/3;
  while(wd>0){
    ellipse(x,y,wd,wd);
    wd-=15;
  }
}

void mousePressed(){
  fill(random(80,200),random(15,140),random(18,220));
}
void mouseReleased(){
  noFill();
}

void mouseMoved(){
//  float dis=dist(mouseX,mouseY,pmouseX,pmouseY);
//  if(dis>0){
    stroke(random(45,255),random(200,255),frameCount%255);
//  }
}
void keyPressed(){
  if(keyCode==' '){
    background(random(230,255));
  }
  if(keyCode=='S'){
    noLoop();
  }
  if(keyCode=='R'){
    loop();
  }
}
