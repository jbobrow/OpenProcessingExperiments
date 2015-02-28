
float x;
float y;
float vx;//velocidad x
float vy;//velocidad y

void setup()
{
size(600,600);
smooth();
vx=5;//velocidad x es igual a 5, siempre menos "if"
vy=5;//velocidad y es igual a 5, siempre menos "if"
}

void draw()
{
fill(255, 10);//rellenar de blanco (255) con transparencia (10) el rectangulo
rect(0,0,width, height);//dibujamos un rectángulo para tener control sobre el con "fill"

x=x+vx;
y=x+vy;

ellipse(x,y,20,20);

if (x>width)
{
  vx=-5;
}

}
