
PImage img;
PFont fontWhat;
float down;

void setup()
{
   size(500,500);
   img= loadImage("whyme.png");
   fontWhat= loadFont("AmericanTypewriter-48.vlw");
   
   
}

void draw()
{
  background(0);
  
  float sinOfTime = sin( millis() * 0.007 );
  float sinMappedX = map( sinOfTime, -1.0, 1.0, 100, img.width);
  float sinMappedY = map( sinOfTime, -1.0, 1.0, 100, img.height);
 
  imageMode(CENTER);
  image(img,width/2,height/2,sinMappedX, sinMappedY);
  textFont(fontWhat);
  text("Why always me!",100,50);
  
}


