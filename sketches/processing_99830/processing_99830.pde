
float x[] = new float [500];
float y[] = new float [500];
float x1[] = new float [500];
float y1[] = new float [500];
boolean xover = false;
boolean yover = false;
float line[] = new float [500];
int radians = 880;
float [] cos_vals = new float [radians];
float [] sin_vals = new float [radians];
float r = random (4,10);
float angulo=0;
int i=0;
void setup() {
  size(1000,400);
  background(random(0,255));
  stroke(100,155,100,200);
  smooth();
}
void draw() {
  if (mouseX <= 1000 && mouseY <= 1000) {
    xover = false; 
    yover = true;
  }
  if (mousePressed) {
    i++;
    if(i>= 500)
      i =0;
    //line(mouseX, mouseY, r*cos(i), r * sin (i));
    //ecuacion de circulo;
    x1[i] = mouseX + (80* cos(angulo));
    y1[i] = mouseY +(10* sin(angulo));
    angulo=angulo+0.01;

    ellipse(mouseX, mouseY, x1[i], y1[i]);
  } 
  else { 
    background (0);

  }

}


