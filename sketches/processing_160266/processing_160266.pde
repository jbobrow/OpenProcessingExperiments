
float widt = 750;
float rad = 100;
float sSize = widt-rad*4;

void setup(){
  size(750,750);
  background(250);
  drawCircles();
}

void draw(){
}

void drawCircles(){
  float x1 = random(sSize/2)+rad;
  float x2 = random(sSize/2)+sSize/2+3*rad;
  float y1 = random(sSize)+rad;
  float y2 = random(sSize)+rad;
  boolean completes = random(1)>.5;
  
  drawCircleUnit(x1,y1,completes);
  drawCircleUnit(x2,y2,completes);
}

void drawCircleUnit(float x, float y, boolean completes){
  noStroke();
  fill(color(200,100,100));
  pushMatrix();
  translate(x,y);
  rotate(random(2*PI));
  if(completes){
    ellipse(0,0,rad,rad);
  }else{
    ellipse(-.75*rad,0,rad,rad);
    ellipse(.75*rad,0,rad,rad);
    fill(250);
    rect(-1.25*rad,-rad/2,.75*rad,rad);
    rect(rad/2,-rad/2,.8*rad,rad);
  }
  if(random(1)>.5){
    fill(250);
    rect(-rad/2-5,-rad/2,rad/2+5,rad);
  }
  if(random(1)>.5){
    fill(250);
    rect(0,-rad/2,rad/2+5,rad);
  }
  fill(50);
  rect(-rad/4,-.75*rad,rad/2,rad*1.5);
  popMatrix();
}

void mousePressed(){
  background(250);
  drawCircles();
}


