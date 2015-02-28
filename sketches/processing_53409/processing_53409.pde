
PFont newl;
String orbit = "Orbit";
float angle = 0.0;
PImage wren;

void setup()
{
 size (700,700);
newl = loadFont ("Newl-48.vlw");
wren = loadImage ("wren_phases.gif");
smooth();
textAlign(CENTER);
}

void draw ()
{
  background(255);
  image (wren, 0,0, 700,800);
  fill(255,251,203,200);
  rect(0,0,700,700);
  translate(mouseX,mouseY);
  fill(255);
  angle+=0.07;
  
  float sinVal = sin(angle)*90;
  
  float cosVal = cos(angle)*90;
  
  fill (36, 100,155);
  textFont(newl);
  textSize(60);
  text(orbit,cosVal, sinVal);
}

