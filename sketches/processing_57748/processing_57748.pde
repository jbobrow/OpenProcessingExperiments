
float posicion= 0.0;  //definición de transparencia
int diam = 10; //abreviación de diámetro
float centX, centY; //tamaño de la elipse

void setup(){
  frameRate(300);  //fotogramas por segundo
  size(400, 400);
  background(0);
  centX = width/2; //ancho dividido dos valor 250
  centY = height/2; //dividido dos valor 150
  noFill(); //sin relleno
}

void draw()
{
  posicion = posicion + .01;  //se le suma .01 constantemente a los valores dados arriba
  float n = noise(posicion) * height;  //es un número y noise es un número aleatorio y se multiplica la transparencia por el ancho. Es un random y por eso cambia de color
  strokeWeight(10);  //ancho de la línea
  stroke(random(255), random(255), random(255), 10);  //random de color /si se le saca el 10(número alpha) se elimina la transparencia y quedan los colores brillantes casi sin separación
  ellipse(200, n, 200, 300);  //el n es un número aleatorio
  fill(random(255), random(255), random(255), 50);
  smooth();
  if(diam <= 400){ //si la variable diam es menor o igual a 400, dibujará una ellipse
    // background(180);
    smooth();
    stroke(100, random(100), 100);
    strokeWeight(random(10)); //ancho
    ellipse(centX, centY, diam, diam);
    arc(centX, centY, 50, diam, diam, 50);
    diam += 10; //suma al diametro 10 pixeles
  }
}



