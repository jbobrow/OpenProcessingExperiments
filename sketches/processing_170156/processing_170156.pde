
float circulox;
float circuloy;
int dim;
float velocidad = 0.7;
void setup (){
size (500, 300);
background (255);
circulox = 0;
circuloy = 100;
dim = 130;

}

void draw (){
  background (0);
ellipse (circulox, circuloy, dim+7, dim+7);
ellipse (circulox*2-100, circuloy*2-150, dim/2+20, dim/2+20);
circulox = circulox + velocidad;

ellipse (-circulox+500, circuloy, dim-5, dim-5);
ellipse (-circulox*2+400,  circuloy*2-150, dim/2, dim/2);
circulox = circulox + velocidad;
dim = dim-1;
println(circulox);
}



