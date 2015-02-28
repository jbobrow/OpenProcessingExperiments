

float colorValue;

float y=500;
float yspeed=PI/18.0;
float ydir=0;
float x=0;
void setup(){
  size(500,500);
}


void draw(){
 
  background(215,240,245);
  strokeWeight(10);
  stroke(326, 90, 89); 
  frameRate(12);
  
  fill(245,221,40);
  ellipse(250,50,66,66);
  
  fill(6,116,157);
  rect(width,height,0,0);

  
  
  smooth();
  stroke(255);
  ydir+=yspeed;
  for(int i=0;i<120;i++){
    y=map(cos(ydir+(i/7.0)),-1,1.25,350,width);
    rect(x+(i*22),y,y*25,y*22);
  }
}




