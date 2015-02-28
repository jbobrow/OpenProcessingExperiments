
//radom lines, random red, 
http://hascanvas.com/stvnradomlines
float x1, y1, x2, y2;

void setup() {
 size(800, 400);
 frameRate(24);
 smooth();
 background(0,0,0,0);
 strokeWeight(1);
}

int numLines = 0;
int maxLines = 30;

void draw() {
 if(numLines > maxLines){ return; }
 ++numLines;
 strokeWeight(random(10));

 x2 = x1;
 y2 = y1;
 x1 = random(0, width);
 y1 = random(0, height);

 stroke(random(255), 2, 2);
 line(x1, y1, x2, y2);
}

void mousePressed() {
 background(255);
 numLines = 0;
}
