
//Realizado por:
//Calderon Castro Mariana 
//Mendoza Garcia Leo Joaquin Rodrigo

float x = 0.47;
float y = 5.65;
int a=1;
int w=0;
int j=270;

void setup() {
  size(600, 600);
  smooth();
}

void draw() {

  frameRate(10);
  background(0);


  for (int i=100 ; i <= 600 ; i+=30) { //bolitas blancas
    if (i > w) {
      fill(255);
      ellipse(i, 300, 20, 20);
    }
    else {
      fill(0);
      ellipse(i, 300, 20, 20);
    }

    fill(255, 0, 255);
    ellipse(w-200, 300, 100, 200); //fantasma
    fill(255);
    strokeWeight(0);
    ellipse(w-180, 250, 20, 30); //fantasma ojo
    fill(0, 0, 255);
    ellipse(w-172, 250, 10, 10); //fantasma cornea

    fill(255, 255, 0);
    //noFill();
    stroke(0, 0, 0);
    strokeWeight(2);

    arc(w, 300, 200, 200, x, y); //pacman
    fill(0);
    arc(j, 255, 30, 30, 0, TWO_PI); //pacman ojo
  }


  if (a==1) {      //movimiento pacman
    a=0;
    x=0.47;
    y=5.65;
  }
  else {
    a=1;
    x=0;
    y=TWO_PI;
  }

  if (w < 900) { //come bolitas blancas
    w+=10;
    j=w-30;
  }
  else {
    w=0;
    j=w+30;
  }
}
