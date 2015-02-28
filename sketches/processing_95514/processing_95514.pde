
//Carla Campos-Rodriguez
//April 7,2013
//sin-based motion
int objNum = 70;
float degrees = 360/20;
float distance = 50;
float angleOffset = 0;
PImage img;
void setup () {
  size (600, 600);
  img = loadImage("flowerstem.png");
}
void draw () {
  image(img, mouseX, mouseY);
    background(251, 232, 220);//cream
  
  //lime-green
  distance = 30;
  noStroke ();
  fill (199, 209, 69);
  for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  angleOffset+= -1;
  }
  if (mousePressed) {
    
  fill (251,232,220);
    }
    else {
    fill (114,34,123); 
  }
  distance = 60;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 40, 40);
  }
  distance = 90;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 60, 60);
  }
  distance = 120;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 80, 80);
  }
   distance = 150;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 40, 40);
  }
   distance = 180;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
   
  //purple
   distance = 30;
  noStroke ();
  fill(197, 3, 119);// purple
  for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) + 300 * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) + 300 * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 60, 60);
  angleOffset+=5;
  }
  distance = 60;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 40, 40);
  }
distance = 120;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
 
   distance = 140;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
  //orange
   distance = 30;
  noStroke ();
  fill (250, 131, 40, 80);
  for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) + 500 * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) + 500 * distance;
  ellipse (mouseX+ xOffset, mouseY + yOffset, 20, 20);
  
  }
  distance = 60;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
distance = 80;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
 
   distance = 100;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
  //lime-green
  distance = 30;
  noStroke ();
  
  //fill (197, 3, 119);//purple
  for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX+250 + xOffset, mouseY + yOffset, 10, 10);
  angleOffset+=1;
 
  }
   fill (199, 209, 69);//limegreen
  distance = 60;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX+250 + xOffset, mouseY + yOffset, 20, 20);
  }
  distance = 90;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX +350+ xOffset, mouseY + yOffset, 20, 20);
  }
  distance = 120;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
   distance = 150;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
   distance = 180;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
   
  //purple
   distance = 30;
  noStroke ();
  fill(197, 3, 119);// purple
  for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) + 300 * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) + 300 * distance;
  ellipse (mouseX+250 + xOffset, mouseY+250 + yOffset, 20, 20);
  angleOffset+=1;
  }
  distance = 60;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
distance = 120;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
 
   distance = 140;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
  //orange
   distance = 30;
  noStroke ();
  fill (250, 131, 40, 80);
  for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) + 500 * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) + 500 * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);

  }
  distance = 60;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
distance = 80;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
 
   distance = 100;
   for (int i = 0; i<objNum; i++) {
  float xOffset = cos(radians(degrees*i + angleOffset)) * distance;
  float yOffset = sin(radians(degrees*i + angleOffset)) * distance;
  ellipse (mouseX + xOffset, mouseY + yOffset, 20, 20);
  }
  fill(102, 254, 203);//aqua
  ellipse(mouseX, mouseY, 40, 40); //center
  
   image(img, mouseX - 115, mouseY - 115, 650, 650);//big flower stem
   image(img, mouseX - 115 +270, mouseY - 285 +60, 650, 650);//little flower stem

     
    }
     
  

  
  




