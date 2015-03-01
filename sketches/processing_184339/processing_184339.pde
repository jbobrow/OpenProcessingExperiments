
int total = 30;
float [] x = new float [total];
float [] y = new float [total];
float vl;
float sz;
PImage fondo;
PImage mov;
PImage exterior;
int demx;

void setup () {

  size(1200, 700);
  noSmooth();
  fondo = loadImage ("fondo.jpg");
  mov = loadImage ("dementor.png");
  exterior = loadImage ("patronus.png");

  for (int k=0; k<total; k+=2) {
    x[k]= x[k]+random(width/4, width/2);
    y[k]= y[k]+random(0, 2*height/3);

    vl= 20;
    sz= random (30, 40);
  }
}
void draw() {


  noStroke();
  fill(255, 25);
  image (fondo, 0, 0);

  //bucle difuso lanzamiento
  for (int i=700; i > 500&&i<701; i= i-5) {
    ellipse(i, i/2, i/2, i);
  }
  fill(255, 20);
  for (int j=200; j< 500; j= j+5) {
    ellipse(j, j/2, j, j/2);
  }

  //partículas que se dispersan en el extremo del bucle

  for (int k=0; k<total; k++) {
    x[k]= x[k]+random(-vl, vl);
    y[k]= y[k]+ random(-vl, vl);
    if (x[k]>= width/2|| x[k]<=width/4) {
      x[k] = -x[k];
    }
    if (y[k]>= 2*height/3|| y[k]<= 0) {
      y[k]= -y[k];
    }
    fill (255);
    ellipse (x[k], y[k], 10, 10);

    fill (188, 255, 234, 30);
    ellipse (x[k], y[k], sz, sz);
  }

  image (exterior, -30, 0);

//dementor - mouseX, mouseY, que no pase de () zona
/* demx = mouseX;
  (demx > 2*width/3);{
  image (mov, demx, mouseY);
  } */
  
 if (demx <= 2*width/3);{
   demx = 2*width/3;
   image (mov, demx, mouseY);
  } 
}



