
void setup(){
  size(700,700);
  smooth();
  strokeWeight(1);
  colorMode(HSB,360,100,100,100);
  noFill();
}
void draw(){
  frameRate(1200);
  background (255,100,100,100);
for(int i=1; i<width; i+=2){
  float colorValue = map (i,5,width,0,360);
   // ellipse(mouseX,mouseY,i*8,i*10);
 ellipse(mouseX, mouseY, i*2, i*5) ;
  ellipse(mouseX, mouseX, i*7, i*6) ;
  //ellipse(mouseX, mouseY, i, i);
}
}

