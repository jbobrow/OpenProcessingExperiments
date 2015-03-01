
float mida = 70;
float posX = 300;
float posY = 250;
float velX = random(4);
float velY = random(4);
PImage foto;

 
void setup () {
size(400, 350 );
foto = loadImage ("fons.jpg");

}
 
 
void draw () {
  image(foto,0,0);
  noStroke();

//dibuix medusa
  
   fill(227,115,241);
  ellipse(posX-25, posY, mida/6, mida);
  ellipse(posX-10, posY, mida/6, mida);
  ellipse(posX+10, posY, mida/6, mida);
  ellipse(posX+25, posY, mida/6, mida);
 
  fill(160,77,202);
  arc(posX, posY, mida, mida+30, PI, TWO_PI);
  ellipse(posX, posY, mida, mida/6);
  
  fill(255);
  stroke(0);
  ellipse(posX-10,posY-20,mida/4,mida/3);
  ellipse(posX+10,posY-20,mida/4,mida/3);
  
  fill(68,38,16);
  ellipse(posX-10,posY-20,mida/8,mida/6);
  ellipse(posX+10,posY-20,mida/8,mida/6);


  
 posX = posX + velX;
 posY = posY + velY;
  
 if(posX <0 ||posX > width) {
 velX = - velX;
 } 
    
 if (posY<0 ||posY >height){ 
  velY = - velY;
} 
}
  
 void mousePressed () {
  posX = mouseX;
  posY = mouseY;
  velX = random(-4,4);
  velY = random (-4,4);

  
 }



