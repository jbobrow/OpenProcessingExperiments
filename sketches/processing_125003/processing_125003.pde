
class Boto{
  float xPos;
  float yPos;
  color c;
  float widthB;
  float heightB;
  int pantallaActual;
  int pantallaDesti;
  
  Boto(){
    xPos = 0;
    yPos = 125;
    c = color(0);
    widthB = 50;
    heightB = 400;
    pantallaActual = 2;
    pantallaDesti = 1;

  }
   Boto(float x, float y, color col, float w, float h, int inici, int fi){
    xPos = x;
    yPos = y;
    c = col;
    widthB = w;
    heightB = h;
    pantallaActual = inici;
    pantallaDesti = fi;
  }
  
  void dibuixa(){
    //noStroke();
    noFill();
    //rect(xPos, yPos, widthB, heightB, 5);
  }
  
  void apreta(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual && pasa == true){
      pasa=false;
      pantalla = pantallaDesti; 

    }
    if((mouseX>160&&mouseX<205&&mouseY>460&&mouseY<500&&pantalla==3&&musica==false&&pasa==true)){
      pasa=false;
      player.play();
      musica=true;
    }
    if((mouseX>160&&mouseX<205&&mouseY>460&&mouseY<500&&pantalla==3&&musica==true&&pasa==true)){
      pasa=false;
      player.pause();
      musica=false;
    }
  }
}

