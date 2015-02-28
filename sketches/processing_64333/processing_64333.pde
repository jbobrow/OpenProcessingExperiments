

PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5; 
PImage img6;

int status1 = 0;



void setup() {
  size(800, 500);
 
  img1=loadImage("1.jpg");
  img2=loadImage("2.jpg");
  img3=loadImage("3.jpg");
  img4=loadImage("4.jpg");
  img5=loadImage("5.jpg");
  img6=loadImage("6_2.png");
  rectMode(CENTER);
  noCursor();
  frameRate(70);
  
}
 
void draw() {
 
  if (status1 == 0){
    image(img1,0,0);
  }
  
  else if (status1 == 1){
    image(img2,0,0);
  }
  
  else if (status1 == 2){
    image(img3,0,0);
  }
  
  else if (status1 == 3){
    image(img4,0,0);
  }
  
  else if (status1 >= 4){
    image(img5,0,0);
    image(img6,mouseX,mouseY);
  }
  
 
    
  }
  
  
void mouseClicked() {
  
  status1 += 1;
  
}



