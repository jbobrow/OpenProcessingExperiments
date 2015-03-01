
float circulox;
float circuloy;
int dim; 
float velocidad = 0.20; //float cuando sea decimal
int r = 300;
int g = 200;
int b = 200;

void setup (){
  size (500,300);
 
  circulox = 100;
  circuloy = 100;
  dim = 60;
  
}//fin setup

void draw (){
  
  fill (r,g,b);
  
  ellipse (circulox, circuloy, dim, dim );
  ellipse (circulox + dim, circuloy, dim, dim);
  
  fill (random (0,255), random (0,255), random (0,255));
  ellipse (random ( width ), random (height), dim, dim);
  

  println(circulox);
  
}//fin draw


