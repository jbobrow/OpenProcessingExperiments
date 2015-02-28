
void setup(){
  size(700, 700);
  loop();
}

void draw(){
  background(0);
  for(int i =0; i < 30; i++){
    for(int j =0; j < 30; j++){
      //espacio 20 igual que el tamano maximo
      float x = 20*i + 50; 
      float y = 20*j + 50;
      float rand = random(0,10);
      //random una variable para que sean cuadrados
      //pero de diferentes tamanos
      rect(x, y, 10 + rand, 10 + rand);
      //rectangulos de longitud maxima 20 igual que el
      //espaciamiento 20 para que no se sobrelapen
    }
  }

}

