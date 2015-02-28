
import ddf.minim.*;
int x = 125;
int y = 50;
int diam= 5;                             //width of the shape
int numCircle = 40;                       //number of circles

int offsetx = 70;
int offsety = 340;

float[] xpos = new float[numCircle];      //starting position x
float[] ypos = new float[numCircle];      //starting position y
float[] velX = new float [numCircle];     //velocity of the shape
float[] velY = new float [numCircle];     //velocity of the shape

PImage myImage;

AudioPlayer player;
Minim minim;

void setup(){
  size(600,700);
  fill(2);
  myImage=loadImage("shaker2.jpg");
  minim=new Minim(this);
  player=minim.loadFile("giggle.mp3",2048);
}


void draw(){
  background(36,34,32);
  if(mouseX>250&&mouseX<350){
  player.play();  
  x = x + int(random(-4,4));
  y = y + int(random(-4,4));
  background (36,34,32);
  image(myImage, x, y ,350,350);
  fill (random(255),random (255),random (255));
  if (x<0)
  {
    x = x + int(random(0,4));
  }
  if (y<0)
  {
    y = y + int(random(0,4));
  }
  if (x>250)
  {
    x = x + int (random(-4,0));
  }
  if (y>100)
  {
    y = y + int (random(-4,0));
  }
  if (x>75)
  {
    x = x + int(random(-4,4));
  }
  if (y>75)
  {
    y = y+ int(random(-4,4));
  }
  if (x<175)
  {
    x = x + int(random(-4,4));
  }
  fill(255);                           
  noStroke();
  print(" \n" +x);
  for (int i=10; i< numCircle; i++){
  xpos[i]= random(x+offsetx , x+offsetx+220);
  ypos[i]= random(y+offsety , y+offsety+350 );
  velY[i] = random(3,0);
  }

  
  
  } else {
  image(myImage, 100,100,350,350);
 player.pause();
}

for(int i=0; i<numCircle; i++){
   xpos[i] +=velX[i];
   ypos[i] +=velY[i];
if(ypos[i] < diam || ypos[i] > height-diam) {
   velY[i]*=0;
   }
   ellipse(xpos[i], ypos[i], diam,diam);
  }
  }

void stop(){
  player.close();
  minim.stop();
  super.stop();
  

}


