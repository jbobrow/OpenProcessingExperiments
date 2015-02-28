
float dim;
void setup() {
  size(500,400);
  background(255,255,0);
  fill(0,255,255);
  dim= 1;
}
 
void draw() {
    translate(width/2,height/2);
    rotate(radians(frameCount%330)); 
    //rotate(radians(30));
    //translate(frameCount%30,frameCount%30);
    scale(dim);
    dim = dim *0.995;
    if (dim<.1) dim=1;
    fill(0,frameCount%255,frameCount%196);
    rect(0,0,100,100);
 
}


