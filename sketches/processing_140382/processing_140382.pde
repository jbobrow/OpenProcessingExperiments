

//PFont f;
//PrintWriter output;
int cont = 0;
zonass zona[] = new zonass[100];
boolean p1 = true, creando = true, conectar = false;
int x,y; // los uso para guardar el primer valor de las zonas conectadas

void setup() {
  // creo la primera bobina
  // defino tamaño
  size(600, 600);
  // defino fondo
  background(0);

  // creo un tipo de letra
  textFont(createFont("Arial",20));
  
  //println("presione A para empezar a conectar"); 
  zona[cont]= new zonass(0,0); 
  
  // creo el escritor
  //output = createWriter("conexiones.txt");
}

void draw() {
  background(0);
  // procedo a dibujar
  for(int i=0; i<=cont; i++){
    zona[i].dzona();
  }
  // agrego el texto
  
  
  if(creando){
    text("presione a pasar a conectar", 100, 580);
    text("creando", 400, 580);
    text("zona #" + cont, 500, 580);
  }
  else{
    text("presione a pasar a crear", 100, 580);
    text("conectando", 400, 580);
    if (conectar){
      text("" + x + " con", 520, 580);
    }
  }
}
void mouseMoved(){
  // si el mouse se mueve y estoy dando el primer punto actualizo x2 y y2
  if(!p1 && creando){
    zona[cont].ajzona(mouseX,mouseY);
    zona[cont].dzona();
  } 
}

void mousePressed(){
  
  if(creando){
    if(p1){
      zona[cont].ajzona(mouseX, mouseY, mouseX, mouseY); 
    }
    else{
      zona[cont].ajzona(mouseX,mouseY);
      cont++;
      zona[cont]= new zonass(mouseX, mouseY);
    }
    p1 = !p1; // niego el arrastre
  }
  // empezamos a unir zonas sensibles
  else{
    //println("conectando");
    // buscamos si el click actual esta sobre alguna zona
    for(int i=0; i<=cont; i++){
      if(zona[i].in_zona(mouseX,mouseY)){
        // si se detecta que esta adentro
        if (!conectar){
          x = i; //si entra la primera vez
          conectar = true;
          println("zona "+ x);
          return; 
        }
        else{
          y = i; //si entra la segunda vez
          println("zona "+ y);
          //output.println("zona " +x+ " con - zona "+y); // genero buffer de salida
          //output.flush();  // escribo los datos
          println("conectadas");
          conectar = false; 
          break;
        } 
        
      } // fin estoy detro de una zona
      
    } // fin for de busqueda de zonas cerca al clic    
  } // fin no creando
  
}


void keyPressed() {
  if (key == 'A'||key == 'a' && !conectar) {
    creando = !creando;
  }
  if (key == 'S'||key == 's') {
    output.flush();  // escribo datos
    output.close();  // finaliza la escritura
  }
}

class zonass{
  //--------------------variables globales-----------------------
  int x1,x2,y1,y2;
  int ancho = 0, alto = 0;
  //---------------------contructores----------------------------    
    zonass(int x1, int y1) {
      this.x1 = x1;
      this.y1 = y1;
      this.x2 = x1;
      this.y2 = y1;
    }
  //--------------------------metodos----------------------------
  void ajzona(int x2,int y2) {
      this.x2 = x2;
      this.y2 = y2;
    }
  
  void ajzona(int x1,int y1,int x2,int y2) {
      this.x1 = x1;
      this.x2 = x2;
      this.y1 = y1;
      this.y2 = y2;
    }
  
  boolean in_zona(int x, int y) {
    if((x1 < x && x < x2 || x1 > x && x > x2) && (y1 < y && y < y2 || y1 > y && y > y2)){
      return true;
    }
    return false;
  }
  
  void dzona(){
    int x,y;
    stroke(100);
    strokeWeight(5);
    fill(255);
    if (x2<x1){x = x2; ancho = x1-x2;}else{x=x1;ancho = x2-x1;}
    if (y2<y1){y = y2; alto = y1-y2;}else{y=y1;alto = y2-y1;}
    rect(x, y, ancho, alto);
  }
}
