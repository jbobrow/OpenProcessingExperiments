
import guru.ttslib.*;
TTS ttss;
//www.behance.net/greyfrog
int x, y, i, k;
PFont f;
void setup()
{
  size(400, 400);
  ttss = new TTS();
  x=width/2;
  y=height/2;
  smooth();
  f = createFont("HelveNueThin", 55);
  textFont(f);
}
 
void draw()
{
  background(0);
  int s = second();
  int m = minute();
  int h = hour();
 
  if (h<12 || h==12)
  {
    k = h;
  }
  else
  {
    k = h-12;
  }
  //------------------------
  noStroke();
  fill(255);
  ellipse(x, y, 300, 300);
  //------------------------
  pushMatrix();
  translate(x, y);
  rotate(radians(6*s));
  stroke(0);
  line(60, 60, 100, 100);
  popMatrix();
  //------------------------
  fill(24, 24, 24);
  noStroke();
  ellipse(x, y, 150, 150);
  //------------------------
  fill(#00A3F7);
  textAlign(CENTER);
  if (m<10)
  {
    textSize(55);
    text(k+":0"+m, x, y+20);
  }
  else {
    textSize(55);
    text(k+":"+m, x, y+20);
  }
  String i=String.valueOf(k);
  String j=String.valueOf(m);
  if (h<12 || h==12) {
    textSize(20);
    text("AM", x, y+40);
    if (mousePressed) {
      ttss.speak("Hello Sir the time is" + i+ " " + j + "AM"  );
    }
  }
  else
  {
    textSize(20);
    text("PM", x, y+40);
    if (mousePressed) {
      ttss.speak("Hello Sir the time is" + i+ " " + j + "PM" );
    }
  }
}


