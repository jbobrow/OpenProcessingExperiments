
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
  size(800,800);
  background(0);
  stroke(200,random(0,250),0,random(0,250));
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

    ellipse(mouseX, mouseY, 50, 50);
    fill(0,150,200,random(0,250));
  } 
  else { 
    background (0);

  }

}
