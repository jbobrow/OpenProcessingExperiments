

/**
 * changing size and position of circles in a grid
 *  
 * MOUSE
 * position x          : circle position
 * position y          : circle size
 * left click          : random position + color change

 */
 

 
float tileCount = 5;
color circleColor = color(random(255), random(255), random(255), 100);
int circleAlpha = 100;
int actRandomSeed = 0;
int value = 0;
 
void setup(){
  size(450,450);

}
 
void draw() {
  
    PImage myImage = loadImage("powder1.jpg");
  image(myImage, 0, 0);
  

 
  translate(width/tileCount/3, height/tileCount/3);
 

  
  smooth();
  noFill();
   
   
  randomSeed(actRandomSeed);
 
  stroke(circleColor, circleAlpha);
  strokeWeight(mouseY/40);
 
  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {
 
      float posX = width/tileCount * gridX;
      float posY = height/tileCount * gridY;
 
      float shiftX = random(-mouseX, mouseX)/20;
      float shiftY = random(-mouseX, mouseX)/20;
 
      ellipse(posX+shiftX, posY+shiftY, mouseY/15, mouseY/15);
    }
  }
   

}
 
void mousePressed() {
  actRandomSeed = (int) random(100000);
   
  if (circleAlpha< tileCount){
   circleColor -=100 ;
  }
  else {
   circleColor +=100;
  }
   
}
 
 

 


