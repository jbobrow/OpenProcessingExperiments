
void setup() //Aqui se declaran las funciones principales que ocupa todo el programa
{
  size(720, 640); //tamaño de la ventana
  noStroke(); //comando que indica que las lineas de la figura no se veran
  
}

void draw() //aquis se declaran todas las opcciones qude se dibujaran en el programa
{   
   if (mousePressed) {  //if es la condicional que indica que si el mouse es apretado el fondo de la ventana cambiara de color
    background(100, 200, 50);  //este comando indica de que color es el fondo del programa
  } 
  else {       //else es la condicional que dice que si no se aprieta el boton del mouse no cambiara el color del fondo 
    background(51);
  }
  
   
  fill(mouseX, mouseY,mouseX/2);  //esta indica que color de relleno tendran las figuras, y mouseX y mouseY indican los valores de posicion del mouse
  ellipse(mouseX, height/2, mouseY/2+10, mouseY/2+10); //aqui se declara que se dibujara un circulo
  
  fill(mouseX, mouseY,mouseY/2); //esta indica el color del relleno de la figura que se aplicara alas que se dibujen despues
  int inverseX = width-mouseX;   //con int declaramos nuna variable ala cual se le asignara un valor y podremos llamarla del modo que nos agrade
  int inverseY = height-mouseY;
  ellipse(inverseX, height/2, (inverseY/2)+10, (inverseY/2)+10);
}



