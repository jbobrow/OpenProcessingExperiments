
//clica per a canviar color, velocitat i direcció
//'a,s,d,w' per controlar el moviment
//'8, 4, 5, 6' per a impulsar el moviment
//'x' per a canviar de color aleatoriament
//mantenir 'z' per canviar de color segons X i Y
//utilitza '+' i '-' per a canviar de tamany




float posicioX = 1000/2 ;
float posicioY = 800/2 ;
float vX = random(10);
float vY = random(10) ;
float mida = 50;

float color1 = random(100);
float color2 = random(100);
float color3 = random(100);



void setup() {
  size (1000, 800);
  background(0);
  cursor(CROSS);
}

void draw () {
  smooth();
  fill(0, 0, 0, 10);
  rect(-20, -20, width + 20, height + 20);


  posicioX = posicioX + vX;
  posicioY = posicioY + vY;

  stroke(random(255), random(255), random (255));
  fill(color1, color2, color3);
  ellipse(posicioX, posicioY, mida, mida);


  if (posicioX >= (width - mida/2) || posicioX <= mida/2) { 
    vX = -vX;
  }
  if (posicioY >= height - mida/2 || posicioY <= mida/2) { 
    vY = -vY;
  }

  // canvia de color i direcció clicant
  if (mousePressed) {

    posicioX= mouseX;
    posicioY = mouseY;
    vX = random(-20, 20);
    vY = random (-20, 20); 
    color1 = random(255);
    color2 = random (255);
    color3 = random(255);
  }




  //guia lleugerament el moviment amb 'a,s,d,w'
  if (keyPressed) {
    if (key == '8' ) {
      posicioY = posicioY - 5;
    }
    if (key == '5') {
      posicioY = posicioY + 5;
    }

    if (key == '4') {
      posicioX = posicioX - 5;
    }
    if (key == '6') {
      posicioX = posicioX + 5;

     
    }

    // fer mes gran el cercle amb '+'
    if (keyPressed) {

      if (key == '+') {
        mida = mida + 3;
     
      }
    }
    
    // fer mes petit el cercle amb '-'
      if (keyPressed) {

      if (key == '-') {
        mida = mida - 3;
     
      }
    }
    //controlar la velocitat
     if (keyPressed) {

      if (key == 'd') {
        vX = vX + 0.1;
     
      }
      if (key == 'a') {
        vX = vX - 0.1;
     
      }
      if (key == 'w') {
        vY = vY - 0.1;
     
      }
       if (key == 's') {
        vY = vY + 0.1;
     
      }
    }
      
      //canvia de color segons la posicio X i Y amb 'z' 
      if (keyPressed) { 
        if (key == 'z' || key == 'Z') { 

          color1 = posicioX/5 ;
          color2 = posicioY/3 ;
          color3 = posicioX/3 ;
        }
      }

      //canvia de color random amb 'x'
      if (keyPressed) { 
        if (key == 'x' || key == 'X') { 

          color1 = random(-200, 255);
          color2 = random(-200, 255);
          color3 = random(-200, 255);
        }
      }

      //cursor "hand" al fer clic. ARA NO FUNCIONA

    
      if ((mouseX == posicioX) && (mouseY == posicioY)) {
        cursor(HAND);
      } else {
        cursor(CROSS);
      }
    }
 
      
  
} 
  
