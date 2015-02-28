

PFont miVariableTipo; //declaro variable

void setup()
{
size(800,200);
background(255);
smooth();
miVariableTipo=loadFont("HelveticaNeue-UltraLight-72.vlw"); //cargar tipografía

textFont(miVariableTipo);

}

void draw()
{
fill(255,0,0);
text("El Texto", 400,100);

}
