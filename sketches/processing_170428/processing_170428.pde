
float circulox; //esto son variables se ponen arriba del sketch para que funciones en todo el sketch
float circuloy;
int dim;
float velocidad = 0.9;
int r =187;
int g =94;
int b =200;


void setup(){
size (500,500);
background(0);
circulox = 10; //coordenadas de la variable
circuloy = 150;
dim = 100;
velocidad = 0.7;
frameRate (30); //velocidad de reproduccion
 
} //fin setup

void draw() {
  
//background (random(255)); //para que se vaya desvaneciendo (truco con superposicion de background)
fill(0, 10);
rect(0,0 , width, height);

//ellipse (circulox, circuloy , dim, dim );
//ellipse (circulox, circuloy , dim, dim );

float dim2 = random (100);
fill (random(0,255) , random(0,255) , random(0,255) , random(100,200));
//ellipse (random(width) , random (height) , dim, dim); //circulo normal
//ellipse (random(width) , random (height) , dim2 , dim2 ); //circulos en diferentes tamaños
ellipse (mouseX , mouseY , dim2 , dim2 ); //circuloa controlados por el  raton

circulox = circulox + velocidad;
println(circulox); //para que aparezca abajo en elm print

} //fin draw

void mousePressed () {
  background (0);
  
}


