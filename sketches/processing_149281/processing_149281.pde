
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/11400*@* */ /* !do not delete the line above, required for linking your tweak if you upload again */ float[] x = {};

float[] y = {};
//@Float [] y = {}; declara un array de floating points llamada "y"
int[] c = {};
//int[] c = {}; declara un array de números enteros llamada "c"
int[] v ={};
//int[] v = {}; declara un array de números enteros llamada "v"

void setup() 
{
size(710,390);
background(0); 
}

void draw()   
//Draw ejecuta en bucle las lineas de código contenidas en su interior.

{for( int xx=0;
//intxx se refiere a cada pixel del espacio, int convierte cualquier tipo de dato en un número entero
xx<width && (x.length > 0); xx=xx+1 ) 

// && o "and" comppra dos expresiones y nos devuelve un "true" si ambas son ciertas.
//"xx<width" el pixel ha de ser menor que el ancho total
//"(x.length > 0)" la matriz de partículas o puntos ha contener al menos un elemento.
// "xx=xx+1" cambia la posición de la partícula en el borde. xxxx


//hacemos lo mismo para el eje de las Y
{for( int yy=0; yy<height; yy=yy+1 )
//intxx se refiere a cada pixel del espacio, int convierte cualquier tipo de dato en un número entero
{ int idx = 0;
float dd; dd = dist(x[0],y[0],xx,yy);
//declaramos que existe un float cuyo valor es la distancia de 

for( int i=1; i<x.length; i++ ) 
{ float d0 = dist(x[i],y[i],xx,yy); if( dd > d0 ) 
{dd = d0;
idx = i; 
}
}
set(xx,yy,c[idx]); }
}
noStroke();
  noStroke();
  for( int i=0; i<x.length; i++ ) {
    ellipse(x[i],y[i],3,3);
  }
}
void keyPressed() {
  x = append(x,mouseX);
  y = append(y,mouseY);

//La función "append" añae un elemento a una matriz existente, 
//Pero, ¿Donde hemos declarado una matriz que se llame X?
// Se refiere a la componente X???

  c = append(c,color(random(0,50),random(255),random(200,255)));
 //NO ENTIENDO
  //añadriria la creación de P, con las mismas coordenadas
}
void mousePressed() {
  vx= append (vx,40);
  vy= append (vy,40);
  }


