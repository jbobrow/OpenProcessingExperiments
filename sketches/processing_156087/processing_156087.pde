
PImage img;
int bgColor; 
int bgColor2;
int posX=400;

PImage img2;
void setup() {
  size(400, 400);
 
  
}

void draw() {
  
  img2=loadImage("skull.jpg");
  tint(mouseX, 153, 204, mouseY);
  img = loadImage("nixon.jpg");
  
   
   
  bgColor=(mouseX);
  bgColor2=(mouseY);
  background(bgColor,bgColor2,frameRate);

  float sinOfTime = sin( millis() * 0.007 );
  float sinMappedX = map( sinOfTime, -1.0, 1.0, 200, 280 );
  float sinMappedY = map( sinOfTime, -1.0, 1.0, 300, 420 );

  imageMode(CENTER);
  image( img2, width/2, height/2, sinMappedX, sinMappedY );
  image( img, width/2, height/2, sinMappedX, sinMappedY );
  
  
}


