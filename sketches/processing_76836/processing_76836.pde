
//Autor: Christian Muñoz

//aprieta el boton del raton de manera continuada y
//verás el ojo al estilo terminator y el fondo
//cambiará también

//al mover el ratón verás como la calavera crece de
//tamaño y disminuye también, el ojo derecho hace lo
//mismo, pero al revés, PRUÉBALO y descubre en que
//punto desaparece el ojo!!

int fondo = 0;//declaración de variable

void setup(){
  size (500,500);
  smooth();
}
void draw(){
  background(fondo);
  noStroke();
  fill(#989898);
  stroke(0);
  arc(250,270+mouseY/6,150,250,0,PI);//mandibula
  fill(255);
  arc(250,260+mouseY/6,150,180,0,PI);//boca
  //poniendo mouseY/6 simulamos que la calavera se rie a carcajadas
  fill(#DBD9D9);
  ellipse(250,170,267+mouseX/15,267+mouseY/15);//cara
  fill(0);
  ellipse(250,265,50,50);//nariz
  ellipse(180,170,100,100);//ojo izquierdo
  ellipse(320,170,mouseY/5,mouseX/5);//ojo derecho
  
}

void mousePressed(){
  fill(#FF0000);
  ellipse(180,170,40,40);//parte interna del ojo izquierdo
  noFill();
  fondo = int(#636290);//mantener el boton del raton apretado
  
}
void mouseReleased(){
  fill(#FF0000);
  ellipse(180,170,40,40);
  noFill();
  fondo = int(#831320);//soltar el boton del raton
   
}

