
//adapted from Simir's codes and help from everybody in class
//tried to add an image on it but NullPointerException came in conflict 

//PFont myFont;

PImage bg;

int ball = 100;
int numOfImages = 4; //count to 5 in total 

boolean mouseClick = false;
 
float[] ballX = new float [ball];
float[] ballY = new float [ball];
float[] velX = new float [ball];
float[] velY = new float [ball];
PImage[] angryBird = new PImage[numOfImages];

void setup() {
  size(610, 382);
  smooth();
  bg = loadImage("bg.png");
  for (int i=0; i < ball; i++) {
    ballX[i] = 10;
    ballY[i] = 10;
    velX[i] = i+20;
    velY[i] = i+20;
  }
    
  for(int i = 1; i < numOfImages+1; i++)
  {
      angryBird[i-1] = loadImage(""+ i + ".png");
  }
 
  mouseClick = false;
  
/*  myFirstFont = loadFont("Helvetica-24.vlw"); 
  textFont(myFirstFont);
  text("Press Space Bar to Reset", 20, width-30); */ 
  
}
 
void draw() {
  background(bg);
  if (mouseClick == true) {
    for (int i = 0; i < ball; i++) {
      fill(0, 255, 0);
      image(angryBird[i % numOfImages], ballX[i], ballY[i]);
      ballY[i] += velY[i];
      ballX[i] += velX[i];
 
      if ((ballY[i] < 0) || (ballY[i] > 382)) {
        velY[i]*=-0.9;
      }
 
      if ((ballX[i] < 0) || (ballX [i] > 610)) {
        velX[i]*=-0.9;
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
 
void keyTyped() {
   
  if (key==' '){background (0);}
  setup();
 
}



