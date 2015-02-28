
void setup(){
  size(300,300);
  background(255);
  colorMode(HSB,width);
  smooth();
  frameRate(15);
}
int x=0;
void draw(){
  for(int x=0;x<=100;x+=5){
  noStroke();
  fill(3*x);
  rect(width/3,height/3,100-x,100-x);
  }
  x++;
  if(x>100){
    fill(x,width,width);
    rect(width/3,height/3,200-x,200-x);
    x+=5;
  }//next50 frames
  if(x>150){
    noStroke();
    ellipse(2*x-300,7*height/8,width/8,height/8);
    x++;
  }//next50 frames
  if(x>200){
    rect(width/3,height/3,width-x,height-x);
    x++;
  }//till300 frames
  if(x>300){
    background(width);
  }//the 300 frame
}
void mousePressed(){
  x=0;
  x++;
}

  

