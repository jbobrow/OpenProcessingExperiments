
float time=0;
boolean stop=false;
void setup(){
  size(512,512);
  frameRate(25);
}

void draw(){
  if(!stop)doDraw();
  
}

void mousePressed(){
  stop=!stop;
  
}

void doDraw(){
  background(255);
  translate(width/2,height/2);
  noFill();
  time+=.003;
  for(int i=0; i<20; i++){
    stroke(i*255/20,255-i*10,255-i*5*time);
    rotate(time);
    rect(i,i,i*5,i*5);
  }
}
