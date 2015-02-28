
 PImage img;
float posY = 100;
float posX = 100;

void setup() 
{
  size(200, 200);

  img = loadImage("omar.png");
}

void draw() 
{
  background(51);
  
  if (posY < 0) { 
    posY = height; 
  }
    if (posX < 0) { 
    posX = width; 
  }
  image(img,posX,posY);  
}

  void keyPressed(){

if(keyCode==UP){
posY -= 10;
}
if(keyCode==DOWN){
posY += 10;
}
if(keyCode==LEFT){
posX -= 10;
}
if(keyCode==RIGHT){
posX += 10;
}
  }

