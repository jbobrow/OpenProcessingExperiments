
PFont miVariableTipo; //declaro variable //tools/ create font
int aumenta=0;
void setup(){
size(800,200);
miVariableTipo=loadFont("Serif-48.vlw"); //cargar tipografía



}


void draw(){
  background(0);
  
textFont(miVariableTipo,aumenta); //selecciona tal tipografia de tal tamaño
fill(255,0,0);
text("Mario Badillo",0,100); //se anota el texto y posición

aumenta=aumenta+1;

}


