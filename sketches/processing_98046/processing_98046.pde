
float x[] = new float [500];
float y[] = new float [500];
float x1[] = new float [500];
float y1[] = new float [500];
boolean xover = false;
boolean yover = false;
float line[] = new float [500];
int radians = 360;
float [] cos_vals = new float [radians];
float [] sin_vals = new float [radians];
float r = random (10,50);
float angulo=0;
int i=0;
void setup() {
  size(400,400);
  background(0);
  stroke(200,0,200,500);
  smooth();
}
void draw() {
  if (mouseX <= 100 && mouseY <= 100) {
    xover = true; 
    yover = true;
  }
  if (mousePressed) {
    i++;
    if(i>= 100)
      i =0;
    //line(mouseX, mouseY, r*cos(i), r * sin (i));
    //ecuacion de circulo;
    x1[i] = mouseX- (90* cos(angulo));
    y1[i] = mouseY -(90* sin(angulo));
    angulo=angulo+0.1;

    line(mouseX, mouseY, x1[i], y1[i]);
     
  } 
  else { 
    background (0);

  }

}


