

float vel = 0; // declara la variable
void setup(){
  colorMode(HSB);
size(600,600); // tamaño de la ventana
}
 
void draw(){
  noStroke();
fill(0,5);// relleno negro casi transparente
rect(0,0,width,height);// cuadrado que cubre toda la pantalla
fill(random(255),255,255);// relleno blanco
vel = dist(mouseX,mouseY,pmouseX,pmouseY); // calcula la velocidad del cursor y la graba en la variable
println(vel); // escribe la velocidad en la pantalla negra
ellipse(mouseX,mouseY,vel,vel); // elipses que siguen al cursor y con tamaño dependiendo de la velocidad
}
