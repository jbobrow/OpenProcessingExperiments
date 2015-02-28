
float rsize = 100.0;
int angle;
int speed;
float rcolor = 0.0;

void setup() {
  size(500,500);
  smooth();
  background(255);
  noStroke();
}

void draw() {
  
  angle = angle + 1;
  speed = speed + 8;
  
  if(rcolor < 200){
    rcolor = rcolor + 0.2;
  }
  
  fill(255,rcolor,rcolor,10);
  
  if(rsize > 1){
    rsize = rsize - 0.1;
  }
  
  pushMatrix();
  
  translate(width/2,height/2);
  
  rotate(radians(angle+speed));
  
  rect(0,0,rsize,rsize);
  
  popMatrix();
  
}


