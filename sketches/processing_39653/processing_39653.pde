
float perro=10;

void setup () {
  size (500, 500);
  background (0);
  noStroke ();
}

void draw () {

  for (int X=0; X<500; X=X+10) { //maya básica de circulos 
    for (int Y=0; Y<500; Y=Y+30) {
      fill(random(255), random(255), 125);
      ellipse (X, Y, 20, 10);
     }
  }
  if (mousePressed == true) { //condicioal de mouse activo que generra triángulos desde el centro a la posición del mouse 
    fill(random (255), random(255), random(perro));
    triangle (pmouseX-perro, pmouseY-perro, mouseX, mouseY,width/2, height/2);
    
  }
}


