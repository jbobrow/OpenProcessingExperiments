
int x,y,xc,yc;
PImage fondo;
void setup() {
size(567, 425);
fondo = loadImage("tarea 1.jpg");
}
void draw() {
background(fondo);
if (mousePressed)

x=600-mouseX-25;
y=580-mouseY-25;
xc=255-x;
yc=255-y;
fill(x-20,y-100,-200);
ellipse(x,y,50,50);
ellipse(x+100,y,70,50);
ellipse(x,y-50,10,50);
ellipse(x-100,y,70,50);
ellipse(x,y,20,20);


//fila de circulos derecha

ellipse(x+10,y,20,20);
ellipse(x+20,y,20,20);
ellipse(x+30,y,20,20);
ellipse(x+40,y,20,20);
ellipse(x+50,y,20,20);

//fila de circulos izquierda
ellipse(x-10,y,20,20);
ellipse(x-20,y,20,20);
ellipse(x-30,y,20,20);
ellipse(x-40,y,20,20);
ellipse(x-50,y,20,20);

//cuerpo
quad(x+20,y-10,x+130,y-30,x+110,y-115,x+40,y-140); 
quad(x-20,y-10,x-130,y-30,x-110,y-115,x-40,y-140); 
//lineas isquierda lala
line(x-100,y-100,x-22,y-15);
line(x-110,y-100,x-22,y-15);
line(x-120,y-100,x-22,y-15);
line(x-130,y-100,x-22,y-15);
line(x-140,y-100,x-22,y-15);
line(x-150,y-100,x-22,y-15);

// lines derecha
line(x+100,y-100,x+22,y-15);
line(x+110,y-100,x+22,y-15);
line(x+120,y-100,x+22,y-15);
line(x+130,y-100,x+22,y-15);
line(x+140,y-100,x+22,y-15);
line(x+150,y-100,x+22,y-15);
}




