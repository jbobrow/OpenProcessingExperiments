

PFont miVariableTipo; //declaro variable
PFont miVariableTipo2;

void setup()
{
size(800,200);
background(255);
smooth();
miVariableTipo=loadFont("HelveticaNeue-UltraLight-72.vlw"); //cargar tipografía
miVariableTipo2=loadFont("GillSans-72.vlw");



}

void draw()
{
  background(255);
fill(255,0,0);
textFont(miVariableTipo);
textAlign(RIGHT);
text("Anáhuac", 700,100);

fill(0);
textFont(miVariableTipo2);
textAlign(LEFT);
text("Líderes de Acción Positiva", 0,200);

}





