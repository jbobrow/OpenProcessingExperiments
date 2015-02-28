
void setup() {
  size(300, 300);
  background (255);
  smooth();
  frameRate(6);
}

void mouseClicked () {
  setup();
}
 
void draw() {
noStroke ();  
int x;
int y;
int ellipse1;
int ellipse2;

x = round(random(0, 400));
y = round(random(0, 250));
ellipse1 = round( random(150) );
ellipse2 = round( random(100) );
 
fill(230, 29, 140, 100);
ellipse (x, y, ellipse1, ellipse2);
 
fill(250, 167, 200, 100);
ellipse (x, ellipse1+y,ellipse2+x);

fill (246,104,178,100);
ellipse (y, ellipse1-y,ellipse2-x);
 
}



