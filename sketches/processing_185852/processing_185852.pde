

void setup() {  
  size(600, 600);
}

void draw() {  
    if(mousePressed){ // si el boton del mouse esta presionado
        line(mouseX,mouseY,pmouseX,pmouseY); // dibujo una linea continua
    }
}
