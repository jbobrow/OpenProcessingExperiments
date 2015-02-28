
float x[] = new float [500];
float y[] = new float [500];
float x1[] = new float [500];
float y1[] = new float [500];
boolean xover = false;
boolean yover = false;
float line[] = new float [500];
int radians = 680;
float [] cos_vals = new float [radians];
float [] sin_vals = new float [radians];
float r = random (10,20);
float angulo=0;
int i=0;
void setup() {
  size(500,500);
  background(125);
  stroke(200,2000,20,200);
  smooth();
}
void draw() {
  if (mouseX <= 500 && mouseY <= 500) {
    xover = true; 
    yover = true;
  }
  if (mousePressed) {
    i++;
    if(i>= 600)
      i =0;
    //line(mouseX, mouseY, r*cos(i), r * sin (i));
    //ecuacion de circulo;
    x1[i] = mouseX + (100* cos(angulo));
    y1[i] = mouseY +(100* sin(angulo));
    angulo=angulo+0.05;

    line(mouseX, mouseY, x1[i], y1[i]);
  } 
  else { 
    background (120);

  }

}


