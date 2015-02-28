
PImage img, front, back;
void setup(){
  size(400,400);
  front=loadImage("panther_front.jpg");
  back=loadImage("panther_back.jpg");
  img=back;
}
void draw(){
  background(255);
  image(img, width/2-150, height/2-150);
  if(dist(mouseX,mouseY,width/2,height/2)<150){
    img=front;
  }
  else{
    img=back;
  }
}

