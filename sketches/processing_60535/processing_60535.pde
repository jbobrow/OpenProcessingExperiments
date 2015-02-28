
PFont miVariableTipo;
PFont miVariableTipo2;
void setup()
{
  size(800,200);
  background(0);
  frameRate(98);
fill (random(255),random(3),random(11));
  miVariableTipo=loadFont("Babalu-72.vlw");
    miVariableTipo2=loadFont("Cracked-72.vlw");
  
}

void draw()
{

 fill (255,3,11,5);
   textFont(miVariableTipo);
    translate(mouseX,mouseY);
  text("Mirko Stroker",mouseX,mouseY);
  
  fill (255,255,255,5);
   translate(mouseX,mouseY);
  
  textFont(miVariableTipo2);
   text("Vampire Chronicles",mouseX,mouseY);
   
}
 

