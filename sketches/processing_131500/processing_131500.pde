
PFont myfont;

void setup()
{
  size(displayWidth,displayHeight);
  frame.setResizable(true);
  
  textSize(60);
  myfont = createFont("Helvetica Neue CE 35 Thin", 90);
  textFont(myfont);
  textAlign(CENTER);
  frameRate(1);
  
  //println(PFont.list());
}

void draw()
{
    background(0);
    int s = second();
    int m = minute();
    int h = hour();
    String t = h + ":" + nf(m, 2) + ":" + nf(s, 2);
    //println(t);
    text (t, width/2, height/2);
}
  
