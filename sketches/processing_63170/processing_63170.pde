
float x = 0;

float y = 0;
float a, r = 0;
float aktina = 70;
float prosimo = 1;
float prosimo_g = 1;
float diastasis;


void setup() {
  size(700, 600);
  noStroke();
  smooth();
}

void draw() {
   
  fill(0, 10);
  rect(0, 0, width, height);

 
  //rotate(r);
  //translate(x, 100);
  fill(255);

  translate(width/2 + r + sin(a)*(aktina), height/2 + y + cos(a)*(aktina) );
  rotate(r*6);
  rect( 0, 0, 30, 30);
  rect(diastasis, 0, diastasis, diastasis);


  //x = x + 4;

  if (y < (height/3)*(-1)) {
    y = -200;
    prosimo = -prosimo;
    
    diastasis = 30;
  }
  else 
    if (y > height/3) {
    y = 200;
    prosimo = -prosimo;
    prosimo_g = -prosimo_g;
    diastasis = 30;
  }


  if (r > 250) {
    r = 250;
    y = y - 2;
    diastasis = 0;
  }
  else 
    if (r < -250) {
    r = -250;
    y = y + 2;
    diastasis = 0;
  }
  else {
    r = r + 2 * prosimo;
  }
  // y = y + 1;

  a = a + 0.5*prosimo_g;

  println(prosimo);
}


