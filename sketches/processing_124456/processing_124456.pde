
class Boto {
  float xPos;
  float yPos;
  color c;
  float widthB;
  float heightB;
  int pantallaActual;
  int pantallaDesti; 
  
  
  
  Boto(){
    xPos = width/2;
    yPos = height/2;
    c = color(255,0,0);
    widthB = 50;
    heightB = 25;
    pantallaActual = 1;
    pantallaDesti = 2;

  }
  Boto(float x, float y, color col, float w, float h, int inici, int fi ){
    xPos = x;
    yPos = y;
    c = col;
    widthB = w;
    heightB = h;
    pantallaActual = inici;
    pantallaDesti = fi;
    
  }
  
  void dibuixa(){
    noFill();
    noStroke();
    rect(xPos, yPos, widthB, heightB);
    
  }
  
  void apreta(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual&&semafor==true){
      semafor=false;
      pantalla = pantallaDesti;
    }
  }

}

