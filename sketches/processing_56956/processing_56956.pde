
int option = 1; // variable x igual a 1

void setup() {
  
  size (400,350); // tamaño del sketch 
  smooth(); // dibujar figuras "suaves" (bordes)
  
}

void draw () {
  
  background (255); // fondo blanco
  
  if (option == 1) { // si el valor de option es igual a 1
    
    for (int x = 50; x<= width-50; x +=19) { // variable valor x igual a 50, x menor o igual a al ancho menos 50, x aumenta en 19
      for (int y =50; y<= height-50; y+= 19) {
        fill (0); // color circulo negro
        ellipse (x, y, 5,5); //circulo 
      }
    }
  }

else if (option ==2) {
  
   for (int x = 50; x <= width-50; x += 20) {

      for (int y = 50; y <= height-50; y+=20) { // variable valor y igual a 50, y menor o igual al alto menos 50, x aumenta en 20
        
        line(x, y, width/2, height/2); //linea
         ellipse (x, y, 5,5); // circulo
        
      }
   }
}


else if (option ==3) {
    
    for (int x = 50; x <= width-50; x += 20) {
      for (int y = 50; y <= height-50; y+=20) {
    
        line(x,y, width-48, height-57); // linea
        ellipse (x, y, 5,5); //circulo 
       //stroke (255, 200);
        
         
      }
    }
  
  }
  
  else if (option ==4) {
  
  for (int x = 50; x <= width-50; x += 20) {
      for (int y = 50; y <= height-50; y+=20) {
    
        stroke (0,100); // color de la linea negro, transparencia 100
        line(x,y, width-48, height-58); // linea
        line (x,y, 48,48); //linea 
        ellipse (x, y, 5,5); // circulo
        
      }
  }
}


else if (option ==5) {
  for (int x = 50; x <= width-50; x += 20) {
      for (int y = 50; y <= height-50; y+=20) {
    
        stroke (0,150); // color de la linea negro, transparencia 150
        ellipse (x, y, 5,5); //circulo
        line(x,y, width-48, height-58); // linea
        line (x,y, 48,48); //linea
        line (x,y, 48,294); // linea
         
      }
  }
}

else if (option ==6) {
  for (int x = 50; x <= width-50; x += 20) {
      for (int y = 50; y <= height-50; y+=20) {
    
        stroke (0,150); // color linea negro, trasparencia 150
        ellipse (x, y, 5,5); //circulo
        line (x,y, width-48, height-58); //linea
        line (x,y, 48,48); // linea
        line (x,y, 48,294); // linea
        line (x, y, 350, 48); // linea
        
      }
  }
} 
}

  
  void mousePressed () { // si es maouse es presionado el valor de option aumenta en 1
    option++;
    
    if (option > 6) option =1; // si el valor de option es mayor que 6 vuelve a 1
  }
  

