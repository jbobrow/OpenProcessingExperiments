
int x=20;
int y=20;

int dx=0;
int dy=5;

void setup() {  
  size(250, 250);

}

void draw() { 
background (255,255,255);

fill(0,255,0);
rect (x,y,20,20);

if (y>250) {
dy=-dy;}

if (y<0) {dy=-dy;}

y=y+dy

if (mousePressed) {
x=mouseX
y=mouseY

}
}
