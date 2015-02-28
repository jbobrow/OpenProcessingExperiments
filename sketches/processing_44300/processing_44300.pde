
PImage myImage;

void setup(){
  myImage=loadImage("cooking.jpg");
  image(myImage,0,0);
  size(800,600,P2D);
noStroke();
}


void draw(){
  if (keyPressed==true){
fill((255+sin(float(millis())/2700))*20);
ellipse(mouseX,mouseY,50,50);
filter(DILATE/2);filter(BLUR);
   }
}



