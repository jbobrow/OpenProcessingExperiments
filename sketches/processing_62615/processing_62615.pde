

PFont font;

float ran=0;
int s=15;

int r=25;
int g=25;
int b=25;
int a=20;

void mousePressed() {
  background(255);
}

void setup() {

  size(900,700);
  strokeWeight(0.5);
  frameRate(15);
}
  
void draw() {
 
  
   smooth();

  fill(255,255,255,3);
  noStroke();
   font = loadFont("Monospaced-48.vlw"); 
textFont(font); 
String w = "A  N   T I   L O G";
text(w, 350, 300, 200, 200);

for(int y=10; y<height; y+= s) {
  
  stroke(r,g,b,a);
  line(10,y,mouseX,mouseY);
}


for(int y=10; y<height; y+= s) {
  
  stroke(r,g,b,a);
  line(width-10,y,mouseX,mouseY);
}

for(int x=10; x<width; x+= s) {
  
  stroke(r,g,b,a);
  line(x,10,mouseX,mouseY);
}


for(int x=10; x<width; x+= s) {
  
  stroke(r,g,b,a);
  line(x,height-10,mouseX,mouseY);
}


}

