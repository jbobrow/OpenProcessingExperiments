
int posX, posY, velX, velY;
float angle;
int value = (240);
int value2 = (87);
int value3 = (190);
float sz=40;



void setup()
{
  size(500,500);
  posX = width/2;
  posY = height/2;
  velX = 3;
  velY = 2;
  noCursor();
  
  
}
void draw()
{
  fill(value2,value3,value);
  rect(0,0,500,400);
  //dibuix del fons que canvia de color quan apretem el ratoli
  
  fill(165,120,5);
  stroke(165,120,5);
  rect(0,4*height/5,width,height);
  //dibuix del terra
  
  
  fill(46,129,14);
  stroke(46,129,14);
  rect(1.25*width/5,1.5*height/5,50,2.5*height/5);
  ellipse(1.5*width/5,1.5*height/5,50,50);
  rect(0.5*width/5,3*height/5,90,50);
  ellipse(0.5*width/5,3.25*height/5,50,50);
  rect(0.25*width/5,3.25*height/5,50,-46);
  ellipse(0.5*width/5,2.75*height/5,50,50);
  rect(1.5*width/5,2.25*height/5,90,50);
  ellipse(2.40*width/5,2.50*height/5,50,50);
  rect(2.15*width/5,2.55*height/5,50,-50);
  ellipse(2.40*width/5,2.05*height/5,50,50);
  //dibuix del cactus 
  
  //actualitzo posicions
  posX=posX+velX;
  posY=posY+velY;
  
  translate(posX,posY); // Canviem les referències per tal que l'origen sigui el mouse.
  //dibuix bola de palla
  stroke(5,5,5);
  fill(5,5,5,0);
  fill(211,202,15);
  stroke(211,234,85);
  ellipse(posX,posY,sz,sz);
  stroke(180,140,7);
  fill(3,3,3,0);
  ellipse(posX,posY,45,45);
  ellipse(posX-5,posY,37,45);
  ellipse(posX,posY-5,39,45);
  ellipse(posX-7,posY,45,32);
  ellipse(posX-6,posY+4,45,45);
  ellipse(posX-5,posY+8,33,24);
  stroke(121,109,12);
  ellipse(posX+2,posY-8,39,25);
  ellipse(posX+4,posY,32,29);
  ellipse(posX+6,posY+9,35,29);
  ellipse(posX-5,posY,45,32);
  ellipse(posX+6,posY-2,45,45);
  ellipse(posX+5,posY+3,33,24);
  
 
  //comprovo la posicio X
  if((posX<+20)||(posX>250)){
    velX=-velX;
  }
  
  //comprovo la posicio Y
  if((posY<0+20)||(posY>250)){
    velY=-velY;
  }
  
  //volem que la bola de palla creixi quan es mogui.
  if((posY<height/2)||(posY>height)&&(velY>0)){
    sz=sz+0.1;
  }
  if(velY<0) {
    sz=sz-0.1;
  }
  if(sz==0.5) {
    sz=0.5;
  }
}
  

  

//volem que el cel passi de clar a fosc quan apretem el ratoli.
void mousePressed() {
  if (value ==240) {
    value = 155;
  } else {
    value = 240;
  }
  if (value2 ==87) {
    value2=14;
  } else {
    value2 = 87;
  }
  if (value3 ==190){
    value3 = 109;
  } else{
    value3=190;
  }
}


