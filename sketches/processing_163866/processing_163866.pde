
//PSICOLOGÍA DE LA GESTALT:
//Corriente psicologica moderna que se puede traducir como "forma".
//Se basa en que la mente configura elementos que le llegan a ella sin que esten presentes asimilandolos por contexto.

//En este caso se consiguen visualizar las líneas rectas que atraviesan la pantalla como si fueran curvas.
//Esto se debe al efecto que realizan los cuadrados del contexto haciendo pensar a la mente que las rectas bailan y no son rectas.


size (800, 400);
smooth();
background (255);
stroke(78, 78, 78);
strokeWeight (2);

int filas = 9; // así se pueden modificar todos los valores desde aquí
int columnas = 8;


for (int i=0; i<filas; i++)
{
  float x = map (i, 0, filas-1, 0, width);
  {
    pushMatrix();
    fill (0);
    translate(x, 0);
    rect (i, 0, 50, 50);
    popMatrix();

    pushMatrix();
    fill (0);
    translate(x+15, 50);
    rect (i, 0, 50, 50);
    popMatrix();

    pushMatrix();
    fill (0);
    translate(x+30, 100);
    rect (i, 0, 50, 50);
    popMatrix();

    pushMatrix();
    fill (0);
    translate(x+15, 150);
    rect (i, 0, 50, 50);
    popMatrix();

    pushMatrix();
    fill (0);
    translate(x, 200);
    rect (i, 0, 50, 50);
    popMatrix();

    pushMatrix();
    fill (0);
    translate(x+15, 250);
    rect (i, 0, 50, 50);
    popMatrix();

    pushMatrix();
    fill (0);
    translate(x+30, 300);
    rect (i, 0, 50, 50);
    popMatrix();

    pushMatrix();
    fill (0);
    translate(x+15, 350);
    rect (i, 0, 50, 50);
    popMatrix();
  }
}

noStroke();
fill (78, 78, 78);
rect (0, 50, width, 2);
rect (0, 100, width, 2);
rect (0, 150, width, 2);
rect (0, 200, width, 2);
rect (0, 250, width, 2);
rect (0, 300, width, 2);
rect (0, 350, width, 2);
