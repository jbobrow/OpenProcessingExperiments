
int xPos=241;
int yPos=0;

int xPos2 = 239;
int yPos2 = 0;

int rad=10;

PImage img01;
PImage img02;

int dirX=1;
int dirY=1;
int dirX2=-1;
int dirY2=1;

void setup () {
  size(480, 640);
  img01 = loadImage("IMG_6608.jpg");
  img02 = loadImage("Stift.gif");
  background(img01);
  noStroke();
  frameRate(150);
}

void draw () {

        color c = img01.get(xPos2, yPos2);
  fill(random(220, 255));
    if(mouseX < width/2-50) {
    ellipse (xPos, yPos, 25, 25);
  }
  
  ellipse (xPos, yPos, rad, rad);
  if (xPos> width+10 || xPos < 0-10){
    dirX = dirX*-1;
  }
  xPos=xPos + dirX;
    
  if(yPos> height|| yPos< 0){
      
 dirY = dirY * -1;
  }
  yPos=yPos +dirY;
  
  
  
  fill(c);
  ellipse (xPos2, yPos2, rad, rad);
  if (xPos2> width+10 || xPos2 < 0-10){
    dirX2 = dirX2*-1;
  }
  xPos2=xPos2 + dirX2;
  
    if(yPos2> height|| yPos2< 0){
      
 dirY2 = dirY2 * -1;
  }
  yPos2=yPos2 +dirY2;
    if(mouseX > width/2+50) {
    ellipse (xPos2, yPos2, 25, 25);
  }


if(mousePressed){
  ellipse (xPos2, yPos2, 25, 25);
  fill(random(220, 255));
  ellipse (xPos, yPos, 25, 25);
}
}



