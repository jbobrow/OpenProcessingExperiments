
PImage cloud;
PFont thirsty;
int btPosX, btPosY, btWidth, btHeight;
Boolean isActive = false;
Boolean isHovering = false;
Boolean isDropping = false;
float waterPosY1 = 100;


void setup () {
  size (500, 700);
  cloud = loadImage("cloud2.jpg");
  btPosX = 0;
  btPosY = 600;
  btWidth = 500;
  btHeight = 100;

  //  printArray(PFont.list());
  thirsty = createFont ("Univers", 32);
  textFont(thirsty);
}

void draw () {
  background (#c4e8f7);
 
 if (isDropping == true){
   // WATER ELLIPSE
   
   float speed = 7;
   float scale = map(sin(frameCount/speed), -1, 1, 1, 1.6);
   float news = map (waterPosY1, 270, 800, 5, 0);
   
   waterPosY1 = waterPosY1 + 1;
   
   fill(0,74,128);
   ellipse (250, waterPosY1, 35*scale, 35*scale);
   
//  fill (0,74,128);
//  ellipse (250, 200, 40, 40);
 }
    
  image (cloud, 150, 20);

  // SOIL
  fill (140, 98, 57);
  if (isHovering) {
    fill (96, 57, 19);
  }

  if (isActive) {
    fill (18, 173, 43);
  }
  
  noStroke ();
  rect (btPosX, btPosY, btWidth, btHeight);
  
   // AGUA! TEXT
  fill (41,106,50);
  textFont (thirsty);
  text("make it rain", 154, 660);
  
   // WATER DROP CURSOR
  fill (0, 74, 128);
  noStroke ();
  ellipse (mouseX, mouseY, 25, 25);

  noCursor ();
}

void mouseMoved() {
  if (mouseX > btPosX && mouseX < btPosX + btWidth
    && mouseY > btPosY &&  mouseY < btPosY + btHeight) {
    isHovering = true;
  } else {
    isHovering = false;
  }
}

void mousePressed () {
  if (mouseX > btPosX && mouseX < btPosX + btWidth
    && mouseY > btPosY && mouseY < btPosY + btHeight) {
    isActive = true;
    isDropping = true;
  } 
  
  else {
    isActive = false;
    isDropping = false;
    waterPosY1 = 100;
  }
  
 
}



