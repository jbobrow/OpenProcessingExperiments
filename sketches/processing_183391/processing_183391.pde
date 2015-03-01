
color c=(0);
int x, y, xp, yp;
int strokeW=1,flag=0;
void setup()
{
  size(1280, 768);
  background(255);
}
void draw()
{
  noStroke();
  fill(c);
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

void mousePressed() {
  background(255);

}
