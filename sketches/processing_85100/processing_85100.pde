
float dim;
void setup() {
  size(400,400);
  background(50,200,170);
  fill(40,200,500);
  dim=0.5;
}

void draw() {
 
  translate(width/2,height/2);
  rotate(radians(frameCount60));
  //rotate(radians(30));
  //translate(frameCount0,frameCount0);
  scale(dim);
  dim = dim *0.5;
  if (dim<0.1) dim=1;
  fill(frameCount@0,frameCount@0, frameCount00);
  triangle(30,75,58,20,86,75);
}
