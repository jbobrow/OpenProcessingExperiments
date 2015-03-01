
  int x=0;
  int k=0;
  int a=mouseX;
  int timer = 0;
  void setup()
  {
    size(500,500);
    background(0,0,0);
  }
  void keyPressed() 
  {
   background(255,255,255);
    fill(randomColor());
    textSize(40);
    text("Stop pressing space",65,300);
    frameRate(10);
  }
  void keyReleased()
  {
    frameRate(1000);
    background(0,0,0);
  }
  void mouseDragged() 
  {
    stroke(0,0,0);
    fill(0,0,0);
    ellipse(mouseX,mouseY,200,200);
  }
  void mousePressed()
  {
    k=k+1;
    k=k*10;
  }
  void mouseReleased()
  {
    k= k*0;
  }
  color randomColor()
    {
      return color(random(100), random(0), random(255));
    }
  void circlesAndSquares(int n)
  {
    if (k>0)
    {
      stroke(randomColor());
      strokeWeight(2);
      fill(randomColor());
      ellipse(mouseY, mouseX, mouseX*.4, mouseY*.4);
    }
    else
    {
      stroke(0,0,0);
      strokeWeight(2);
      fill(0,0,0);
      quad(mouseX-50, mouseY-50, mouseY-50, mouseX-50, mouseX+50, mouseY+50, mouseY+50, mouseX+50);
    }
  }
  void draw()
  {
    {
    for (int i = 0; i < 500; i = i+5) {
    for (int j = 0; j < 500; j = j+5) {
      stroke(random(x),random(x+j), random(x+i));
      point(i, j);
    }
  }
    }
     while (millis() > timer)
    {
      timer += 10;
      circlesAndSquares(2);
    }
  }
