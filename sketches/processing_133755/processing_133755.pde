
PImage pic;
PImage pic2;

void setup(){
  size(400,400);
  pic= loadImage("IMG_0034.JPG");
  pic2=loadImage("IMG_0035.JPG");
}

void draw(){
  background(0);
  if(mouseX > 0 && mouseX < width/2 &&
  mouseY > 0 && mouseY <height/2){
    image(pic,0,0,400,400);
  }
  else if(mouseX>width/2 && mouseX<width &&
          mouseY>0 && mouseY<height/2){
    image(pic2,0,0,400,400);
  }
  else if(mouseX>0 && mouseX<width/2 &&
          mouseY>height/2 && mouseY<height){
            
          }
          else{
          }
}         
            


