
float x,y,angle1,angle2, yPos, dir;
PImage bg;
PImage linkz;
PImage navi;



void setup(){
  size(1280,960);
  bg = loadImage("background.png");
  linkz = loadImage("link.png");
  navi = loadImage("navi.png");
  
  yPos = 400;
  dir = -1;
  
  
}

void draw(){
    background(bg);
  image(linkz,600,yPos);
  
  yPos += dir;
 if(yPos < 300){
   dir = 1;
 }
if(yPos > 625){
  dir = -1;
}
  
  
  
  
  
  
  float ang1 = radians(angle1);
  float ang2 = radians(angle2);
  
  
  
  x = mouseX + (cos(ang1)*50);
  y = mouseY + (sin(ang2)*25);
  image(navi,x,y);
  angle1 += random(5,20);
  angle2 += random(5,20);
  
  
}

