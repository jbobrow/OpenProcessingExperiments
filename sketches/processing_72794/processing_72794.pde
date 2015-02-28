
int v = 0;
int x = 0;
float y = 200;
float a = 2;
int sentchange = 0;
int sentChangeFrames = 9;
int numFrames= 9;
int frame = 0;
String [] TYPE = new String[sentChangeFrames];
PImage [] images = new PImage [numFrames];
PImage back_image;
PFont f;
 
void setup()
{
  f = createFont("Calibri", 25, true);
  size(500,400);
  back_image = loadImage("sky1.png");
  frameRate(11);
TYPE[0] = "Doctor: I have bad news for you...";
TYPE[1] = "Earth: What is it, doctor?";
TYPE[2] = "Doctor: I'm not sure how to put it...";
TYPE[3] = "Earth: I can handle it...";
TYPE[4] = "Doctor: I'm afraid you have humans!";
TYPE[5] = "...";
TYPE[6] = "Just kidding!";
TYPE[7] = "...";
TYPE[8] = ":D";

  images[0] = loadImage("doctor1.png");
  images[1] = loadImage("earth1.png");
  images[2] = loadImage("doctor2.png");
  images[3] = loadImage("earth2.png");
  images[4] = loadImage("doctor3.png");
  images[5] = loadImage("earth3.png");
  images[6] = loadImage("doctor4.png");
  images[7] = loadImage("earth4.png");
  images[8] = loadImage("earth5.png");   
   
}
void draw()
{
  background(back_image);
  
  fill(255);
  ellipse(random(width), random(height), 5, 5);

 
  if(mousePressed == true)
  {
    frame = frame +1;
   
  }
  if(mousePressed)
  {
    sentchange = sentchange +1;
  }
   
  if(sentchange >= sentChangeFrames)
  {
    sentchange = 0;
  }
 if(frame >=  numFrames)
 {
   frame = 0;
 }
  
 image(images[frame], 200, 0);
 noStroke();
 x = x+1;
    
   if(x > 1)
   {
     fill(255);
   }
   if(x > 3)
   {
     fill(20);
   }
    
   if(x >5)
   {
      x= 0;
   }
   
   
 if(mousePressed == false)
 {
   fill(255);
   text(TYPE[sentchange], 30, 109); 
 }
    
  
 
}


