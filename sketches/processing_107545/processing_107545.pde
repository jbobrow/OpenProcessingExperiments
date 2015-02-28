
float vel=0;
float lento =0 ;
void setup() {
  size(700, 700);
}
void draw() {
  background(255);// borras lo anterir no deja rastro 
  vel= dist(mouseX, mouseY, pmouseX, pmouseY)*2;// mide la velocidad 
  vel= vel+100;
 lento=(lento *0.9)+(vel*0.1); //hace mas lento con respecto a la velocidad del mause
  if (mousePressed) {
   background(10);
  }
noStroke();
  fill(7, 17, 245,130);//azul
  ellipse(250, 250, lento,lento);
  fill(245, 250, 8,130);//amarillo
  ellipse(250, 450, lento, lento);
  fill(242, 17, 5,130);//rojo
  ellipse(450, 250, lento,lento);
  fill(11, 152, 16,130);//verde
  ellipse(450, 450, lento,lento);
}
