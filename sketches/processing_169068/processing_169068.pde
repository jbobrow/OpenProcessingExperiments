
PFont font;
void setup()
{
  size(600,600);
  font = loadFont("AlNile-48.vlw");
  textFont(font);
}

void draw()
{
  if(mousePressed) {
    background(#124D00);
    fill(0);
    String s = "^";
    
    for (int i=0; i<100; i++) {
      float x=random(0,width);
      float y=random(0,height);
      float sz = random(10,100);
      int substrbegin = (int)random(0,s.length()-1);
      int substrend = (int)random(substrbegin+1, s.length()-1);
      textSize(sz);
      text(s.substring(substrbegin, substrend), x, y);
    }
  }
}
