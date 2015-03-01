
float circulox;
float circuloy; //son variables que sirven para usar valores fijos durante todo el sketch. 
float dim;
float dim2 = random (100);
float vel = 0.1; //se pueden declarar y nominar aquí arriba. Es más fácil. Normalmente todas son float porque son más precisas. 
float r; 
float g;
float b;


void setup () {
  size (500, 200) ;
  smooth () ;
  background (255) ;
  circulox = 30;
  circuloy = 100;
  dim = random (4, 50);
  frameRate (25);
}

void draw () {
 noStroke (); // para poder usar un cuadrado y poder usar el alfa, hay que hacerlo más grande para que no se vea el stroke.
 float dim2 = random (100);
  //background (255) ;
  fill(255,10);
  rect(0,0, width, height); //Para que los circulos desaparezcan poco a poco hay que hacer un cuadrado nuevo para poder ejecutar alfa.
  r =14 ;
  g = random (15, 200);
  b = random (40, 300);
  dim = random (4, 50);
  fill(r, g, b); // con random se pueden poner aleatorias los parametros.

  //ellipse (random(height,width), random (height) ,50);
  //ellipse (random( width), random (height), dim2, dim2); 
  ellipse (mouseX, mouseY, dim2, dim2); 

  circulox = circulox + vel;
}

void mousePressed () {
 ;
}



