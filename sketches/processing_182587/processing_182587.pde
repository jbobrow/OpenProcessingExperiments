
float posicioX = 300;
float posicioY = 300;
float mida = 50;
float radi = mida/2;
float velocitatX = 2;
float velocitatY = 3;
float colorR = 255;
float colorG = 255;
float colorB = 255;
float iniciRectangleX = 0;
float iniciRectangleY = 550;
float fons = 0;

void setup(){
  size(600,600);
}
void draw(){
  background(fons);
  
  fill(255);
  rect(iniciRectangleX,iniciRectangleY,width,height);
  textSize(28);
  text("FES RODOLAR LA PILOTA PER TERRA",50,535);

  
  fill(colorR,colorG,colorB);
  posicioX = posicioX + velocitatX;
  posicioY = posicioY + velocitatY;
  ellipse(posicioX,posicioY,mida,mida);
  
  if(posicioX >= width-radi){
    velocitatX = -velocitatX;
  } else if (posicioY >= height-radi){
    velocitatY = -velocitatY;
  } else if (posicioX <= radi){
    velocitatX = -velocitatX;
  } else if (posicioY <= radi){
    velocitatY = -velocitatY;
    }
  if(posicioY >= iniciRectangleY){
    posicioY = iniciRectangleY;
    }
}
void mousePressed(){
  fons = random(255);
      colorR = random(255);
      colorG = random(255);
      colorB = random(255);
      velocitatX = random(-20,20);
      velocitatY = random(-20,20);
      posicioX = pmouseX;
      posicioY = pmouseY;
      mouseReleased();
}

