
float strokeA=6;
float strokecolor1 = 0;
float strokecolor2;
float strokecolor3;
float bg;
boolean colorchange;
void setup()
{
  size (600, 600); 
  background(255); 
  smooth();
  strokeWeight(6);
}

void draw()
{
  stroke(random(1, 255), random(1, 255), strokecolor3); //press z to make line bigger 
  strokeWeight(strokeA);                                //press x to make line smaller
  line(pmouseX, pmouseY, mouseX, mouseY);               //press c to clear screen
  if (strokeA==0)                                       //click the mouse to switch to the next set of random colors
  {
    strokeA=6;
  }
}
void mouseDragged() 
{
  if (colorchange==false) {
    strokecolor3 = strokecolor3 + 5;
  }
  if (strokecolor3 > 255) {
    colorchange= true;
  }
  if (colorchange) {
    strokecolor3-=5;
  }
  if (strokecolor3<0) {
    colorchange=false;
  }
}
void keyPressed() {
  if (key=='c' || key == 'c') {
    background(255);
  }
  if (key=='z' || key == 'z') {
    strokeA= strokeA+1;
  }
  if (key=='x' || key == 'x')
  {
    strokeA= strokeA-1;
  }//if (key=='v' || key == 'v')
  {
    //background(255,0,0);
  }
}


