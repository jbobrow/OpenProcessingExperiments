
PImage weirdo, lick, soapCat, bombay, yawn, eyes;
 
void setup()
{
  size(900,900);
  rectMode(CENTER);
  weirdo = loadImage("weirdo.png");
  lick   = loadImage("lick.png");
  soapCat= loadImage("soapCat.png");
  bombay = loadImage("bombay.png");
  yawn   = loadImage("yawn.png");
  eyes   = loadImage("eyes.png");
  
frameRate(60);
smooth();
noStroke();
imageMode(CENTER);

 
}
 
int numObjects = 10;
int centerX = 450;
int centerY = 450;
int distance = 50;
 
void draw(){
   background(random(125, 255), random(40), random(10));
 
float angleObject = (TWO_PI/numObjects);
pushMatrix();
translate(width/2, height/2);
rotate(frameCount*.1);
image(yawn, 0, 0);
popMatrix();

  for (int i =0; i<numObjects; i++)
  {
    
  float posX = centerX -distance*sin(angleObject*i+frameCount*0.1);
  float posY = centerY+ distance*cos(angleObject*i+frameCount*0.1);

  pushMatrix();
  translate(posX, posY);
  rotate(angleObject*i+frameCount*0.1);
  image(lick, 115, 0,lick.width*.6,lick.height*.6);
  image(bombay,210,0,bombay.width*.65,bombay.height*.65);
  image(soapCat, 275, 0, soapCat.width, soapCat.height);
  image(weirdo, 430, 0, weirdo.width*.75, weirdo.height*.75);
  image(eyes, 500, 0, eyes.width, eyes.height);
  popMatrix();

 
  } 
}


