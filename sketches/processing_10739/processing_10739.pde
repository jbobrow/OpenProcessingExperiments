
//Trabajo de Adriana Tobar y Diana Lorena Mora
int cantidadNubes=40;
Nube[]nubes=new Nube[cantidadNubes];



void setup(){
size(350,400);

frameRate(10);
smooth();
noStroke();
//se crean todas las nubes
for(int contNube=0;contNube<cantidadNubes;contNube++){
  nubes[contNube]=new Nube((int)random(0,300), (int)random(10,280),
  color((int)random(240,255),120), (int)random(5,10),(int)random(10,15));
  }
}

void draw(){
  background(#71C7FF);
   fill(#E3FF31);
  ellipse((width/2)-20,(height/2)-20,80,80);
  nubes[(int)random(0,cantidadNubes)].crecer();
  for(int contNube=0;contNube<cantidadNubes;contNube++){
    nubes[contNube].pintar();
    }
  }
  
  

