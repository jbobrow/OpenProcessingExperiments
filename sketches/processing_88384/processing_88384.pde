
int maxBeard = 37;
int beardIndex = 0;
int maxGuy = 7;
int guyIndex = 0;
int maxSun = 5;
int sunIndex = 0;
int timer = 0;
int restart = 0;
float rot = 0;

PImage [] beard = new PImage[maxBeard];
PImage [] guy = new PImage[maxGuy];
PImage [] sun = new PImage [maxSun];
PImage [] shaver = new PImage[1];
PImage [] grass = new PImage[1];
PImage [] stars = new PImage[1];

void setup() {
   size(500,500);
   shaver[0] = loadImage("shaver.png");
   grass[0] = loadImage("grass.png");
   stars[0] = loadImage("stars.png");
   for (int i = 0; i < maxBeard; i++) {
     beard[i] = loadImage("beard" + i + ".png");
   }
   for (int i = 0; i < maxGuy; i++) {
     guy[i] = loadImage("guy" + i + ".png");
   }
   for (int i = 0; i < maxSun; i++) {
     sun[i] = loadImage("sun" + i + ".png");
   }
   frameRate(20);
}

void draw () {
   if (rot > 1.75 * PI || rot < .75 * PI ) {
     background(0,0,100);
     image(stars[0],0,0);
   }
   if (rot <= 1.75 *PI && rot >= .75 * PI){
     background(150,150,220);
   }
   if (rot > 2 * PI) {
     rot = 0;
   }
   image(grass[0],0,0);
   pushMatrix();
   translate(250,350);
   rotate(rot);
   image(sun[sunIndex],200,200);
   popMatrix();
   if (sunIndex == 4) {
     sunIndex = -1;
   }
   sunIndex += 1;
   if (beardIndex >= 36 && guyIndex == 6){
     restart += 1;
   }
   if (restart == 20){
     restart = 0;
     beardIndex = 0;
     guyIndex = 0;
   }
   if (beardIndex >= 36 && guyIndex < 6){
     timer += 1;
   }
   if (timer == 2){
     timer = 0;
     guyIndex += 1;
   }
   image(guy[guyIndex],0,0);
   if (mouseY > 450 && mousePressed == true && beardIndex < 4) {
     beardIndex += 1;
   }
   if (mouseY <= 450 && mouseY > 400 && mousePressed == true && beardIndex >= 4 && beardIndex < 9) {
     beardIndex += 1;
   }
   if (mouseY <= 400 && mouseY > 350 && mousePressed == true && beardIndex >= 9 && beardIndex < 14) {
     beardIndex += 1;
   }
   if (mouseY <= 350 && mouseY > 300 && mousePressed == true && beardIndex >=14 && beardIndex < 19) {
     beardIndex += 1;
   }
   if (mouseY <= 300 && mouseY > 250 && mousePressed == true && beardIndex >=19 && beardIndex < 24) {
     beardIndex += 1;
   }
   if (mouseY <= 250 && mouseY > 200 && mousePressed == true && beardIndex >=24 && beardIndex < 29) {
     beardIndex += 1;
   }
   if (mouseY <= 200 && mouseY > 150 && mousePressed == true && beardIndex >=29 && beardIndex < 34) {
     beardIndex += 1;
   }
   if (mouseY <= 150 && mouseY > 100 && mousePressed == true && beardIndex >=34 && beardIndex < 36) {
     beardIndex += 1;
   }
   image(beard[beardIndex],0,0);
   image(shaver[0],mouseX - 25,mouseY - 40);
   rot += .03;
}


