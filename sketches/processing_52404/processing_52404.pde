

PImage[] frames = new PImage[7];

float r = 400.0;
float angle = 0.0;
float speed = 0.01;

PImage amiga;


PImage uno;



void setup() {

  size(465, 700);

  amiga = loadImage ("nnn.png");
  uno = loadImage ("w5-1.jpg");

  frames[0]  = loadImage("w5-1.jpg");
  frames[1]  = loadImage("w5-2.jpg");
  frames[2]  = loadImage("w5-3.jpg");
  frames[3]  = loadImage("w5-4.jpg");
  frames[4]  = loadImage("w5-5.jpg");
  frames[5]  = loadImage("w5-6.jpg");
  frames[6]  = loadImage("w5-7.jpg");
 
}

void draw() 
{   
  float sinval = sin(angle);
  float yoff = sinval * r;
  float xoff = sinval * 50;

  int selector = int(map(yoff, -400.0, 400.0, 0, 6));
  background (frames[selector]);
 
  
  
  angle += speed;


  image(amiga, 0+xoff, 0+yoff, 465, 700);  
 
}





