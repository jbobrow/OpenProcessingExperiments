
void setup(){
  size(200,200);
  background(255);

  
}


void draw(){
  PImage img = loadImage ("images.jpg");
  int ex=2;
  int ladox = (width-7*ex)/8;
  int x=0;
for(x=0;x<200;x+=25){
  for(int y=0; y<200; y+=25){
   fill(255);
   rect(x,y,ladox,ladox);
  }
}
  fill(0);
   image (img,(4*(ladox+ex)), (3*(ladox+ex)), ladox, ladox);
  rect((4*(ladox+ex)), (5*(ladox+ex)), ladox, ladox);
  noLoop();
}
