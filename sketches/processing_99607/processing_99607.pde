
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
float g=0.5;
void setup() {
  size(400,400);
  background(0);
  stroke(200,100,0,200);
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
   y1[i] = mouseY +(2* sin(4*angulo)+g);
    angulo=angulo+0.45;
    line(mouseX, mouseY,50 , y1[i]);
    
   
  } 
}
void keyPressed()
{
  if (key=='a')
  {
     background(0);
  }
  
}



