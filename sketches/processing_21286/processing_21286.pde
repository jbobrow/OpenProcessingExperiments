
//very begining level 
PImage imagen;  // para cargar la imagen que usaré de fondo
int x = 0; //
int y = 50; //
void setup() {
 size(192,157);   
  imagen = loadImage("avila.jpg"); //carga la imagen como tal
  background(0);  
  image(imagen, 0, 0);    
  smooth();
  
}
void draw() {
image(imagen, 0, 0);
//usando un push/popMatrix (para que no digan...cof cof)
pushMatrix();
{
// fija la lluvia en el centro
translate(width/2, height);
//lluvia
strokeWeight (3);
stroke(0,250,250);
line(x, y, x+10, y-40); // línea izquierda
line(x+10, y, x+20, y-40); // línea central
line(x+20, y, x+30, y-40); // línea derecha
line(x+30, y, x+40, y-40); // línea izquierda
y = y + 2; // súmo 1 a Y cada vez que se hace el loop
if (y > height) { // (Si Y es mayor que el largo de la pantalla
y = -75; // …le asigno un valor –75 )
}
popMatrix();
//nube
noStroke ();
fill (84,85,85);
ellipse(125,23,50,45);
ellipse(135,28,50,45);
ellipse(115,33,50,45);
fill (204);
ellipse(130,20,50,40);
ellipse(140,25,50,40);
ellipse(120,30,50,40);
}
}

