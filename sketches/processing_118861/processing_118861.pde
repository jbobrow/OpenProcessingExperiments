
PImage dots;
PImage dotStruct;

void setup(){
  size(500,500);
  dots = loadImage("dotPat.png");
  dotStruct = loadImage("dotStruct.png");
}

void draw(){
  if(!mousePressed){
    image(dots,0,0);
  }
  image(dots,mouseX-500,mouseY);
  image(dots,mouseX-500,mouseY-500);
  if(mousePressed){
    image(dots,mouseX,mouseY);
    image(dots,mouseX,mouseY-500);
    if(mouseButton==LEFT){
      image(dotStruct,0,0);
    }else{
      image(dots,250,0);
    }
  }
}


