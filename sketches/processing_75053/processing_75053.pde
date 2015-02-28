



void setup(){
  size(400,400);
  smooth();
}

void draw(){
  if(mousePressed){ // si está oprimida llena de circulos negros, funciona como variable
    fill(0);
  }
  else{// sino está oprimida llena de circulos blancos
    fill(255);
  }
  ellipse(mouseX,mouseY,80,80);
}

//para guardar la imagen en formato
void mousePressed(){
  save("circulos_raros.png");}

