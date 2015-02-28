
float vel = 9; // declara la variable
void setup(){
size(400,400); // tamaño de la ventana
background(7,118,105);
}
 
void draw(){
fill(105,9);
rect(0,0,width,height);
fill(random(19),random(140),random(98));
vel = dist(mouseX,mouseY,pmouseX,pmouseY); // calcula la velocidad del cursor y la graba en la variable
println(vel); // escribe la velocidad en la pantalla negra
ellipse(mouseX,mouseY,vel,vel); // elipses que siguen al cursor y con tamaño dependiendo de la velocidad
}

  
  
