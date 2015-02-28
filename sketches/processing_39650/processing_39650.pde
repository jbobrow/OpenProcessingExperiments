
PImage door;
PImage window;
PImage bricks;
PImage cat;
int catNum = 9;
float catDis = 0;
float catAng = TWO_PI/catNum;

int windowNum = 9;
float windowDis = 300;
float windowAng = TWO_PI/windowNum;

int tetNum = 14;
float tetAng = TWO_PI/windowNum;

float loongDis = 100;
float skuareDis = 300;
float teeDis = 200;
float elleDis = 250;
float assDis = 150;
float zeeDis = 350;
float loongOpacer= 0;
float zeeOpacer= 0;
float teeOpacer= 0;
float assOpacer= 0;
float skuareOpacer= 0;
float elleOpacer= 0;



float incre=3;
void setup(){
  size(820, 800);
  door = loadImage("door.png");
  window = loadImage("window.png");
  bricks = loadImage("bricks.png");
  cat = loadImage("cat.png");
  frameRate(40);
  
  
  smooth();
}
void draw(){
  
  imageMode(CENTER);
  tint(random(255), random(255), random(255));
  image(bricks, 410,400,820+random(0, 100),800+random(0,100));
  noTint();
  pushMatrix();
  
  translate(380, 400);
  rotate(radians(frameCount*1));
  image (door, 0,0,175,202 ); 
  popMatrix();
  
  imageMode(CORNER);
  
  for (int i=0; i<=tetNum; i++)
 {
   
  image(window, 340+windowDis*sin(windowAng*i+frameCount*0.005), 290+windowDis*cos(windowAng*i+frameCount*0.005), 152, 192);
  }
  
    
if (frameCount%7 ==0)
{
    
int chooser = round(random(1, 6));
if (chooser ==1)
  {
    loongOpacer=255;
    
  }
  if (chooser ==2)
  {
    elleOpacer=255;
  }
  if (chooser ==3)
  {
    assOpacer=255;
  }
  if (chooser ==4)
  {
    zeeOpacer=255;
  }
  if (chooser ==5)
  {
    teeOpacer=255;
  }
  if (chooser ==6)
  {
    skuareOpacer=255;
  }
}
  for (int k=0; k<=tetNum; k++)
  
  {
    
  loong(355+loongDis*sin(tetAng*k-frameCount*0.05), 325+loongDis*cos(tetAng*k-frameCount*0.05),loongOpacer);
    
  tee(355+teeDis*sin(tetAng*k+frameCount*0.05), 350+teeDis*cos(tetAng*k+frameCount*0.05), teeOpacer);
  
  zee(350+zeeDis*sin(tetAng*k+frameCount*0.03), 350+zeeDis*cos(tetAng*k+frameCount*0.03),  zeeOpacer);
  
  elle(350-elleDis*sin(tetAng*k-frameCount*0.1), 375-elleDis*cos(tetAng*k-frameCount*0.1),  elleOpacer);
  
  ass(375+assDis*sin(tetAng*k+frameCount*0.07), 355+assDis*cos(tetAng*k+frameCount*0.07), assOpacer);
  
  skuare(350-skuareDis*sin(tetAng*k-frameCount*0.05), 375-skuareDis*cos(tetAng*k-frameCount*0.05), skuareOpacer);
  
  
  loong(355+loongDis*sin(tetAng*k-frameCount*0.1), 325+(loongDis+130)*cos(tetAng*k-frameCount*0.1),assOpacer);
    
  tee(355+(teeDis+160)*sin(tetAng*k+frameCount*0.07), 350+teeDis*cos(tetAng*k+frameCount*0.07), zeeOpacer);
  
  zee(350+zeeDis*sin(tetAng*k-frameCount*0.08), 350+(zeeDis+140)*cos(tetAng*k-frameCount*0.08),  teeOpacer);
  
  elle(350-(elleDis+70)*sin(tetAng*k-frameCount*0.1), 375-elleDis*cos(tetAng*k-frameCount*0.1),  skuareOpacer);
  
  ass(375+(assDis+100)*sin(tetAng*k-frameCount*0.07), 355+(assDis+150)*cos(tetAng*k-frameCount*0.07), elleOpacer);
  
  skuare(350-(skuareDis+250)*sin(tetAng*k-frameCount*0.05), 375-(skuareDis+150)*cos(tetAng*k-frameCount*0.05), loongOpacer);
  }
  
loongOpacer= loongOpacer -4;
zeeOpacer=zeeOpacer- 4;
teeOpacer= teeOpacer-4;
assOpacer= assOpacer-4;
skuareOpacer= skuareOpacer-4;
elleOpacer=elleOpacer- 4;

  for (int j=0; j<=catNum; j++)
  
  {
    pushMatrix();
    translate(340+catDis*sin(catAng*j+frameCount*0.05), 390+catDis*cos(catAng*j+frameCount*0.05));
    pushMatrix();
  image(cat, 0, 0, 200, 90);
  popMatrix();
  popMatrix();
  }
  
  for (int h=0; h<=catNum; h++)
  
  {
    pushMatrix();
    translate(340+catDis*cos(catAng*h+frameCount*0.05), 390+catDis*sin(catAng*h+frameCount*0.05));
    pushMatrix();
  image(cat, 0, 0, 200, 90);
  popMatrix();
  popMatrix();
  }
  
  catDis = catDis+incre;
  if (catDis >= 400||catDis <= -400){
    incre=incre*-1;}
  
}



