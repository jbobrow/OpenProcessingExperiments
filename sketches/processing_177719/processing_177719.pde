
/*This project is an attempt to display what lensing and shearing
by a black hole looks like. A number of galaxies will be randomly
placed, and then their size and angle will be changed when you
click anywhere. Reset by pressing r, save a screenshot by pressing
s. */

PImage gal1,gal2;

float[][] positions; //Store the random positions of the galaxies.
int i,j,check;
float clickX, clickY;
int mouseClicked=0;
int screencounter=0;

void setup() {
  clickX=0;
  clickY=0;
  float tempX,tempY;
  tempX=0;tempY=0;
  positions = new float[20][2];
  i=0;
  positions[i][0]=random(50,750);
  positions[i][1]=random(50,750);
  i++;
  while(i<20) { //Want to make sure that none of the galaxies are too close together
    check=1;
    while(check==1)
    {
      check=0;
      tempX=random(50,750);
      tempY=random(50,750);
      for(j=0;j<i;j++) {
      if ((abs(tempX-positions[j][0])<120)&&(abs(tempY-positions[j][1])<120)) check=1;
      };
    }; 
    positions[i][0]=tempX;
    positions[i][1]=tempY;
    i++;
  };
  size(800, 800);
  gal1=loadImage("gal-1.png");
  gal2=loadImage("gal-2.png");
  noLoop(); //Only updates when you click or press 'r'
}

void draw() {
  background(0);
  float rot,scale;
  for(i=0;i<20;i++) {
    rot=rotateAmount(i);
    scale=scaleFactor(i);
    pushMatrix(); //This next bit does the rotation and translation
    translate(positions[i][0],positions[i][1]);
    rotate(rot*(1-scale));
    if(i<10) image(gal1,0,0,gal1.width,gal1.height*(scale*.7+.3));
    if(i>9) image(gal2,0,0,gal2.width, gal2.height*(scale*.7+.3));
    popMatrix();
   };
  
};

float rotateAmount(int i)
{
  float xDiff = positions[i][0]-clickX;
  float yDiff = positions[i][1]-clickY;
  float theta=atan(abs(xDiff/yDiff));
  if(xDiff>0&&yDiff>0) theta=theta-3.14159/2; //Depending on the quadrant, fix the angle of the rotation
  if(xDiff>0&&yDiff<=0) theta=-1*(theta-3.14159/2);
  if(xDiff<=0&&yDiff>0) theta=-1*(theta-3.14159/2);
  if(xDiff<=0&&yDiff<=0) theta=theta-3.14159/2;
  
  if(mouseClicked==0) return 0;
  return theta;
};

float scaleFactor(int i)
{ //This sets the amount that the image is "smooshed", further away is more smooshed
  float scale=sqrt(pow(positions[i][0]-clickX,2)+pow(positions[i][1]-clickY,2))/sqrt(2.2*pow(800,2));
  if(mouseClicked==0) return 1;
  return scale;
};

void mousePressed() {
  mouseClicked=1; //When you click, that sets the center about which things are rotated and squished
  clickX=mouseX;
  clickY=mouseY;
  redraw();
};

void keyPressed(){
  if(key=='S' || key=='s') saveFrame("screenshot"+screencounter+".png");
  screencounter++;
  if(key=='r'||key=='R') mouseClicked=0;
  redraw();

}


