
int xPos = 0;
int yPos = 1;
int speed = 5;
int yspeed = 15;

int ellipseSizeX = 50; 
int ellipseSizeY = 50;


void setup (){
  size(500,500);
  background (255);
  fill(0);
  smooth();
}

void draw (){
  background(255);
  xPos = xPos + speed;
  if (xPos >= width || xPos < 0 ){
    speed = speed * (-1);
  }
  
    yPos = yPos + yspeed; 
   if (yPos >= height || yPos < 0 ){
    yspeed = yspeed * (-1);}
    ellipse(xPos,yPos,ellipseSizeX,ellipseSizeY);
}

void mousePressed(){
  xPos = 0;
} 

void keyPressed(){
  ellipseSizeX = ellipseSizeX + 10;
  ellipseSizeY = ellipseSizeY + 10;
}

void mouseReleased(){
  saveFrame("ball2.png");
} 

