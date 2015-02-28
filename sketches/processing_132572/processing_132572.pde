
void setup() {
  size(600,600);
  noLoop();
}
int i = 0;
void draw() {
while (i < 600) {
  line(1, i, 600, i);
  i = i + 5;}
int e = 0;  
while (e < 600) {
  line(e, 1, e, 600);
  e = e + 5;  } }
  void mousePressed() {
  loop();  // Holding down the mouse activates looping
}

void mouseReleased() {
  noLoop();  // Releasing the mouse stops looping draw()
}
  int x = 0;
int y = 0;
while (x<height)
while (y<width-100) { 
stroke(250,0,0);
  line(x,y,width/2,height/2); 
x=x+10;
y=y+5; }
