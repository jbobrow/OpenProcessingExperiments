
PImage trollFace;
float posX;
float posY;

void setup(){
  size(500,400);
  trollFace = loadImage("trollface.png");
  imageMode(CENTER);
}

void draw(){
  tint(mouseX/2, mouseY/1.75, random(0,255));
  if (mouseX>width*.9 && mouseY>height*.9){
    image(trollFace, random(0, width), random(0, height), width/10, height/10); 
  }
  else if(mouseX<width*.1 && mouseX>0 && mouseY>height*.9){
    image(trollFace, random(0, width), random(0, height), width/10, height/10);   
  }
  else if(mouseX<width*.1 && mouseX>0 && mouseY<height*.1 && mouseY>0){
    image(trollFace, random(0, width), random(0, height), width/10, height/10);
  }
  else if(mouseX>width*.9 && mouseY<height*.1 && mouseY>0){
    image(trollFace, random(0, width), random(0, height), width/10, height/10);
  }
  else{
    rotate(mouseX);
    image(trollFace, mouseX, mouseY, 50, 50);
  }
}


