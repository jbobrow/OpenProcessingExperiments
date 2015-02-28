

//definició de les variables
float posX, posY, velX, velY;

void setup(){
  size(600, 500);
  //que comenci al mig
  posX = width/2;
  posY = height/2;
  velX = 5;
  velY = 5;
}



void draw(){
  
  background(5);
  
  fill(255);
  //meitat de la pantalla blanca
  rect(0, height/2, width, height/2);
 
  //redefinició de variables
  posX = posX+0.5*velX;
  
  posY = posY+0.5*velY;
  //la figura
  ellipse(posX, posY, 50, 50);
  

  //condicional de rebot a les parets
  if((posX<25)||(posX>width-25)){
    velX = -velX;}
  //condicional de rebot al sostre i el terra  
  if((posY<25)||(posY>height-25))
    velY = -velY;
  //condicional del canvi de color i de mida en travessar la meitat  
  if(posY>height/2){
    fill(5);
    ellipse(posX, posY, 75, 75);
    //en realitat l'ellipse de dalt se superposa al davant
    
  } 
}

void mousePressed() {
  //si velocitat Y és igual a menys 5 (la bola va cap avall, la velX és 5. En el cas contrari (clic), velX s'accelera 
  if (velY == -5) {
    velX = +5;} 
    else {
    velX = +100;
    }
}





