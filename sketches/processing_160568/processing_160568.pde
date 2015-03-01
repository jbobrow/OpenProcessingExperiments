
ccolor c=color(0);
int x, y, xp, yp;
int strokeW=1,flag=0;
void setup()
{
  size(1000, 1000);
  background(255);

}
void draw()
{
text("Draw", 450, 100);
  fill(0, 102, 153);
  text("Use Space to change color", 0, 100);
  text("Press Up arrow to increase the size", 0, 125);
  text("Press Down arrow to increase the decrease", 0, 150);
  text("Press C to clean the page", 0, 175);
noStroke();
fill(c);
triangle(30, 75, 58, 20, 86, 75);
stroke(c);
strokeWeight(strokeW);
  if(flag==1) line(mouseX, mouseY, pmouseX, pmouseY);
}
 
void mouseDragged() {
  flag=1;
}
void mouseReleased(){
  flag=0;
}
void keyPressed() {
  if (key == 'c') 
    background(255);
  if (key == CODED) {
    if (keyCode == UP) strokeW++;
    if (keyCode == DOWN) strokeW--;
  }
  if (strokeW<0)strokeW=1;
  if(key== ' ') c = color(random(1,255),random(1,255),random(1,255));
}
