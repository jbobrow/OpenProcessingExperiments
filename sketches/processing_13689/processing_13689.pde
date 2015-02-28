
      void setup(){
  size(200,200);
}
void draw(){
  background(255,100,150);
  for(int x=0; x<200; x=x+11){
    for(int y=0; y<200; y=y+1)
  ellipse(100+cos(x+0.1)*375,100+cos(x+0.1)*113,mouseX,mouseY);

    


  }
  println(frameCount);
}  
