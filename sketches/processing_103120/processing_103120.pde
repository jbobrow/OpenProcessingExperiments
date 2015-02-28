
void setup() {
 size(500, 500); 
}

void draw() {
 background(0);
 stroke(0); 
  


// Cuadro superior izquierdo

fill(distance(0, 0, mouseX, mouseY));
rect(0, 0, width/2-1, height/2-1);


// Cuadro superior derecho
fill(distance(width, 0, mouseX, mouseY));
rect(width/2, 0, width/2-1, height/2-1);

//Cuadro inferior izquierdo

fill(distance(0, height, mouseX, mouseY));
rect(0, height/2, width/2-1, height/2-1);

// cuadro inferior derecho
fill(distance(width, height, mouseX, mouseY));
rect(width/2, height/2, width/2-1, height/2-1);

}

float distance(float x1, float y1, float x2, float y2)
{
  float dx = x1 - x2;
  float dy = y1 - y2;
  float d = sqrt(dx*dx + dy*dy);
  return d;
}
