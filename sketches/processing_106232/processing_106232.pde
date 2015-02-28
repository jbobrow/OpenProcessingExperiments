
//Class Burbuja
class Burbujas {
  //Campos
  float temp,temp2,temp3;
  float x, y; // Las coordenadas x e y de la particula
  float vx, vy; // Las velocidades en el eje x e y
  float radius; // El radio de las partículas
  float gravedad = 0.02; //valor de gravedad
  //definimos el constructor
  Burbujas(int xpos, int ypos, float velx, float vely, float r) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
    radius = r;
  }
  //una función que actualiza los valores
  void update() {
    if ((key == 'g') && (keyPressed)){  //aumenta la gravedad
       gravedad +=  0.001 ;}
      if ((key == 'u') && (keyPressed)){  //disminuye la gravedad
       gravedad -= 0.001;}
    vy = vy + gravedad;
    y += vy;
    x += vx;
  }
  
  //una funcion que muestra la particula
  void display() {          //creamos unos ifs para tirar color
    if (key == 't'){                     //t es azar  
    temp  = random(0,255);             //random
    temp2 = random(0,255);
    temp3 = random(0,255);
    c = color (temp, temp2, temp3);}
  if (key == 'r'){                  //si apretamos "r"ojo
       c = #791111;}
  if (key == 'v'){                  //si apretamos "v"erde
       c = #198304;} 
  if (key == 'a'){                  //si apretamos "a"zul 
       c = #0040C6;}
  fill(c);
     ellipse(x, y, radius*2, radius*2);}
  }

