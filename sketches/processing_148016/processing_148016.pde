
color colorback;//color fondo pantalla
int posX,posY,velX,velY;//variables posición y velocidad

void setup(){
  
  size(600,600);
  background(0);
  posX=width/2;//posición inicial
  posY=height/2;
  velX=3;
  velY=3;
  colorback=color(35,random(80),129);//color de inicio
}

void draw(){
  background(colorback);
  
  posX=posX+velX;//actualización posiciones
  posY=posY+velY;
  
  dibujarMuneca(posX,posY);
 
  if((posX<80)||(posX>width-80)){
    velX=-velX;
  }//condicion para que robote en los límites X
  
  if((posY<110)||(posY>height-60)){
    velY=-velY;
  }//condición para que rebote en límites Y
}

void mousePressed(){
  colorback=color(mouseX, mouseY,159);
}//cambia el color al clikcar el ratón

void dibujarMuneca(int x, int y){
  //cara
  strokeWeight(4);
  stroke(0,0,0);
  fill(0,0,0);
  ellipse(x,y-80,80,60);//coleta
  ellipse(x,y-10,160,120);//panuelo
  fill(252,230,201);
  ellipse(x,y,150,120);//fondo cara
  
  //OJOS
  //Capa rosa
  strokeWeight(1);
  fill(colorback);
  ellipse(x-45,y-6,55,55);
  ellipse(x+45,y-6,55,55);
  
  //capa negra
  fill(0,0,0);
  ellipse(x-39,y-8,40,40);
  ellipse(x+39,y-8,40,40);
  
   
//capa blanca
  fill(255,255,255);
  ellipse(x-30,y-13,20,16);
  ellipse(x+30,y-13,20,16);
  
  
//boca
  strokeWeight(2);
  noFill();
  ellipse(x,y+30,28,34);
  noStroke();
  fill(252,230,201);
  rect(x-20,y+10,40,20);
}
