
float vel = 0; // declara la variable
void setup(){
size(400,400); // tamaño de la ventana
}

void draw(){
fill(0,5);// relleno negro casi transparente
rect(0,0,width,height);// cuadrado que cubre toda la pantalla
fill(255);// relleno blanco
vel = dist(mouseX,mouseY,pmouseX,pmouseY); // calcula la velocidad del cursor y la graba en la variable
println(vel); // escribe la velocidad en la pantalla negra
ellipse(mouseX,mouseY,vel,vel); // elipses que siguen al cursor y con tamaño dependiendo de la velocidad
}
