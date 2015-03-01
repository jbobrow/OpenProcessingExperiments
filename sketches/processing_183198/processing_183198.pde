



float mida;
float posicioX;
float posicioY;
float velocitatX;
float velocitatY;
PImage fons;
PFont disco;


void setup(){
  size(600,350);
  mida = 100;
  velocitatX = 2;
  velocitatY = 2;
  posicioX = width/2;
  posicioY = height/2;
  ellipseMode(CORNER);
  fons = loadImage ("disco.png");
  noFill();
  disco = loadFont("PortagoITCTT-48.vlw");
  textFont(disco, 60);
  


}

void draw (){
  //background(0);
  image(fons,0,0,width,height);
  
//moviment elipse  
  posicioX = posicioX + velocitatX;
  posicioY = posicioY + velocitatY;
  
  if(posicioX < 0||posicioX > width-mida/2){
     velocitatX = -velocitatX;
  
  }

  if(posicioY < 0 || posicioY > height-mida/2){
     velocitatY = -velocitatY;
     
  
  }

//elipse
  ellipse(posicioX,posicioY,mida/2,mida/2);
  

//canvis de color i velocitat + text  
  if(posicioX < 0){
    velocitatX = -velocitatX+30;
    rect(0,0,width,height);
    fill(0);
    textSize(80);
    textMode(CENTER);
    text("Flying freeeee!", width/4, height/2);
    fill(255,0,0);
    
  } if (posicioX > width-mida/2){
    velocitatX = -velocitatX-30;
    rect(0,0,width,height);
    fill(0);
    textSize(80);
    textMode(CENTER);
    text("DISCO!", width/4, height/2);
    fill( #FEFF31);
    
  } if(posicioY <= 0){
    velocitatY = -velocitatY+6;
    rect(0,0,width,height);
    fill(0);
    textSize(80);
    textMode(CENTER);
    text("Flying freeeeee!", width/4, height/2);
    fill(8,244,7);
    
  } else if (posicioY > height-mida/2){
    velocitatY = -velocitatY-3;
    rect(0,0,width,height);
    textSize(80);
    fill(0);
    textMode(CENTER);
    text("DISCO!", width/4, height/2);
    fill(0,49,200);

}
}  
 
  //D'on surt l'elipse i direcció+velocitat

void mousePressed(){
  posicioX = mouseX;
  posicioY = mouseY;
  velocitatX = random(-2,2);
  velocitatY = random(-2,2);
  
}





