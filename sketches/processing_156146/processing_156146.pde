
PImage doge;
PImage cage;
PImage arms;

float freq;
float tintR;
float tintG;
float tintB;
boolean boxColor;
boolean drawSquare = false;

float headWidth;
float headHeight;



void setup() {
  size(800,600);
  background(255); 

//image of arms

arms = loadImage("arms.png");
}


void draw() {
  
  
  
   float rectWidth = map(width/2, height/2, 16, 30, 100);
   float rectHeight = map(width/2, height/2, 16, freq, 100);
    
  if (drawSquare == true) {
    rect(width/2 + rectWidth,height/2 + rectHeight,100,100);
  }

  pushMatrix();
  translate(width/2, height/4);
  rotate(radians(frameCount * 8));
  noStroke();

//skull portions
//  fill(mouseX, mouseY,129);
//    rect(mouseX, mouseY/ scale, 156, 200);
//    rect(mouseX, mouseY/ scale, 185, 156);
//    rect(mouseX, mouseY/ scale, 198, 146);
    
//    fill(250);
//    rect(mouseX, mouseY, scale, scale);
//    rect(mouseX, mouseY, scale, scale);
//    rect(mouseX, mouseY, scale, scale);
//    rect(mouseX, mouseY, scale, scale);
      pushMatrix();
      
   float freq = map(frameCount, 0, 10000, 0.001, 0.1 );
  float scale = map(sin(frameCount * freq), -1, 1, 200, 300);
      popMatrix();
//  translate(width/2, height/2);
//  rotate(radians(-frameCount * 0.5));
//  fill(255);
//  text("CAGE", 0,0);
    
   //loop of smaller squares. Teeth of skull
   fill(mouseX, mouseY, random (80), random (45));
   rect(cos(freq * 10), rectHeight, 0, 30);
   rect(mouseX, mouseY, 16, 30);
   rect(mouseX, mouseY, 16, 30);
   rect(mouseX, mouseY, 16, 30);
   rect(mouseX, mouseY, 16, 30);
   rect(mouseX, mouseY, 16, 30);
   rect(mouseX, mouseY, 16, 30);
   rect(mouseX, mouseY, 16, 30);
 
 text("BOOOOOOOOOOOOOOOOOOOOOM", 40,40);  
    image(arms, width * mouseX, height * mouseY);
    popMatrix();
   

  
   tint(tintR, tintG, tintB);
  imageMode(CORNER);
  //image(doge, 0, 0);
  imageMode(CENTER);
  
  

  
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(frameCount * 10));
   popMatrix();
  
  


   
  
      
 
}



