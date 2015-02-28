
void setup() {
size(960, 600);
}
float y = 0.0;
void draw() {
  background (0,0,0,255);
  frameRate(1000);
 float x=mouseX;
 if (x>300) 
  {PImage img; 
img = loadImage("a2.jpg");
image(img, 400-y, 300-y,449,249);
y=y+1;
} else  {PImage img; 
img = loadImage("a1.jpg");
image(img, y, y,449,249);
y=y+1;
} 
if (y>100) {y=0.0;}

if (mouseButton == LEFT) {
  PImage img; 
img = loadImage("a3.jpg");
image(img, mouseX, mouseY,500,300);
} 
if (mouseButton == RIGHT) {
PFont font; 
font = loadFont("Andalus-48.vlw"); 
textFont(font); 
fill(255);
textSize(18);
textAlign(CENTER);
text("Visualisation gender issues in  ", mouseX+40,mouseY); 
textSize(50);
text("Diego Velazquez", mouseX+40,mouseY+40);
text("paintings", mouseX+40,mouseY+80);
}
}


