
void setup(){
  size(500,500,P2D);
  background(255);
  translate(width/2,height/2);
  stroke(0,250);
}

void draw(){
  pushMatrix();
  translate(width/2,170);
    int f = frameCount;
    for (f = f; f<=160; f+=10){
      fill(255,150+f);
    translate(f,f);
    rotate(atan(f/2));
    rect(0,0, 80-f/2,80-f/2);
    f = f + sin(20); 
  }
  popMatrix();
  
}
