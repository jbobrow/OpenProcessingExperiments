
void setup(){
  size(600,600);
  frameRate(3);
  background(255);
}
void draw(){
  background(0);
  //fill(#11DCED);
  stroke(#11DCED);

  for(float y=0; y<height; y+=10){
    float snowX=random(0,width);
    line(snowX,y,snowX+mouseX/60,y+mouseY/40);
  }
}
  
