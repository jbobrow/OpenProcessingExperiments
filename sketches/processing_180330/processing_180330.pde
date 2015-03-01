
  
  // "  Who the fuck did forget the slinky in the washer?" ...Mommy said.
  
  void setup() {
  size(600, 600);
  background(0);
   smooth();
  
}      


  // metodo!
  
  // stabilisco il numero di fotogrammi che verranno visualizzati da quando il programma viene avviato
  void draw(){
 if (frameCount % 1 == 0) {
   
   // stabilisco il ciclo cromatico 
   fill(frameCount * 1 % 255, frameCount * 5 % 255,
      frameCount * 25 % 255);
    
    // attivo la trasformazione cumulativa
    pushMatrix();
  
   // specifico lo spostamento all'interno della finestra di visualizzazione
    translate(300, 300);
    
    //  calcolo la rotazione sui radianti attraverso il loro modulo
     rotate(radians(frameCount * 3  % 360));
    
    //costruisco Centrifuga
    ellipse(0, 0,280, 35);
    ellipse(100, 100, 35, 5);
    ellipse(200, 200, 35, 15);
    ellipse(150, 150, 35, 20);
    
    //costruisco le reti metalliche della centrifuga
    line(0, 0, 280, 400);
    line(0, 0, -280, -400);
    line(0, 0, 140, 140);
    
    // costruisco Slinky
    ellipse(80, 80, 25, 15);
    ellipse(60, 60, 12, 8);
    ellipse(50, 50, 10, 6);
    ellipse(48, 48, 8, 4);
    ellipse(45, 45, 7, 3);
    ellipse(70, 35, 5, 2);
    
    // creo una ellisse che ruota seguendo il movimento della centrifuga 
    // imposto le dimensioni dell'ellisse (larghezza e altezza) in funzione della posizione del cursore nella finestra
    ellipse(mouseX, mouseY, mouseX, mouseY);
    smooth();
    
    // Chiudo la trasformazione cumulativa e ripristino il sistema delle coordinate
    popMatrix();
   }
 
}



