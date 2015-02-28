
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
float r = random (20,50);
float angulo=0;
int i=0;
void setup() {
  size(400,400);
  background(0);
  stroke(random(0,255),0,0,200);
  smooth();
}
void draw() {
  if (mouseX <= 400 && mouseY <= 400) {
    xover = true; 
    yover = true;
  }
  if (mousePressed) {
    i++;
    if(i>= 500)
      i =0;
    //line(mouseX, mouseY, r*cos(i), r * sin (i));
    //ecuacion de circulo;
    x1[i] = mouseX + (100* cos(angulo));
    y1[i] = mouseY +(100* sin(angulo));
    angulo=angulo+0.01;
    triangle(mouseX, mouseY, angulo,angulo,5,5);

   
  } 
  else { 
    background (0);

  }

}