void elle(float xpos, float ypos, float loongOpac){
fill(183, 183, 183, loongOpac);
strokeWeight(3);
stroke(214, 214,214, loongOpac);
rect(20+xpos, 20+ypos, 30, 30);
rect(50+xpos, 20+ypos, 30, 30);
rect(80+xpos, 20+ypos, 30, 30);
rect(20+xpos, 20+ypos, 30, 30);
rect(20+xpos, 50+ypos, 30, 30);
}

void ass(float xpos, float ypos, float assOpac){
fill(206,65,65, assOpac);
strokeWeight(3);
stroke(234, 140, 140, assOpac);
rect(20+xpos, 20+ypos, 30, 30);
rect(20+xpos, 50+ypos, 30, 30);
rect(-10+xpos, 50+ypos, 30, 30);
rect(-10+xpos, 80+ypos, 30, 30);
}

void skuare(float xpos, float ypos, float skuareOpac){
  fill(28, 116, 147, skuareOpac);
strokeWeight(3);
stroke(127, 193, 216, skuareOpac);
rect(20+xpos, 20+ypos, 30, 30);
rect(20+xpos, 50+ypos, 30, 30);
rect(50+xpos, 50+ypos, 30, 30);
rect(50+xpos, 20+ypos, 30, 30);
}

void loong(float xpos, float ypos, float loongOpac){
  fill(87, 112, 52, loongOpac);
strokeWeight(3);
stroke(188, 211, 158, loongOpac);
rect(20+xpos, 20+ypos, 30, 30);
rect(20+xpos, 50+ypos, 30, 30);
rect(20+xpos, 80+ypos, 30, 30);
rect(20+xpos, 110+ypos, 30, 30);
}

void zee(float xpos, float ypos, float zeeOpac){
fill(188, 170, 8, zeeOpac);
strokeWeight(3);
stroke(232, 208, 23, zeeOpac);
rect(20+xpos, 20+ypos, 30, 30);
rect(20+xpos, 50+ypos, 30, 30);
rect(50+xpos, 50+ypos, 30, 30);
rect(50+xpos, 80+ypos, 30, 30);
}

void tee(float xpos, float ypos, float teeOpac){
fill(188,130,93, teeOpac);
strokeWeight(3);
stroke(222, 173, 143, teeOpac);
rect(20+xpos, 20+ypos, 30, 30);
rect(20+xpos, 50+ypos, 30, 30);
rect(-10+xpos, 50+ypos, 30, 30);
rect(50+xpos, 50+ypos, 30, 30);
}


