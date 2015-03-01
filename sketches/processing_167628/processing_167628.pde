
/* @pjs font = "Dialog-48.vlw"; */

PFont font;
float angle = 0.0;
String s = "My name is Sophie Feller";
  
void setup (){
  size (300, 300);
  font  = loadFont ("Dialog-48.vlw");
  textFont (font);
  fill (0);
  
}

void draw (){
  background (217, 172, 247);
  angle += 0.04;
  pushMatrix ();
  translate (0, 10);
  rotate (angle);
  scale (0.5);
 
  text (s, 0, 0);
  translate (150, 150);
  rotate (angle * .2);
  
  text (s, 0, 0);
  rotate (angle * .3);
  translate (-150, -150);

  text (s, 0, 0);
  rotate (angle * .4);
  translate (150, 150);
  text (s, 0, 0);
  
  rotate (angle * .5);
  translate (-150, -150);
  text (s, 0, 0);
  popMatrix ();

}

  




