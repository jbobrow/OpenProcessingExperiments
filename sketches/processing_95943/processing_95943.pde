
float[] x = new float[300];
int bBx = -10000;
int time1 = 2000;
int time2 = 4000;
PImage img;
PImage img2;
PFont font;

void setup() {
size(320, 480);
smooth();
img = loadImage("Background.png");
img2 = loadImage("grass.png");

for (int i= 0; i <x.length; i++){
  x[i] = random (-3000, -30);
}
}


void draw() {
image (img, 1, 1);
image (img2,1,38);


fill(224,255,255);
for (int i =0; i< x.length; i++){
  x[i] += 1;
  float y = i * 10;
  ellipse(y,x[i], 10,20);
}
     
fill(240,179,45); // lines going down left
for(int y=bBx; y <=430; y+=100)
    {
       fill(300,179,45);
       rectMode(CENTER);
       rect(5,y,20,55);
     }
   bBx++;
 
 
fill(240,179,45); // lines going down right
for(int y=bBx; y <=430; y+=100)
    {
       fill(300,179,45);
       rectMode(CENTER);
       rect(315,y,20,55);
     }
   bBx++;
}


