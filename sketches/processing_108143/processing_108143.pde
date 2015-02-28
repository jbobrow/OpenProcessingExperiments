
float xoffset = 3;
int yoffset = 3;

void setup (){
  size(800, 800);
smooth();
}
 
void draw() {
background(164, 206, 250);
strokeWeight (10);
stroke (0,0,0);
fill (255,255,255);
 int i = 300;
  while (i > 0) {
    ellipse (width/2,height/2,5+xoffset*i,5+yoffset*i); 
    i = i - 10; // or i--
    println (i);}
noFill ();
strokeWeight(8);
stroke (255,255,255);
for (int x = 800; x > 0; x -=50) {
triangle (x, height/2, x-100, height,x-100,0);}
for (int x = 0; x < 800; x +=50) {
triangle (x, height/2, x+100, height,x+100,0);}
}
