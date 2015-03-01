
int valorx = 30;
int valory = 30;
int x, y;
void setup (){
  size (800, 600);
  background (255); //perque cuan mogis el ratolí es quedi grabat

}
 
void draw (){
   //recuadre de text per la info
  fill (128, 128, 128);
  noStroke();
  rect (0, 0, 150, 600);

  //text

  fill(0);
  textSize(13);
  text("Para borrar |ESPACIO|", 5, 100);
  text("Para cambiar el fondo:", 5, 150);
  text("Fondo negro |n|", 10, 200);
  text("Fondo rojo |r|", 10, 250);
  text("Fondo verde |v|", 10, 300);
  text("Fondo random |x|", 10, 350);
  text("Dibujo más grande |+|", 5, 400);
  text("Dibujo más pequeño |-|", 5, 450);
  //recuadre de text per la info
  fill (128, 128, 128);
  noStroke();
  rect (0, 0, 150, 600);

  //text

  fill(0);
  textSize(13);
  text("Para borrar |ESPACIO|", 5, 100);
  text("Para cambiar el fondo:", 5, 150);
  text("Fondo negro |n|", 10, 200);
  text("Fondo rojo |r|", 10, 250);
  text("Fondo verde |v|", 10, 300);
  text("Fondo random |x|", 10, 350);
  text("Dibujo más grande |+|", 5, 400);
  text("Dibujo más pequeño |-|", 5, 450);
  
//funciones
    //espacio para borrar
  if (keyPressed){
    if (key == ' '){
      background(255);
    }
  } 
   //fondo
   //negro
     if (keyPressed){
    if (key == 'n'){
      background(0);
    }
  } 
 //rojo
     if (keyPressed){
    if (key == 'r'){
      background(255, 0, 0);
    }
  } 
 //verde
     if (keyPressed){
    if (key == 'v'){
      background(0, 255, 0);
    }
  } 
 //azul
     if (keyPressed){
    if (key == 'a'){
      background(0, 0, 255);
    }
  } 
   //random
     if (keyPressed){
    if (key == 'x'){
      background(random(255), random(255), random(255));
    }
  } 
//no más fondos
//funciones para dibujar
    //amunetar tamaño
     if (keyPressed){
    if (key == '+'){
      valorx = valorx + 1;
      valory = valory + 1;
    }
  } 
    //reducir tamaño
   if (keyPressed){
    if (key == '-'){
      valorx = valorx - 1;
      valory = valory - 1;
    }
  } 



//dibujando
//circulo
  if(mousePressed) {
  noStroke();
  fill (random(255), random(255), random(255));
  ellipse (mouseX, mouseY, valorx, valory);
  }



}




