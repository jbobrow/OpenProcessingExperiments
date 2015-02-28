
PImage img;
float s = 0.0;
int flag = 1;
int eSize = 3;
int maru = 30;
int speed = 5;


void setup() {
  size(450, 450);
  stroke(255);
  smooth();
  frameRate(50);
  img = loadImage("apple.png");
  
  
}


void draw() {
  background(255); 
  tint(20, 20, 20, 200);
  image(img, 100, 50);

  //float s = second();
  if (flag == 1) {
    s += 0.02;
    
    for(int y = 20; y <= height; y += 63){
    for(int x = 20; x <= width; x += 63){
      noStroke();
    fill(57);
    maru = maru +speed;
    if (maru > width || maru <41){
    rect(x,y, maru, maru,0);{
      speed = -speed;
    }
   }
  }
    }
  }

  translate(225, 225);

  noFill();
  stroke(255);

  pushMatrix();
  rotate(radians(s*(360/60)));
  strokeWeight(1);
  line(0, 0, 0, 160);
  popMatrix();
  
}


void mousePressed() { 

   if(mouseX>=125 && mouseX<=330 && mouseY>=120 && mouseY<=340){

  if (flag == 0) {
    if(mousePressed){
  }
  
    flag = 1;
    
  }
  else if (flag == 1) {
    flag = 0;
  }
   }
   
   
   if(mouseX>=230 && mouseX<=280 && mouseY>=55 && mouseY<=110){

  if (flag == 0) {
    if(mousePressed){
  }
  
    flag = 1;
  }
  else if (flag == 1) {
    flag = 0;
  }
   }
   
   
}



   



