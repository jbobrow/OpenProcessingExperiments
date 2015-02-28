
void setup(){
  size(400,400);
  noFill();
  stroke(150);
}

void draw(){
//draw circles
  for(int x=0;x<9;x++){
  for(int y=0;y<9;y++){
    frameRate(15);
    float w=random(0,100);
    float h=random(0,100);
    ellipse(x*50,y*50,w,h);
  }
}

//change the color
  if(mousePressed){
    float r=random(0,255);
    float g=random(0,255);
    float b=random(0,255);
    float t=random(0,255);
    float strokeColor=random(0,255);
    fill(r,g,b,t);
    stroke(strokeColor);
  }
}
