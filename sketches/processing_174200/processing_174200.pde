
PImage img;
float x;
int y;
int num_bubbles = 150+6;
 

int[] bubbleX = new int[num_bubbles];
int[] bubbleY = new int[num_bubbles];
int[] bubbleSize = new int[num_bubbles];
color[] bubbleCol = new color[num_bubbles];
 
void setup() {
  
  size(500, 600);
  img = loadImage("cir.jpg");
   
 
  for(int i = 0; i < bubbleX.length; i++) {
    bubbleY[i] = -40;
  }
}
 
void draw() {
  background(255);
  image(img, 0, 0, 500, 600);
   
  y+=6;
  x+=0.8;
  if (x<width) {
    image(img, 0, x);
  }
 
  
  

  for(int i = 0; i < bubbleX.length; i++) {
   
    fill(bubbleCol[i]);
    noStroke();
    ellipse(bubbleX[i], bubbleY[i], bubbleSize[i], bubbleSize[i]);
   
    bubbleY[i]-= bubbleSize[i]*2;
  
    if(bubbleY[i] < -30) {
      bubbleY[i] = (int)random(height, height*2);
      bubbleX[i] = (int)random(0, width);
      bubbleSize[i] = (int)random(1, 8);
      bubbleCol[i] = color(255, random(200, 255)); // white, with random transparency
    }
  }
   
  //draw the beer foam last, so it covers up the bubbles on top
  //fill(255); stroke(255);
  //rect(0, 0, width, 40);
}



