
PImage zzz;
void setup() {
    background(255);
  size(400, 400);
  zzz=loadImage("go.jpg");
}
  
void draw() {
  for( float x=0; x<350; x=x+10 ){
  for( float y=0; y<350; y=y+10 ){
  pushMatrix();
  translate(x*6,y*6);
  rotate(frameCount+x);
  scale(0.2);
  image(zzz, 0, 0);
  popMatrix();
  }
 }
}

