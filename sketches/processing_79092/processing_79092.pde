
void setup (){
  size (200,200);
}
int posicioX = 50;
int posicioY = 90;
int pintar = #989898;
int rojo = #FF1717;
void draw (){
  background (255);
  fill (pintar);
  rect (posicioX,posicioY,100,20);
  println (mouseX);
  println (mouseY);
  if (mouseX >= posicioX && mouseX <= posicioX+100 && mouseY >= posicioY && mouseY <= posicioY+20){
    pintar = rojo;
    if (mousePressed){
      pintar = 0;
      posicioX = mouseX; //-posicioX + 100;
      posicioY = mouseY; //-posicioY + 20;
    }
  }
  else {
    pintar = #989898;
  }
}
    


