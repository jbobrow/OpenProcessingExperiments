
int h = 0;
int s = 58;
int b = 100;
PFont font;

void setup()
{
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
  font = loadFont("ACaslonPro-Semibold-24.vlw");
}

void draw(){
  background (255);
  
  rectMode (CENTER);
  rect (300, 300, 200, 200);
     textFont (font, 24);
    stroke (100);
    text ("Red for recall and attention to detail.", mouseX, mouseY); 
  fill(h, s, b);
 if(h < 357)
  {
    h++;
  }
  else
  {
    background (0);
        fill (h, s, b);
    textFont (font, 24);
    stroke (100);
    text ("Let's make some toys.", mouseX, mouseY);
    fill (250, 50, 50);
    rect (300, 300, 200, 200);
  }
}
        

