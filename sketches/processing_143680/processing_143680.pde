
//Ciera Johl - Processing Sketch:Praticing with Click Drag Tutorial

//must drag and drop the image (doge.png) onto this window to work 
//(sometimes this happens sorry)
PImage img;

//global variables
int boxX;
int boxY;
int boxWidth;

boolean flag;

void setup(){
  size (500,500);
  background(255);
  
  img = loadImage("doge.png");
  
  boxWidth = 100;
  boxX = width/2 - boxWidth/2;
  boxY = height/2 - boxWidth/2;
  
  textSize(20);
  fill(255,190,50);
  text("much design wow", 50, 400);
  fill(130,255,130);
  text("so clean", 250, 100);
  fill(50,180,255);
  text("many doge", 380, 300);
  fill(255,170,180);
  text("plz drag", 80, 250);
}

void draw(){
  //refreshes background, but I want the snake chain so this is disabled
  //background(255);
  
  //new location of the image
  if (mousePressed && flag == true){
    boxX = mouseX - boxWidth/2;
    boxY = mouseY - boxWidth/2;
  }
  
  image(img, boxX, boxY, boxWidth, boxWidth);
}
  
//conditions
void mousePressed(){
  //check for mouse in box
  if(mouseX > boxX && mouseX < boxX + boxWidth 
  && mouseY > boxY && mouseY < boxY + boxWidth){
    flag = true;
  }
}

void mouseReleased(){
  flag = false; 
}


