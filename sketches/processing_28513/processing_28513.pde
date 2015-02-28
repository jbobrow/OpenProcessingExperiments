
PImage myImage;
float y=0;

PImage back; 
void setup (){
  size(600,600);
  back= loadImage("back.jpg");
  myImage= loadImage("colors.png");
 image(back,0,0,600,600);
}


void draw(){
  image(myImage,mouseX,mouseY,mouseX,mouseY);
}





void mousePressed (){
  background(random(0,255),random(0,255),random(0,255));
}

