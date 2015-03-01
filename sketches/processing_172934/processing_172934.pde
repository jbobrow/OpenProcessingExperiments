
float posX, posY, velX, velY;
PImage caja;
PImage queso;
PImage raton;
int col;

int rebotes=1;

void setup() {
  size (500,500);
  posX=width/2;
  posY=height/2;
  velY= random (5,10);
  velX= random (5,10);
  int rebotes=0;
  caja=loadImage("caja.jpg");
  queso=loadImage("queso.png");
  raton=loadImage("raton.png");
}

void draw () {
actualizaPosiciones();
cuentaRebotes();
dibujaBola();
salida();

}
void mousePressed (){

 posX = mouseX;
 posY = mouseY;
  velY= random (5,10);
  velX= random (5,10);
} 
 
void actualizaPosiciones(){
  
  posX=posX+velX;
  posY=posY+velY;
  
}

void cuentaRebotes () {
  
  if (posX+62+rebotes>width){
    velX=-velX;
    posX=width-62-rebotes;
    rebotes ++;
}
if (posX-62<0){
    velX=-velX;
    posX=62;
    rebotes ++;
}
if (posY+62+rebotes>height){
  velY=-velY;
  posY=height-62-rebotes;
  rebotes ++;
}
if (posY-62<0){
  velY=-velY;
  posY=62;
  rebotes ++;
}


}

void dibujaBola () {
 image (caja,0,0,width,height);
  //rect interior en el que deben rebotar luego (62,62,375,375);
  noStroke();
 image (queso,posX,posY,rebotes,rebotes);
  text (rebotes,15,height-15);
  text("CLICK TO AVOID RAT",50,height-15);

}
 
void salida () {
  image(raton,380,350);

  if (posX>360 && posY>360){
 posY=random(200,400);
 rebotes=1;}


}




