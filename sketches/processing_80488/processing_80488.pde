
void setup()
  {
    size(700,400);
    background(180,70,100); //da el color del fondo
  } 

void draw()
  {
    noFill();
    smooth(); // suavisa las lineas del contorno.
    stroke(0);
    strokeWeight(8); // da el ancho del contarno.
    ellipse(350,150,100,100);
    stroke(0,0,255);
    strokeWeight(8);
    ellipse(241,150,100,100);
    stroke(255,0,0);
    strokeWeight(8);
    ellipse(459,150,100,100);
    stroke(255,255,0);
    strokeWeight(8);
    ellipse(294,200,100,100);
    stroke(0,255,0);
    strokeWeight(8);
    ellipse(404,200,100,100);
  }


