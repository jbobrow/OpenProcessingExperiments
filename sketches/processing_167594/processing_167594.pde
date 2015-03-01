
int tam;
boolean q;
float posX,posY;
float velX,velY;
float R,G,B;
float radio;

void setup() {
 /*Definim el tamany de finestra, 
   diàmetre, posició inicial i velocitat inicial */
 size(300,300);
 tam = 20;
 radio = tam/2;
 posX = width/2;
 posY = height/2;
 velX = random(1,3);
 velY = random(1,3);
}

void draw() {
  //Apliquem el fons per a que no es fegi cada ellipse nova i li donem color a l'elipse.
  background(0);
  fill(B,G,R);
  // Fem que la posició vagi variant i així l'elipse es mogui en els dos eixos.
  posX += velX;
  posY += velY;

  // Dibuixem l'elipse gran i petita
  if ( q == false ) {
  noStroke();
    ellipse(posX,posY,tam,tam);
    fill(R,G,B);
    ellipse(posX,posY,tam/3,tam/3);
  } else {
    rectMode(CENTER);
    rect(posX,posY,tam,tam);
  }
  
  // Dibuixem el rectangle que limitarà el moviment de l'elipse.
  fill(0,0,0,80);
  stroke(255);
  rectMode(CORNER);
  rect(width/4,height/4, width/2, height/2);

  // Si el moviment de l'elipse va a sortir del rectangle que canvi de direcció.
  if ( (posX-radio) < width/4 || (posX+radio) > (width*0.75)){
      velX = -velX;
  } else if ( (posY-radio) < height/4 || (posY+radio) > (height*0.75)) {
      velY = - velY;
  }

}

void mousePressed(){
  
  // Condicionals
  /* Si cliques fora el rectangle no passarà res, 
  si no l'elipse es mourà al punt que li indiquis dins del rectangle.*/
  
  if (   mouseX - radio > (width/4) 
      && mouseX + radio < (width - width/4 ) 
      && mouseY - radio > (height/4) 
      && mouseY + radio < (height - height/4) 
      ) 
  {
        q = false;
  // Actualitzem la posició.
        posX = mouseX;
        posY = mouseY;
  //Variem el color segons un random i la posició del mouse.
        R = mouseX;
        G = mouseY;
        B = random(1,255);
  } else { 
   
      fill(R,G,B);
      posX += velX;
      posY += velY;
      rect(posX,posY,tam,tam);
      q=true;
      
      
    
  }

 
}
  



