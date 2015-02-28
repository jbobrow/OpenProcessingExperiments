
/**
 * Grid Generator
 */
 
PFont font;
import processing.pdf.*;
boolean record;
int numFrames = 26; // The number of animation frames
PShape[] images = new PShape[numFrames];
int x;
int y;

void setup() {
size(640, 480);
background(255);
noStroke();
font = createFont("Swiss 721 Bold BT", 30);
textFont(font);

for (int i = 1; i<numFrames; i++) {
String imageName = "0-" + nf(i, 2) + ".svg";
images[i] = loadShape(imageName);
}
noLoop();
}

void draw() {
if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(PDF, "frame-####.pdf"); 
  }
  
  background(255);
  for (y = 22; y <=389; y +=61) {
for (x = 38; x <= 493; x +=82) {

int r = int(random(10));
if (r == 0 || r == 1) {
int frame = int(random(1, numFrames));
shape(images[frame], x, y);
//delay(100);
} else if( r == 2) {
int r2 = int(random(2));
if (r2 == 0) {
  fill(0);
text("TEXT", x, y+30);
} else {
  fill(255);
text("TEXT", x, y+30);
}
} else if( r == 3) {
  fill(100);
rect(x,y, 317, 178);
}
}
}
delay(100);

  if (record) {
    endRecord();
	record = false;
  }
String[] fontList = PFont.list();
println(fontList);
}



void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}

void keyPressed() {
  if (key == 'p') {
  record = true;
  loop();
  }
}

