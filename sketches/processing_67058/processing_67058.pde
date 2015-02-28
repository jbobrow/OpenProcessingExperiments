
PImage myImage = loadImage("bg.jpg");

int numOfBalls = 15;
int numOfImages = 4;
 
float[] speedX = new float[numOfBalls];
float[] speedY = new float[numOfBalls];
float[] ballX = new float[numOfBalls];
float[] ballY = new float[numOfBalls];
PImage[] pacmanImgs = new PImage[numOfImages];
  
float gravity = 0.6;
 
void setup() {
  size(367,450);
  myImage = loadImage("bg.jpg");
  smooth();
  noStroke();
  for(int i = 0; i < numOfBalls; i++)
  {
      ballX[i] = int(random(10, 300));
      ballY[i] = int(random(10, 300));
      speedX[i] = int(random(3, 6));
      speedY[i] = int(random(6, 9));
  }
   
  for(int i = 1; i < numOfImages+1; i++)
  {
      pacmanImgs[i-1] = loadImage(""+ i + ".png");
  }
}
  
void draw() {
  background(255);
  image(myImage, 0, 0);
  for(int i = 0; i < numOfBalls; i++)
  {
      image(pacmanImgs[i % numOfImages], ballX[i], ballY[i]);
      ballX[i] += speedX[i];
      ballY[i] += speedY[i];
       
      speedY[i] += gravity;
       
      if (ballY[i] >= height-25 || ballY[i] <= 20 ) {
        speedY[i] *= -0.95;
      }
      if (ballX[i] >= width-20 || ballX[i] <= 0 ) {
        speedX[i] *= -1;
      }
  }
}


