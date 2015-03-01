
void setup() {   //Aqui se declaran las funciones principales que ocupa todo el programa
  size(640, 360);  //tamaño de la ventana
  noStroke(); //comando que indica que las lineas de la figura no se veran
  background(102);  //este comando indica de que color es el fondo del programa
}

void draw() {   //aqui se declaran todas las opcciones que se dibujaran en el programa
  if (mousePressed) { //if es la condicional que indica que si el mouse es apretado cambiara el color del relleno de las figuras
    noStroke();
    fill(mouseX, mouseY,mouseX/2);
  } else { //else es la condicional que dice que si no se aprieta el boton del mouse no cambiara el color de rellano de las figuras
    noStroke();
    fill(mouseX, mouseY,mouseY/2);
  }
  ellipse(mouseX, mouseY, mouseY/2+10, mouseY/2+10);   //aqui se declara que se dibujara un circulo
  
}



