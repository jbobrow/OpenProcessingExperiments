

float[] psX = {
  1000/2, 300, 400, 500, 550,random(1000),random(1000),random(1000),random(1000),random(1000),random(1000),random(1000),random(1000),random(1000),random(1000)
};
float[] psY = {
  800/2, 500, 300, 700, 200, random(800), random(800),random(800),random(800),random(800),random(800),random(800),random(800),random(800),random(800)
};
float[] vX = { 
  random(10), random(5), random(10), random(10), random(10), random(10), random(10), random(10), random(10), random(10), random(10),random(10),random(10),random(10),random(10),
};
float[] vY = {
  random(10), random(15), random(10), random(20), random(10), random(10), random(10), random(10), random(10), random(10), random(10),random(10),random(10),random(10),random(10),
};
float mida = 50;

float color1 = 255;
float color2 = 0;
float color3 = 0;



void setup() {
  size (1000, 800);
  stroke(random(255), random(255), random (255));
  strokeWeight(6);
   
  cursor(CROSS);
  
}


void draw () {
  background(0);

  
//bucle + matriu per anar fent

  for (int i = 0; i< psX.length; i++) {

    psX[i] = psX[i] + vX[i];
    psY[i] = psY[i] + vY[i];
fill(color1, color2, color3);
    ellipse(psX[i], psY[i], mida, mida);
   


//condicional per rebot

    if (psX[i] >= (width - mida/2) || psX[i] <= mida/2) { 
      vX[i] = -vX[i];
    }
    if (psY[i] >= height - mida/2 || psY[i] <= mida/2) { 
      vY[i] = -vY[i];
    }
    
    if (psX[i] >= (width - mida/2) || psX[i] <= mida/2) { 
      color1 = random(255);
      color2 = random(255);
      color3 = random(255);
    }
   
   
   //condicional per color
   
   if (psY[i] >= height - mida/2 || psY[i] <= mida/2) { 
      color1 = random(255);
      color2 = random(255);
      color3 = random(255);
      
    }

//boles al ratoli al fer clic
    if (mousePressed) {
stroke(random(255), random(255), random (255));
strokeWeight(random(2,14));
      psX[i]= mouseX;
      psY[i] = mouseY;
      vX[i] = random(-20, 20);
      vY[i] = random (-20, 20); 
      color1 = random(255);
      color2 = random (255);
      color3 = random(255);
    } 
    
    
    
    
    
    
    
    //moviments numeros
    
      if (keyPressed) {
    if (key == '8' ) {
       psY[i] =  psY[i] - 5;
    }
    if (key == '5') {
       psY[i] =  psY[i] + 5;
    }

    if (key == '4') {
      psX[i] = psX[i] - 5;
    }
    if (key == '6') {
      psX[i] = psX[i] + 5;
  }
  
  
  
  
  //fer gran i petit
  
  if (keyPressed) {

      if (key == '+') {
        mida = mida + 1;
     
      }
    }
    if (keyPressed) {

      if (key == '-') {
        mida = mida - 1;
     
      }
    }
    

    
    
    //controlar la velocitat
     if (keyPressed) {

      if (key == 'd') {
        vX[i] = vX[i] + 0.3;
     
      }
      if (key == 'a') {
        vX[i] = vX[i] - 0.3;
     
      }
      if (key == 'w') {
        vY[i] = vY[i] - 0.3;
     
      }
       if (key == 's') {
        vY[i] = vY[i] + 0.3;
     
      }
    }
    }
    

    
    
    
    }}

