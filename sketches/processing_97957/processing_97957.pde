
float x[] = new float [500];
float y[] = new float [500];
float x1[] = new float [500];
float y1[] = new float [500];
boolean xover = false;
boolean yover = false;
float line[] = new float [500];
int radians = 360;
float [] cos_vals = new float [radians];
float [] tan_vals = new float [radians];
float r = random (10,10);
float angulo=20;
int i=0;
void setup() {
  size(400,400);
  background(0);
  stroke(0,200,10,100);//verde
  smooth();
}
void draw() {
  if (mouseX <= 400 && mouseY <= 400) {
    xover = true; 
    yover = true;
  }
  if (mousePressed) {
    background (0);
  } 
  else { 
    
i++;
    if(i>= 500)
      i =0;
    //line(mouseX, mouseY, r*cos(i), r * sin (i));
    //ecuacion de circulo;
    //tangent
    x1[i] = mouseX + (50* tan(angulo));
    y1[i] = mouseY +(50* cos(angulo));
    angulo=angulo+0.01;

    line(mouseX, mouseY, x1[i], y1[i]);
  }

}
