
PImage wand;
PImage bigBottle;
PImage smallBottle;


PImage water;
int bubbles;


void setup() {
  size(650,500);
  noStroke();

  wand = loadImage ("wand.png");
    water = loadImage ("water.png");
  bigBottle = loadImage ("bigbottle.png");
    smallBottle = loadImage ("smallbottle.png");

}
void draw() {
  background(250,71,71);
   int s = second();  
  int m = minute();  
  int h = hour();   
  
  image (wand,-150,0);
image(water,-150,0);

 for (int i = 1; i < m ; i++) {
 fill(250,71,71);
 rect(680+1,115+i,120,5*m);}
  
  for (int i = 1; i <= h ; i++) {
   image(smallBottle,i*25, 25);} 
   
   
   image (bigBottle,-150,0);

  

fill(255, 255,255,80);
 ellipse (250, height/2, s*7 , s*7);

}


