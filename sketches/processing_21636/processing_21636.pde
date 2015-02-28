
void setup(){
  size(200,200);// tamaño de ventana 200x200
  background(255);// fondo blanco
}

void draw(){
  stroke(0); // linea color negro
  line(pmouseX,pmouseY,mouseX,mouseY);
}

void mousePressed(){
  //cada que haya un click del mouse dibuja un rectangulo
  stroke(0); //contorno negro
  fill(0,255,255);//relleno cyan
  rectMode(CENTER);
  rect(mouseX,mouseY,40,7);
}

void keyPressed(){
  //cada que presionemos una tecla dibuja un circulo
  stroke(0); //contorno negro
  fill(255,0,0); //relleno rojo
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,20,20);
}

