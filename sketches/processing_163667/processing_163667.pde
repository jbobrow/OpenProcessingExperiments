

float y =0.0;
void setup(){
  size(300,300);
}
void draw(){
  frameRate(30);
  background(y);
  y=y+0.5;
  rect (y,0,100,y);
  noStroke();
  rect (0,y,100,y);
  noStroke();
  rect (200,300-y,100,y);
  noStroke();
  if(y>300){
    y=0;
  }
  
}


