
// RICARDO LOPEZ FUENTES ALBARRAN


int r = 10;
int z = 60;

float x = 90;
float y = 90;
float xspeed = 2;
float yspeed = 3;

void setup() {
  size(900, 900); //tomara las dimenciones de la pantalla donde se reprodusca. 
  smooth();
  background(6);
}

void draw() { 
r=r+5000; 
// mientras mas disminuye el valor 5000, mas se tardara en cambiar el tono de la elipse
z=z+r;
  noStroke();
  fill(r,60/z);
  rect(0,0,width,height);
  
  
  x = x + xspeed;
  y = y + yspeed;

  // causara los rebotes de la elipse.
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1.0011; // los ceros causaran un retraso en la velocidad, cuando aumenta el tiempo de reproduccion aumentara la velocidad y llegara un momento en el que ya no se vera movimiento. 
  }
  if ((y > height) || (y < 6)) {
    yspeed = yspeed * -1.003; // los ceros son los que causan el retraso al igual que ocurre en el eje x.
  }

  // las especificaciones de la elipse.
  stroke(0);
  fill(175-r);
  ellipse(x,y,20,20);
}

void mousePressed() {
  println("no pasa nada si das click, pero la pantalla se seguira llenando durante aproximadamente 20 min"); 
}

// este mensaje aparecera cuando el usuario presiona click


