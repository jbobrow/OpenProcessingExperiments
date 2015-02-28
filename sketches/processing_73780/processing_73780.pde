
int t = 0;

void setup(){
  size(640, 480);
}

void draw(){
  PFont font;
 font = loadFont("AmericanTypewriter-Bold-48.vlw");
 textFont (font, 100);
 fill(250,250,250,40);
 text("we all live in the yellow submarine",8,9);
 text("a yellow submarine. Yellow submarine",8,89);
 text("we all live in the yellow submarine",4,169);
 text("a yellow submarine. Yellow submarine",4,209);
 text("we all live in the yellow submarine",2,300);
 
 text("we all live in the yellow submarine",4,800);
 text("a yellow submarine. Yellow submarine",2,600);
text("a yellow submarine. Yellow submarine",floor(random(width)), floor(random(height)));

for (int i=0; i<127; i++)
  text("D", floor(random(width)), floor(random(height)));
noFill();
fill(0);

ellipseMode(CENTER);
int steps = 500;
for (int i = 0; i <= steps; i++) {
  float t = i / float(steps);
}
for (int i=0; i<127; i++) {
  int randomX = floor(random(width));
  int randomY = floor(random(height));
  point(randomX, randomY);
}
 strokeWeight(t);
  line(pmouseX,pmouseY,mouseX,mouseY);
  t= abs(mouseX - pmouseX);
}


