
// Autor: Toni Cogolludo

void setup (){
  size (200,200);
}
int posicioX = 50;
int posicioY = 90;
int dx = 0;
int dy = 0;
int pintar = #989898;
int rojo = #FF1717;
void draw (){
  background (255);
  fill (pintar);
  rect (posicioX,posicioY,100,20);
  if (mouseX >= posicioX && mouseX <= posicioX+100 && mouseY >= posicioY && mouseY <= posicioY+20){
    pintar = rojo;
    if (mousePressed){
      pintar = 0;
     //posicio de X o Y
     //necessitem aconseguir el desplaçament llavors, ho fem de la següent manera
     //la posicio anterior del mouse - posicio de X = ens permet saber la distancia que hi ha de l'origen de X al mouse
     //li sumem la distancia del mouse perque variara
     //i restem la posicio actual del mouse
     // amb aixo, sabrem la distancia que ha de moure's la posicio inicial del rectangle
     //sumem a la posicio i es moura, segons volguem
      dx = mouseX - ((pmouseX - posicioX)+posicioX);
      dy = mouseY - ((pmouseY - posicioY)+posicioY);
      posicioX = (posicioX + dx);
      posicioY = (posicioY + dy);
    }
  }
  else {
    pintar = #989898;
  }
}
    


