
int option = 1; // variable entera option igual a 1

void setup() {
  size(400,350);  // tamaño del sketch
  smooth(); // figuras suaves
  //background(0);
  
}

void draw() {
  background (0); // fondo negro
  
  if (option ==1) {
    
    for (int x = 100; x <= width-100; x += 100) { // x igual a 100, x menor o igual a la ancho menos 100, x aumenta 100
      for (int y = 100; y <= height-100; y += 100) {
        
        fill(255); // color figura blanco
        
        arc( x, y, 30,30, QUARTER_PI, PI+HALF_PI); // arco
      }
    }
  }
 
 if (option ==2) {
   
   for (int x = 100; x <= width-100; x += 100) {
      for (int y = 100; y <= height-100; y += 100) { // y igual a 100, y menor o igual al alto menos 100, y aumenta en 100
        
        fill(255,200); // color figura blanco, transparencia 200
        
        //arc( x, y, 30,30, QUARTER_PI, PI+HALF_PI);
        arc (x, y, 30, 30, HALF_PI, 5.50); // arco
        
        
        
      }
   }
 }

if (option == 3) {
  for (int x = 100; x <= width-100; x += 100) {
      for (int y = 100; y <= height-100; y += 100) {
        
        fill (255, 150); // color figura blanco, transparencia 150
          arc ( x, y, 30, 30, 1.88, TWO_PI); // arco
        }
      }
  }

if (option ==4) {
  
  for (int x = 100; x <= width-100; x += 100) {
      for (int y = 100; y <= height-100; y += 100) {
        
        fill (255,100); // color figura blanco, transparncia 100
        arc ( x, y, 30, 30, 2.67, TWO_PI+QUARTER_PI) ; // arco
      }
  }
}

if (option ==5) {
  
  for (int x = 100; x <= width-100; x += 100) {
      for (int y = 100; y <= height-100; y += 100) {
        
        fill (255,50); // color figura blanco, transparencia 50
        arc ( x, y, 30, 30, 3.46, TWO_PI+HALF_PI) ; // arco
      }
  }
}

if (option == 6) {
  
  for (int x = 100; x <= width-100; x += 100) {
      for (int y = 100; y <= height-100; y += 100) {
        
        fill (255, 30); // color figura blanco, transparecia 30
        arc (x, y, 30, 30, 4.40, TWO_PI+2.36) ; // arco
      }
  }
}

if (option == 7) {
  
  for (int x = 100; x <= width-100; x += 100) {
      for (int y = 100; y <= height-100; y += 100) {
        
        fill (255,25); // color figura blanco, transparencia 25
        arc (x, y, 30, 30, 5.50, TWO_PI+2.98) ; // arco
      }
  }
}

if (option == 8) {
 
  for (int x = 100; x <= width-100; x += 100) {
      for (int y = 100; y <= height-100; y += 100) {
        
        fill (255,20); // color figura blanco, transparencia 20
        arc(x, y, 30, 30, 5.97, TWO_PI+3.61) ; // arco
      }
  }
}
}
  

void mousePressed () { // si el maouse es presionado variable option aumenta en 1
  option++;
  
  if (option > 8) option = 1; // si option em mayor a 8 vuelva a 1
}

   
   

