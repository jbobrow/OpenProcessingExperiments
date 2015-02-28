
class Pincel{

  // el pincel tiene:
  // posición (x,y), un ángulo y un radioS
  float x, y, x2, y2, ang, rad;
  // edad, edad máxima y semilla única para el noise
  int edad, edadMax, seed;
  // color de relleno y un incremento para ir animando el gris
  float HSB, grisSteps;
  // un switch para decir si está vivo o no
  boolean vivo;

  Pincel(float px, float py){
    x = px;         // toma el valor de entrada px como posición en x
    //y = py;         // toma el valor de entrada py como posición en y
    ang = PI; // en ángulo inicial es -90º
    rad = 20;        // el radio es 2
    edad = 0;       // la edad es 0
    edadMax = round(random(1000)); // calcula la edad máxima
HSB = #FFFFFF;       // el gris inicial es negro
    grisSteps = 255/(float)edadMax; //para calcular el paso a blanco lo divido por la edadMax
    vivo = true;    // está vivo 
    seed = round(random(100000)); // calcula la semilla única
  }

  void dibuja(){
    // sólo si está vivo
    if(vivo){
      calc();
    }

  }

  void calc(){
    noiseSeed(seed); // tiene que calcular 'noise' a partir de su semilla única

    ang += (noise(millis()/3000)) * PI/4;

    // identidad circular
    x2 = x + sin(ang) * rad;
    y2 = y + cos(ang) * rad;

    stroke(HSB);
    strokeWeight(1);
    line(x,y, x2, y2);


    x = x2;
    y = y2;
    // mantengo el pincel dentro de la pantalla
    if (x < 0) x += width;
    if (y < 0) y += height;
    if (x > width) x -= width;
    if (y > height) y -= height;

    // aumento la edad y aclaro el color
    edad ++;
    HSB += grisSteps;

    // y muere si ya es tiempo
    if(edad >= edadMax) vivo = false;



  }

}









