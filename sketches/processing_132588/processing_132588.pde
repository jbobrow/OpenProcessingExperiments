
color start=color(0, 0, 0);
color finish;
float amt = 0.0;
int x, vx, y, vy, r=20;

void setup()
{
  background(0);
  size(400, 400);

  //declaramos valores iniciales para x,y
  x=int(random(0, width));
  y=int(random(0, height));

  //declaramos que la velocidad sea random
  vx= int(random(random(5, 9), random(1, 9) ));
  vy= int(random(random(5, 9), random(1, 9) ));
}

void draw() {

  fill(start); 
  ellipse(x, y, r, r);//escribimos ecuación de la elipse

  amt+= 0.015;
  if (amt >= 1) {
    amt = 0.9;
    start = finish;
    finish = color(random(255), random(255), random(255));
  }
  if ((x<10)||(x>width-10)) { //establecemos rebote X
    vx=-vx;
  }

  x=x+vx;


  if ((y<10)||(y>height-10)) { //establecemos rebote Y
    vy=-vy;
  }
  y=y+vy;
}



