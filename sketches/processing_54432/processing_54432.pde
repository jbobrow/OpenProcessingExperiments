
void setup(){
  size (520,260);
//background (130,10,30);
background (255);
noStroke();
frameRate(1);

}
void draw() {  
  for (int x=0; x<width; x+=52){
  for (int y=0; y<height; y+=52) {

  float r=random (160,205);
  float g=random (130,185);
  float b=random (50,90);
  fill(r,g,b);
  rect(x,y,52,52);
  }
}
}

