
PImage seaApple;
PImage seaSlug;
PImage seaUrchin;
PImage leafySeaDragon;
PImage leafySeaDragon2;
PImage seaAnemone;
int numObjects = 4;
float angleObject = TWO_PI/numObjects;
int centerX = 0;
int centerY = 0;
int distance = 75;


void setup() {
   size(700, 700);
   rectMode(CENTER);
   smooth();
   seaApple = loadImage("seaApple.gif");
   seaSlug = loadImage("seaSlug.gif");
   seaUrchin = loadImage("seaUrchin.gif");
   leafySeaDragon = loadImage("leafySeaDragon.gif");
   leafySeaDragon2 = loadImage("leafySeaDragon2.gif");
   seaAnemone = loadImage("seaAnemone.gif");
   fill(83,161,196);
   rect(350,350,710,710);
} 

  void draw() {
   fill(83,161,196,50);
   rect(350,350,710,710);
   translate(350,350);
   pushMatrix();
   rotate(radians(frameCount * 3));
   drawSeaDragon2();
   popMatrix(); 
   pushMatrix();
   rotate(radians(frameCount * -3));
   drawSeaDragon22();
   popMatrix(); 
   pushMatrix();
   rotate(radians(frameCount*3));
   drawSeaApple2();
   popMatrix();
   pushMatrix();
   rotate(radians(frameCount*-2));
   drawSeaSlug();
   popMatrix();
   rectMode(CENTER);
   pushMatrix();
   rotate(radians(frameCount*4));
   image(seaUrchin,-70,-70,140,140);
   popMatrix();
   pushMatrix();
   rotate(radians(frameCount));
   drawSeaAnemone2();
   popMatrix();

 } 

 
void drawSeaApple() {
   for (int i = 2; i < 3; i++) {
      image(seaApple, 0,0, 180, 240);
   } 
}

void drawSeaApple2(){
  for (int i=0; i<12; i++) {
      rotate(radians(30));
      //scale(.95);
      drawSeaApple();
  }
  
}

void drawSeaSlug() {
   for (int i=0; i<5; i++) {
      rotate(radians(90));
      image(seaSlug,0,0,110,90);
   } 
   
   
}

void drawSeaDragon() {
   for (int i = 4; i < 5; i++) {
      image(leafySeaDragon, 70,70, 180, 240);
   } 
}

void drawSeaDragon2() {
   for (int i=0; i<6; i++) {
      rotate(radians(60));
      //scale(.95);
      drawSeaDragon();
   } 
}

void drawSecondSeaDragon() {
   for (int i = 4; i < 5; i++) {
      image(leafySeaDragon2, 70,70, 180, 240);
   } 
}

void drawSeaDragon22() {
   for (int i=0; i<6; i++) {
      rotate(radians(60));
      //scale(.95);
      drawSecondSeaDragon(); 
   } 
}

void drawSeaAnemone() {
   for (int i = 4; i < 5; i++) {
      image(seaAnemone, 250,250, 120, 120);
   } 
}

void drawSeaAnemone2() {
   for (int i=0; i<24; i++) {
      rotate(radians(15));
      //scale(.95);
      drawSeaAnemone(); 
   } 
}


