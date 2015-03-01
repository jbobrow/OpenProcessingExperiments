


void setup () {
  size(800, 600);
}


void draw() {
  float velocidad = dist (mouseX, mouseY, pmouseX, pmouseY);
  println (velocidad);
  if (velocidad > 150.20) { 
    background (255, 40, 200);
  }
  else { 
    background (0);
  }
}

