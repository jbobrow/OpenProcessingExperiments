
int x=0;
int y=0;
int z=x;
int a=x;
int b=x;
int c=x;
int d=x;
int e=x;
int f=x;
int g=x;
int h=x;

void 
setup(){
size(600,600);
background(0);
println("Activo keyPressed...  hace algo extraño al principio, como que en lo que se acomoda el eje x, pero... logré que avanzara así... ni modo, muchas variables pero funciona y ese es el chiste... creoooo además cambia de colores, está pacheco o algo jaja... saludos...");
}
  

void 
draw()
{
}
void 
keyPressed()
{
  background(0);  
/*Nopal*/
fill( random(255), random(255), random(255)); 
ellipse(x,300,500,500);
x=x+10;


/* Bandera */
fill(198,23,4);
rect(y,400,50,80);
y=x+50;
fill(6,90,25);
rect(y,400,50,80);
y=x-40;
fill(255);
rect(x,400,50,80);
x=x;
fill(100,78,37);
ellipse(h,440,20,20);
h=x+34;

/*Bigote*/ 
fill(0);
stroke(0);
ellipse(z,280,80,80);
z=x+80;
ellipse(a,290,130,81);
a=x+110;
fill(255);
stroke(0);
ellipse(b,230,130,130);
b=x+160;
fill(0);
stroke(0);
ellipse(c,230,50,50);
c=x+180;
fill(0);
ellipse(d,280,80,80);
d=x;
ellipse(e,290,130,81);
e=x-30;
fill(255);
ellipse(f,230,130,130); 
f=x-80;
fill(0);
ellipse(g,230,50,50); 
g=x-60;

}

