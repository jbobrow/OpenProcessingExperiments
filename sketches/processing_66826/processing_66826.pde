
// ARIEL M
//Time-based lab

PFont myFont;
  PFont font;

String title = "Victory Ceremony" ;
PImage img;

float angle = 0.0; // Current angle
float speed = 0.03; // Speed of motion
float radius = 100.0; // Range of motion
float sx = 0.0;
float sy = 0.0;

int time_axis=0;
int time_target=200;
int time_step=200;
int GREEN_ENLARGE_TIME=time_target+time_step;
int GREEN_MOVE_TIME=GREEN_ENLARGE_TIME+time_step;
int YELLOW_ENLARGE_TIME=GREEN_MOVE_TIME+time_step;
int YELLOW_MOVE_TIME=YELLOW_ENLARGE_TIME+time_step;
int RED_ENLARGE_TIME=YELLOW_MOVE_TIME+time_step;
int RED_MOVE_TIME=RED_ENLARGE_TIME+time_step;
int BLACK_ENLARGE_TIME=RED_MOVE_TIME+time_step;
int BLACK_MOVE_TIME=BLACK_ENLARGE_TIME+time_step;
int BLUE_ENLARGE_TIME=BLACK_MOVE_TIME+time_step;
int BLUE_MOVE_TIME=BLUE_ENLARGE_TIME+time_step;

int counter = 0;
float yPos = 0;
float y2Pos = 0;
float y3Pos = 0;
float y4Pos = 0;
float xPos = random (800);
float x2Pos = random (800);
float x3Pos = random (800);
float x4Pos = random (800);
float alphaValue = 20;
float alphaValue2 = 20;
float alphaValue3 = 20;
float alphaValue4 = 20;

//------------------
void setup() {
size(800,600);
noFill();
strokeWeight(15);
background(255);
  frameRate (18);

  img = loadImage("london1.png");


smooth();
myFont = loadFont("MyriadWebPro-Bold-48.vlw");
textFont(myFont, 60);
}

//------------------
void draw() {
_text();

++time_axis;

background(#0496fc);









//--------------------------------

if (time_axis <= BLACK_MOVE_TIME/2)
{
  stroke(255);
  ellipse(400,300,320,320);
}
else
if (time_axis <= BLUE_ENLARGE_TIME/2)
{
  stroke(255);
  ellipse(400,300,320+(time_axis-BLACK_MOVE_TIME)/(time_step/-120.0),320+(time_axis-BLACK_MOVE_TIME)/(time_step/-120.0));
}
else
if (time_axis <= BLUE_MOVE_TIME/2)
{
  stroke(255);
  ellipse(400+(time_axis-BLUE_ENLARGE_TIME)/(time_step/-220.0),300+(time_axis-BLUE_ENLARGE_TIME)/(time_step/-80.0f),200,200);
}
else
{
  stroke(255);
  ellipse(180,220,200,200);
}

if (time_axis <= RED_MOVE_TIME/2)
{
  stroke(255);
  ellipse(400,300,260,260);
}
else
if (time_axis <= BLACK_ENLARGE_TIME/2)
{
  stroke(255);
  ellipse(400,300,260+(time_axis-RED_MOVE_TIME)/(time_step/-60.0),260+(time_axis-RED_MOVE_TIME)/(time_step/-60.0));
}
else
if (time_axis <= BLACK_MOVE_TIME/2)
{
  stroke(255);
  ellipse(400,300+(time_axis-BLACK_ENLARGE_TIME)/(time_step/-80.0f),200,200);
}
else
{
  stroke(255);
  ellipse(400,220,200,200);
  
}

if (time_axis <= YELLOW_MOVE_TIME/2)
{
  stroke(255);
  ellipse(400,300,200,200);
}
else
if (time_axis <= RED_ENLARGE_TIME/2)
{
  stroke(255);
  ellipse(400,300,200,200);
}
else
if (time_axis <= RED_MOVE_TIME/2)
{
  stroke(255);
  ellipse(400+(time_axis-RED_ENLARGE_TIME)/(time_step/120.0),300+(time_axis-RED_ENLARGE_TIME)/(time_step/-20.0f),200,200);
}
else
{
  stroke(255);
  ellipse(620,220,200,200);
}

if (time_axis <= GREEN_MOVE_TIME/2)
{
  stroke(255);
  ellipse(400,300,140,140);
}
else
if (time_axis <= YELLOW_ENLARGE_TIME/2)
{
  stroke(255);
  ellipse(400,300,140+(time_axis-GREEN_MOVE_TIME)/(time_step/60.0),140+(time_axis-GREEN_MOVE_TIME)/(time_step/60.0));
}
else
if (time_axis <= YELLOW_MOVE_TIME/2)
{
  stroke(255);
  ellipse(400+(time_axis-YELLOW_ENLARGE_TIME)/(time_step/-110.0),300+(time_axis-YELLOW_ENLARGE_TIME)/(time_step/70.0f),200,200);
}
else
{
  stroke(255);
  ellipse(290,370,200,200);
}


if (time_axis <= time_target)
{
  stroke(255);
  ellipse(400,300,80,80);
}
else
if (time_axis <= GREEN_ENLARGE_TIME/2)
{
  stroke(255);
  ellipse(400,300,80+(time_axis-time_target)/(time_step/120.0),80+(time_axis-time_target)/(time_step/120.0));
}
else
if (time_axis <= GREEN_MOVE_TIME/2)
{
  stroke(255);
  ellipse(400+(time_axis-GREEN_ENLARGE_TIME)/(time_step/110.0),300+(time_axis-GREEN_ENLARGE_TIME)/(time_step/70.0f),200,200);
}
else
{
  stroke(255);
  ellipse(510,370,200,200);
}

stroke(255);
text(title, 300, height/6);   
pic();
}


void pic(){
  imageMode(CORNERS);
  image(img,width/24,7*height/10);
}

void _text(){
    noStroke ();
  fill (30, 50);
  rect (0, 0, width, height);

  counter++;
  yPos += 5;
  y2Pos += 5;
  y3Pos += 5;
  y4Pos += 5;
  alphaValue +=10;
  alphaValue2 +=5;
  alphaValue3 +=20;
  alphaValue4 +=15;
  
  //generating the random chars
 
  
  if (yPos > height) {
    alphaValue = 0;
    xPos = random (width);
    yPos = random(height);
  };
  if (alphaValue > 155) {
    alphaValue = 0;
    xPos = random (width);
    yPos = random(height);
  };
  fill (#FBB03B, alphaValue);
 
  
  //generating the random chars
  if (y2Pos > height) {
    alphaValue2 = 0;
    x2Pos = random (width);
    y2Pos = random(height);
  };  
   if (alphaValue2 > 155) {
    alphaValue2 = 0;
    x2Pos = random (width);
    y2Pos = random(height);
  };
  fill (#F15A24, alphaValue2);
  
  
  //generating the random chars
  if (y3Pos > height) {
    alphaValue3 = 0;
    x3Pos = random (width);
    y3Pos = random(height);
  };  
   if (alphaValue3 > 155) {
    alphaValue3 = 0;
    x3Pos = random (width);
    y3Pos = random(height);
  };  
  fill (#0071BC, alphaValue3);
 
  
  //generating the random chars
  if (y4Pos > height) {
    y4Pos = random(height);
    x4Pos = random (width);
    alphaValue4 = 0;
  };  
   if (alphaValue4 > 155) {
    alphaValue4 = 0;
    x4Pos = random(width);
    y4Pos = random(height);
  };   
  fill (#ffffe5, alphaValue4);

};

