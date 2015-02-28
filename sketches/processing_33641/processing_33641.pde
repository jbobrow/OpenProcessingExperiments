
int numberBalls = 5; //pick how many balls you want displayed
int xPos[] = new int[numberBalls]; //makes array xpos = #of balls
int yPos[] = new int[numberBalls]; //makes array ypos = #of balls 

float r[] = new float[numberBalls];
float g[] = new float[numberBalls];
float b[] = new float[numberBalls];

int mouseClickCounter; //keep clicks within the array size of numberBalls

void setup()
{
  smooth();
  size(600, 600);
  background(0);
  mouseClickCounter = 0;



  for (int i=0; i<numberBalls;i++) {
    xPos[i] = 0; //starts in 0,0
    yPos[i] = 0;
    r[i]=random(255);
    g[i]=random(255);
    b[i]=random(255);
  }
}

void draw ()   //actual drawing
{

  background(0);
  for (int i=0; i<numberBalls && i < mouseClickCounter; i++) {
    ellipse(xPos[i], yPos[i], 20, 20);
    fill(r[i], g[i], b[i]);
  }
}

void mouseClicked() {  //defining the characteristics of the mouseclick

  xPos[mouseClickCounter % numberBalls] = mouseX;
  yPos[mouseClickCounter % numberBalls] = mouseY;

  mouseClickCounter+=1;
  fill(random(255), random(255), random(255));
}


