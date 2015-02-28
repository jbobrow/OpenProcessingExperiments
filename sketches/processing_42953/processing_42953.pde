
String tx = "DONE! CLICK TO RESET";
PFont f;
boolean mouseIsDown = false;
boolean loading = false;

void setup()
{
  size(300,300);
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
    text (tx, 150, 150);
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

//this function is called every time you press a mouse button
void mousePressed() {
  mouseIsDown = true;
}
 
//this function is called every time you release a mouse button
void mouseReleased() {
  mouseIsDown = false;
}
