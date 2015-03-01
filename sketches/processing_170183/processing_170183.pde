
float circulox;
float circuloy;
int dim;
float velocidad = 0.7;
float r=0;
float g=0;
float b=-75;
void setup (){
size (1280, 300);
background (255);
circulox = 0;
circuloy = 100;
dim = 130;

}

void draw (){
  background (0);
ellipse (circulox, circuloy, dim, dim);
ellipse (circulox*2-100, circuloy*2-150, dim/2, dim/2);
circulox = circulox + velocidad;
//segundas 2 ellipses


fill (r+circuloy,g,b+circulox);
ellipse (-circulox+1200, circuloy, dim, dim);
ellipse (-circulox*2+1400,  circuloy*2-150, dim/2, dim/2);
circulox = circulox + velocidad;
dim = dim-1;
ellipse (random (1280), random (300), dim, dim);
println(circulox);

ellipse (circulox-1000, circuloy, dim, dim);
ellipse (circulox*2-1100, circuloy*2-150, dim/2, dim/2);
circulox = circulox + velocidad;

ellipse (-circulox+2200, circuloy, dim, dim);
ellipse (-circulox*2+2400,  circuloy*2-150, dim/2, dim/2);

ellipse (circulox-2000, circuloy+50, dim/3, dim/3);
ellipse (circulox*2-2100, circuloy*2-50, dim/4, dim/4);
circulox = circulox + velocidad;

ellipse (-circulox+3200, circuloy+50, dim/3, dim/3);
ellipse (-circulox*2+3400,  circuloy*2-150, dim/4, dim/4);
}

