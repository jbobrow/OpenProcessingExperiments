
PImage myImage;
float y=0;

void setup (){
  size(1000,1000);
 background(255);
  myImage= loadImage("diamond_transparent.png");
 
}


void draw(){
  image(myImage,mouseX,mouseY,mouseX,mouseY);
}




void mousePressed (){
  background(random(0,255),random(0,255),random(0,255));
}

