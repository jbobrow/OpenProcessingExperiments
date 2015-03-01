
void setup() {
  size (500, 400);
  smooth();
  fill(40, random(50, 60));
  background(0); //Figura - Negro
} // Setup

void draw() {
  background(255); //blanco

  for (int i=1; i<=6; i++) {
    float ruido = frameCount/1000.0;
    bezier(
    250.0, 400, 
    noise(1, i, ruido)*width, noise(1, i, ruido)*height/2, 
    noise(15, i, ruido)*width, noise(1, i, ruido)*height/2, 
    250.0,0.0);

    println();
    
  } // for
} // Draw

void keyPressed()
{
  if (keyCode == '1') {
    noStroke();
  } else if (keyCode == '2') {
    stroke(4);
  } else if (keyCode == '3') {
    stroke(255);
  } else if (keyCode == '4') {
    noFill();
  } else if (keyCode == '5') {
    fill(40, random(50, 60));
  }
  else if (keyCode == 'T') {
    saveFrame("noise/######.jpg");
  }
  
}



