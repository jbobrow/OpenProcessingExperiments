
PImage myImage;
PImage myImage2;
PImage myImage3;
PImage myImage4;

void setup(){
  size(600,600);
  myImage= loadImage("horsehead-nebula.jpg");
  myImage2= loadImage("ufo.png");
  myImage3= loadImage("alien.png");
  myImage4= loadImage("Untitled-3.png");
}

void draw(){
 stroke(10);
 image(myImage,0,0,600,600); 
 fill(229,108,95,50); 
 image(myImage2,mouseX,mouseY,200,100);
 image(myImage3,(mouseX/2),(mouseY*3),30,30);
 image(myImage4,(mouseX*2),(mouseY/3),100,100);
 
}

