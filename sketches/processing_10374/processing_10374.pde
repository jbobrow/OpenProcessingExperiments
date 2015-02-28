
/*
PROYECTO 01 SESION 4 :
 Titulo: array_quadrados
 Nombre:Lluc Llobell
 Fecha:  10/06/2010
 Lugar:Girona
 */





size(500,500);

//Constante tamaño del array
int nElem = 50;
float[] amplada = new float[nElem]; //Creamos el array con su tamaño


//llenamos el array de anchuras que sera tambien altura
float w = 0;
for (int i = 0; i < nElem; i++) {
  w = random(0,50);
  amplada[i] =  w;
}

//pintamos los cuadrados segun las anchuras/alturas del array.
float rand_blur = 0;
for(int j=0; j < nElem; j++){

  rand_blur = random(0,5); //Blur random
  float x = 0;
  float y = 0;
  //si son pares, a la izquierda y azules
  if(j%2 == 0){ 
    fill(40,30,150);
    filter(BLUR,rand_blur);

    x = random(0,250);
    y = random(0,500);

  }
  else{ 
    //si son impares: a la derecha y de color rojo
    fill(150,15,25);
    
    x = random(250,500);
    y = random(0,500);
  }

  //pintamos el rectangulo con las dimensiones que estan dentro del array.
  rect(x, y, amplada[j], amplada[j]);

}










