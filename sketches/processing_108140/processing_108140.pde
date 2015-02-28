
float xoffset = 50;
float yoffset = 50;
 
void setup() {
size(800, 800);
smooth();
noFill();
frameRate(2);
}
 
void draw() {
background(0);
}
void mousePressed() {
  stroke(63, 139, 214);
  int i = 0;
  while (i < 300){
ellipse( mouseX, mouseY, 10+xoffset*i, 10+yoffset*i);
i = i +1;

}
}
