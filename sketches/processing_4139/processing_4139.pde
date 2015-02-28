
/**
 * <p>'VectorBalls' demo effect.</p>
 * 
 * A vector ball is a 2D Sprite represented in 3D space.  <br/>
 * One can construct a 3D object from multiple vectorballs.<br/>
 * Based on vector code By Peter Knight & Starfield by Jim Brown<br/>
 * 
 * <p>http://luis.net/projects/processing/vectorball/</p>
 *
 */

// our 2D sprite
PImage sprite;

// proce55ing logo in 3D data points
int NUM_BALLS = 28;
int[] ballPosnX = {-3,-2,-1,0,1,-3,-2,1,2,-3,-2,1,2,-3,-2,1,2,-3,-2,-1,0,1,-3,-2,-3,-2,1,3};
int[] ballPosnY = {3,3,3,3,3,2,2,2,2,1,1,1,1,0,0,0,0,-1,-1,-1,-1,-1,-2,-2,-3,-3,-3,-3};
int[] ballPosnZ = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

float angx = 0;
float angy = 0;
float angz = 0;

// vector image data
float[] ballX =  new float[NUM_BALLS];
float[] ballY =  new float[NUM_BALLS];
float[] ballZ =  new float[NUM_BALLS];

// Stars
int numstars=150;
final int SPREAD=64;
int CX,CY;
final float SPEED=1.2;

Star[] s = new Star[numstars];

void setup()
{
  size(320,240);
  smooth();
  sprite=loadImage("Aqua-Ball-48x48.png");

  CX=width/2 ; CY=height/2;
  for(int i=0;i<numstars;i++){
    s[i]=new Star();
    s[i].SetPosition();
  }
}

void draw()
{
  background(0);

  for(int i=0;i<numstars;i++){
    s[i].DrawStar();
  }
  renderBalls();
}

float fcos(int angle)
{
  return cos(angle/127.) ;
}

float fsin(int angle){
  return sin(angle/127.) ;
}

void drawBall(int x,int y,float r) {
  image(sprite,x+80,y+40,r*3,r*3);
}

void renderBalls() {
  for (int n=0; n<NUM_BALLS; n++) {
    int x = ballPosnX[n];
    int y = ballPosnY[n];
    int z = ballPosnZ[n];

    // Rotate about x axis
    float x2 = x;
    float y2 = y * fcos(int(angx)) - z * fsin(int(angx));
    float z2 = y * fsin(int(angx)) + z * fcos(int(angx));

    // Rotate about y axis
    float x3 = x2 * fcos(int(angy)) + z2 * fsin(int(angy));
    float y3 = y2;
    float z3 = -x2 * fsin(int(angy)) + z2 * fcos(int(angy));

    // Rotate about z axis
    float x4 = x3 * fcos(int(angz)) - y3 * fsin(int(angz));
    float y4 = x3 * fsin(int(angz)) + y3 * fcos(int(angz));
    float z4 = z3;

    ballX[n] = x4;
    ballY[n] = y4;
    ballZ[n] = z4;
  }

  // Depth sort
  int increment = NUM_BALLS / 2;
  while (increment > 0) {
    for (int i = increment; i < NUM_BALLS; i++) {
      int j = i;
      float tempX = ballX[i];
      float tempY = ballY[i];
      float tempZ = ballZ[i];

      while ((j >= increment) && (ballZ[j-increment] > tempZ)) {
        ballX[j] = ballX[j - increment];
        ballY[j] = ballY[j - increment];
        ballZ[j] = ballZ[j - increment];
        j = j - increment;
      }
      ballX[j] = tempX;
      ballY[j] = tempY;
      ballZ[j] = tempZ;
    }

    if (increment == 2)
      increment = 1;
    else 
      increment = (int) (increment / 2.2);
  }

  // Render with perspective
  for (int i=0; i<NUM_BALLS; i++) {
    float scale = (ballZ[i] + 10);
    float x = ballX[i] * 2 * scale + 64;
    float y = ballY[i] * 2 * scale + 64;
    drawBall(int(x),int(y),scale);
  }

  // Rotate camera
  angx+=.7 * 3;
  angy+=.3 * 3;
  angz+=.2 * 3;
}

class Star { 
  float x=0,y=0,z=0,sx=0,sy=0;
  void SetPosition(){
    z=(float) random(200,255);
    x=(float) random(-1000,1000);
    y=(float) random(-1000,1000);
  }
  void DrawStar(){
    if (z<SPEED){
	this.SetPosition();
    }
    z-=SPEED;
    sx=(x*SPREAD)/(z)+CX;
    sy=(y*SPREAD)/(4+z)+CY;
    if (sx<0 | sx>width){
	this.SetPosition();
    }
    if (sy<0 | sy>height){
	this.SetPosition();
    }
    fill(color(255 - (int) z,255 - (int) z,255 - (int) z));
    rect(sx,sy,3,3);
  }
}

