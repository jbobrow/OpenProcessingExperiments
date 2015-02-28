
// I tried my self yesterday  but it didn't work
// So, I modified from Norma & Simir codes to see the structure
// and play around with vaule.
 
 
PImage bathtub;
 
int ball = 150;
int numOfImages = 4; // number of 5 ducks.
 
boolean mouseClick = false;
  
float[] ballX = new float [ball];
float[] ballY = new float [ball];
float[] velX = new float [ball];
float[] velY = new float [ball];
PImage[] duck = new PImage[numOfImages];
 
void setup() {
  size(359, 276);
  smooth();
  bathtub = loadImage("bathtub.png");
  for (int i=0; i < ball; i++) {
    ballX[i] = 10;
    ballY[i] = 10;
    velX[i] = i+20;
    velY[i] = i+20;
  }
     
  for(int i = 1; i < numOfImages+1; i++)
  {
      duck[i-1] = loadImage(""+ i + ".png");
  }
  
  mouseClick = false;
   
   
}
  
void draw() {
  background(bathtub);
  if (mouseClick == true) {
    for (int i = 0; i < ball; i++) {
      fill(0, 255, 0);
      image(duck[i % numOfImages], ballX[i], ballY[i]);
      ballY[i] += velY[i];
      ballX[i] += velX[i];
  
      if ((ballY[i] < 0) || (ballY[i] > 276)) {
        velY[i]*=-0.8;
      }
  
      if ((ballX[i] < 0) || (ballX [i] > 359)) {
        velX[i]*=-0.8;
      }
    }
  }
}
  
  
  
  
 void mouseReleased() {
  mouseClick = true;
  for (int i=0; i<ball; i++) {
    ballX[i] = mouseX;
    ballY[i] = mouseY;
  }
}
 // type a to reset the background 
void keyTyped() {
    
  if (key=='d'){background (0);}
  setup();
  
}


