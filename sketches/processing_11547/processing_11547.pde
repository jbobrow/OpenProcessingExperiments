
class Ball
{
//variables de nuestra clase.
int wWidth;
int wHeight;
int bSize;
int x, y;
int xDirection, yDirection;
//Constructor. Se llama cuando creamos una "nueva pelota"
Ball(int windowWidth, int windowHeight, int ballSize)
{
wWidth = windowWidth;
wHeight = windowHeight;
bSize = ballSize;
x = 5;
y = 3;
xDirection = 5;
yDirection = 3;
}
// este es un constructor sobrecargado
Ball(int windowWidth, int windowHeight, int ballSize, int xPosition, int
yPosition)
{
this(windowWidth, windowHeight, ballSize);
x = xPosition;
y = yPosition;
}
// nuestro método para determinar la posición actual de la pelota
void compute()
{
if (x < wWidth && x > 0)
{
// Move along x axis
x += xDirection;
}
else
{
// cambia la dirección, de positivo a negativo y vice versa
xDirection = xDirection * -1;
x += xDirection;
}
if (y < wHeight && y > 0)
{
y += yDirection;
}
else
{
yDirection = yDirection * -1;
y += yDirection;
}
}
// esto despliega la pelota, que se llama en la funcion main draw
void display()
{
compute();
rectMode(CENTER);
fill(255,176,255);
rect(x,y,bSize,bSize);
}
}
Ball aBall, anotherBall;
void setup()
{
size(500,200);
aBall = new Ball(width,height,100);

// llama al constructor de peolota para crear nueva pelota
anotherBall = new Ball(width,height,40,300,20); // Same..
}
void draw()
{
background(64,0,128);
aBall.display();
// llama la funcion metodo display del objeto pelota.
anotherBall.display();
// llamalo en el objeto anotherBall object.
}

