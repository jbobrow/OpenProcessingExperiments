
import controlP5.*;
ControlP5 cp5;
public int flaeche = 0;
public int transparenz = 0;
float var = 0;
boolean play = true;
void setup()
{
background(240);
size(1000, 1000);
frameRate(2);
cp5 = new ControlP5(this);
// name, minValue, maxValue, defaultValue, x, y, width, height
cp5.addSlider("sliderA", 0, 400, 100, width-110, 10, 100, 14).setId(1);
cp5.addSlider("sliderB", 0, 255, 0, width-110, 30, 100, 14).setId(2);
}
void draw()
{
if (play == true) {
noStroke();
float a = random(flaeche);
arc(width/2, height/2, a, a, random(-TWO_PI, TWO_PI), random(-TWO_PI, TWO_PI));
var = round(random(0.5, 4.5));
if (var == 1) fill(210, 113, 19, transparenz);
if (var == 2) fill(122, 61, 76, transparenz);
if (var == 3) fill(69, 100, 43, transparenz);
if (var == 4) fill(43, 80, 90, transparenz);
}
}
public void controlEvent(ControlEvent theEvent) {
switch(theEvent.getId()) {
case(1):
flaeche = (int)(theEvent.getController().getValue());
break;
case(2):
transparenz = (int)(theEvent.getController().getValue());
break;
}
}
