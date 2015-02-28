
void setup() {
size(960, 600);
}
 float y=0.0;
void draw() {
  frameRate(1500);
  background (0,0,0,255);
 float x=random(0,501);
 if (x>100) 
  {PImage img; 
img = loadImage("a2.jpg");
image(img, 500, 350,449,249);
} 
if (x>300) {
  PImage img; 
img = loadImage("a3.jpg");
image(img, 500, 40,449,249);
} 
if (x>450) {
PImage img; 
img = loadImage("a1.jpg");
image(img, 20, 40,449,249);
}
if (x>10) {
PFont font; 
font = loadFont("Andalus-48.vlw"); 
textFont(font); 
fill(255);
textSize(18);
textAlign(CENTER);
text("Visualisation gender issues in  ", y+40,y); 
textSize(50);
text("Diego Velazquez", y+40,y+40);
text("paintings", y+10,y+80);
y=y+4;
}
if (mouseButton == RIGHT) {
PFont font; 
font = loadFont("Andalus-48.vlw"); 
textFont(font); 
fill(255);
textSize(18);
textAlign(CENTER);
textSize(50);
text("by Radoslaw Bomba", y+10,y+10);
y=y+0.5;
}
}


