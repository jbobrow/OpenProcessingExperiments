
float mida = 40;
float posicioX = 300;
float posicioY = 200;
float velocitatX = 7;
float velocitatY = 7;
float amplada = 20;
float alcada = 65;
float fillB = 255;

void raqueta1 () {
  fill (108,24,24);
  stroke (108,24,24);
  rect (575, mouseY - alcada, amplada, alcada);
}

void raqueta2 () {
  fill (108,24,24);
  stroke (108,24,24);
  rect (5, mouseY - alcada, amplada, alcada);
}


void setup () {
  size (600, 400);
  frameRate (20);
}

void draw () {
  background (232, 240, 238);
  stroke (90, 24, fillB);
  fill (90, 24, fillB);

  //pilota
  ellipse (posicioX, posicioY, mida, mida);
  posicioY = posicioY + velocitatY;
  posicioX = posicioX + velocitatX;


  //rebotar per dalt

  if (posicioY + mida/2 >= height|| posicioY - mida/2 <= 0) {
    velocitatY= -velocitatY;
  }

  raqueta1 ();

  raqueta2 ();


if (posicioX + mida/2 >= 575){
  if (posicioY + mida/2 < mouseY + alcada && posicioY + mida/2 > mouseY - alcada){
    velocitatX = -velocitatX;
    velocitatY = -velocitatY;
  }
  else{
    //GOL
  }
  
}

if (posicioX - mida/2 <= 25){
  if (posicioY - mida/2 < mouseY + alcada && posicioY - mida/2 > mouseY - alcada ){
    velocitatX = -velocitatX;
    velocitatY = -velocitatY;
  }
  else {
    //GOL
  }
}

   
}
 void mousePressed () {
  fillB = random (255);
  posicioX = pmouseX;
  posicioY = pmouseY;
  
 }

    


 
   
 
  
 
  
  

    
  
  

