
String tx = "CLICK TO START DOWNLOAD";
PFont f;
boolean mouseIsDown = false;
boolean loading = false;
 
void setup()
{
  size(500,400);
  background(0);
  f = createFont("Dotum-20.vlw", 20, true);
  smooth();
}
 
void draw()
{
  background(0);
  if(mouseIsDown == true)
  {
    loading = true;
    frameCount = 1;
  }
  if(loading == false)
  {
    fill(255);
    textAlign(CENTER);
    text (tx, 240, 200);
  }
  if(loading == true)
  {
    fill(255);
    textAlign(LEFT);
    text ("LOADING " + int((frameCount%301) / 3) + "%", 50, 130);
    rect(48, 138, 204, 24);
    fill(0);
    int fillX = ((frameCount%301) / 3 * 2);
    rect(250, 140, fillX-200, 20);
    if(frameCount%301 == 0)
    {
      loading = false;
    }
  }
}
 
void mousePressed() {
  mouseIsDown = true;
}
  
void mouseReleased() {
  mouseIsDown = false;
}



