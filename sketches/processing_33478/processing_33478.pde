
int numberBalls = 100;
float xPos[] = new float[numberBalls];
float xSpeed[]=new float[numberBalls];
float yPos[]=new float[numberBalls];
float ySpeed[]=new float[numberBalls];

float r[]=new float[numberBalls];
float g[]=new float[numberBalls];
float b[]=new float[numberBalls];



void setup() {
  size (400, 400);
  for (int i=0; i<numberBalls; i++) { 
    xPos[i]  = width/2;
    yPos[i]  = height/2;
    xSpeed[i] = random(-1, 1)*10;
    ySpeed[i] = random(-1, 1)*10;
    r[i]=random(0, 255);
    g[i]=random(0, 255);
    b[i]=random(0, 255);
  }
}
void draw() {
  background (0, 0, 0); 
  smooth();


  for (int i = 0; i<numberBalls; i++) {

    xPos[i] = xPos[i] + xSpeed[i];
    yPos[i] = yPos[i] + ySpeed[i];

    if (xPos[i] >= 390 || xPos[i] <= 10)
    {
      xSpeed[i] = xSpeed[i]*(-1);
      r[i] = random(255);
      g[i] = random(255);
      b[i] = random(255);
    }  

    if (yPos[i] >= 390 || yPos[i] <= 10)
    {
      ySpeed[i] = ySpeed[i]*(-1);
      r[i] = random(255);
      g[i] = random(255);
      b[i] = random(255);
    }

    fill(r[i], g[i], b[i]);  
    ellipse (xPos[i], yPos[i], 20, 20);
  }// end for
}//end draw

//  xSpeed = xSpeed + 1;


