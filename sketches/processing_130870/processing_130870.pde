

PImage pic;
PImage pic2;
PImage pic3;
PImage pic4;

void setup(){
  size(400,400);
  
  pic=loadImage("001.jpg");
  pic2=loadImage("002.JPG");
  pic3=loadImage("003.jpg");
  pic4=loadImage("004.JPG");
 
}

void draw(){
 background(0);
 if(mouseX> 0 && mouseX<width/2 && 
    mouseY> 0 && mouseY < height/2){
 image(pic, 0,0,400,400);
 }
 else if(mouseX >width/2 && mouseX<width &&
         mouseY>0 && mouseY<height/2) {
 image(pic2,0,0,400,400);
}
else if(mouseX>0 && mouseX<width/2 &&
        mouseY>height/2 && mouseY<height){
 image(pic3,0,0,400,400);         
        }
        else{
 image(pic4,0,0,400,400);          
        }
}



