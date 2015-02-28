
PFont font;
int posX,direccion,cantClick,velocidad,posY;
boolean movimientoH;
void setup(){
  size(400,400);
  font = loadFont("Algerian-48.vlw");
  posX = 200;
  posY = 200;
  direccion = 1;
  velocidad = 1;
  movimientoH = true;
}
void draw(){
  background(200);
  if((posX <= 25) || (posX >= width-25)){
    fill(0);
    textFont(font, 32); 
    text("PERDISTE !!!! Solo " + cantClick + " clicks!", 50,50);
    noLoop();
  }else{
    fill(0);
    textFont(font, 32); 
    text("Clicks:" + cantClick, 50,100);
    ellipse(posX,posY,50,50);  
  }
  if(movimientoH){
    posX = posX + direccion;
  }else{
    posY = posY + direccion;
  }
}
void mousePressed(){
  if(mouseX < 50){
    direccion = 1;
    cantClick++;
    velocidad++;
    movimientoH = true;
  }
  if(mouseX > width - 50){
    direccion = -1;
    cantClick++;
    velocidad++;
    movimientoH = true;    
  }
  if(mouseY < 50){
    direccion = 1;
    cantClick++;
    velocidad++;
    movimientoH = false;    
  }
  if(mouseY > height - 50){
    direccion = -1;
    cantClick++;
    velocidad++;
    movimientoH = false;    
  }
  
}









