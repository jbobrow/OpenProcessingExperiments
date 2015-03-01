
int strokeW = 10; // Dimensiones de las figuras
boolean eraser = false; // Boleano para comprobar si se está pulsando la tecla que ejecuta la goma.
boolean pause = true; // Booleano para verificar que se está pulsando el ratón
color rgbColor = color(0,0,0); // Fondo por defecto de las sifugras
float randX = 0; // Valor aleatorio para sumar figuras al rededor. Valor X
float randY = 0; // Valor aleatorio para sumar figuras al rededor. Valor Y
int ShapeType = 1;  // Tipo de figura [1 = Ellipse; 2 = Rect, 3 = Line]

void setup(){
  size(930,600); // Establecemos la medida de la ventana.
  background(255); // Establecemos el color de fondo a blanco.
}

void draw(){
  
  
    // Mostramos la barra inferior de ayuda //
    fill(0);
    noStroke();
    rect(0,550,930,50); 
    
    // Confuguramos el color y la medida del texto //
    textSize(12);
    fill(255);
    
    // Rectangles blancs //
    fill(255);
    rect(5,575, 20, 20);
    rect(150,575, 20, 20);
    rect(300,575, 20, 20);
    rect(400,575, 20, 20);
    rect(510,575, 20, 20);
    rect(600,575, 20, 20);
    rect(725,575, 20, 20);
    
    
    // Texto por defecto //
    text("Esborrar sençer", 30,590);
    text("Goma d'esborrar", 175,590);
    text("Cercles", 325,590);
    text("Quadrats", 425,590);
    text("Línies", 535,590);
    text("Augmentar", 627,590);
    text("Disminuir", 750,590);
    
    text("Mida: " + strokeW + " px", 846,590);
    
    // Texto de comandos //
    fill(0);
    text("D", 12,590);
    text("^", 158,590);
    text("1", 307,590);
    text("2", 407,590);
    text("3", 517,590);
    text("+", 606,589);
    text("-", 732,589);
    
    // Volvemos a poner el texto en blanco para el resto de mensajes //
    fill(255);
    
    
    if(eraser){
    // Texto que saldrá cuando pulsemos CONTROL (Goma de borrar)
    text("Passa el cursor per sobre la zona on vols esborrar sense deixar anar la tecla CONTROL. Pots canviar la mida amb les tecles +/-",4,566);
    }else if(ShapeType == 1){
    // Texto que saldrá cuando pulsemos 1 (Figura de circulos)
    text("[1] A l'hora de dibuixar amb aquesta figura apareixeran noves figures a la vora. Pots canviar la mida amb les tecles +/-",5,566); 
    }else if(ShapeType == 2){
    // Texto que saldrá cuando pulsemos la telca 2 (Cuadros)
    text("[2] A l'hora de dibuixar amb aquesta figura apareixeran noves figures a la vora. Pots canviar la mida amb les tecles +/-",5,566); 
    }else if(ShapeType == 3){
    // Texto que saldrá cuando pulsemos la tecla 3 (Línea)
    text("[3] Amb aquest tipus de forma podràs dibuixar seguidament sense que apareguin noves figures a la bora. Pots canviar la mida amb les tecles +/-",5,566); 
    } 
    
    
     // Actualizamos las variables llenándolas de carácteres aleatorios //
     rgbColor = color(random(255),random(255),random(255)); // Fondo
     randX = random(strokeW + 7); // Posicion X
     randY = random(strokeW + 7); // Posición Y
   
    if(!pause){
      
          if(eraser){
        
          // Si eraser == true (Tecla control) Mostramos un cuadro en blanco para borrar.
          noStroke();
          fill(255);
          rect(mouseX,mouseY,strokeW + 20,strokeW + 20);
      
          }else if(ShapeType == 1){
           
           // Si la figura es de tipo [1] (Circulos) Mostramos circulos
           noStroke();
           fill(rgbColor); 
           ellipse(mouseX,mouseY,strokeW,strokeW);
           ellipse(mouseX+randX,mouseY+randY,strokeW,strokeW);
           
           }else if(ShapeType == 2){
           
           // Si la figura es de tipo [2] (Cuadros) Mostramos cuadros
           noStroke();
           fill(rgbColor);
           rect(mouseX,mouseY,strokeW,strokeW);
           rect(mouseX+randX,mouseY+randY,strokeW,strokeW);
            
           }else if(ShapeType == 3){
            
            // Si la figura es de tipo [3] (Línea) Mostramos la línea
            stroke(rgbColor);
            strokeWeight(strokeW);
            line(mouseX,mouseY,pmouseX,pmouseY);
            
           }
           
    }
        

       
}

void mousePressed(){
  // Si pulsamos el ratón ponemos Pause como falso para pintar
  pause = false;
}

void mouseReleased(){
  // Si soltamos el ratón ponemos Pause como verdadero para NO pintar
  pause = true;
}

void keyPressed() {

  if(key == 'd' || key == 'D'){
    // Si pulsamos "D" refrescamos el fondo entero para limpiar la ventana
    background(255);
  }
  
  if(key == '1'){
    // Si pulsamos "1" ponemos la variable "Tipo de forma" a 1
    ShapeType = 1;
  }
  
  if(key == '2'){
    // Si pulsamos "2" ponemos la variable "Tipo de forma" a 2
    ShapeType = 2;
  }
 
    if(key == '3'){
    // Si pulsamos "3" ponemos la variable "Tipo de forma" a 3
    ShapeType = 3;
  }
  
  if (key == '+' && strokeW < 300) {
    // Si pulsamos la tecla "+" aumentamos el tamaño de la forma
    strokeW ++;
  
  }
  
  if(key == '-' && strokeW > 1){
    // Si pulsamos la tecla "-" disminuimos el tamaño de la forma
    strokeW --;
  }   
  
  if(keyCode == CONTROL){
    // Si pulsamos la tecla CONTROL, ponemos la variable en TRUE para hacer aparecer la goma.
   eraser = true;
  }
 
}

void keyReleased(){
    // Si soltamos la tecla ponemos la variable en Falso para quitar la goma.
    eraser = false;
}
