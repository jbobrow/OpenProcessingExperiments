
PImage cleanfloor;  
PImage smallpoo; 
PImage squid; 
PImage bigpoo;
PImage lamb; 
PImage blackpoo; 
PImage pig; 
PImage money; 
PImage vacuum; 

void setup() { 
  size(533, 400); 
  cleanfloor = loadImage ("08.png"); 
  smallpoo = loadImage ("smallpoo.png"); 
  squid = loadImage ("squid.png"); 
  bigpoo = loadImage ("bigpoo.png"); 
  lamb = loadImage ("lamb.png"); 
  blackpoo = loadImage ("blackpoo.png"); 
  pig = loadImage ("pig.png"); 
  money = loadImage ("money.png"); 
  vacuum = loadImage ("vacuum.png"); 
  image(cleanfloor, 0, 0); 
  cursor (vacuum);
}   
void draw() {   
  image(smallpoo, 150, 200); 
  image(squid, 90, 25); 
  image(bigpoo, 275,40); 
  image(lamb, 0, 200); 
  image(blackpoo, 270, 270); 
  image(pig, 200, 320); 
  image(money, 180, 250); 

}

void mouseClicked() {
  
   
   
}

  



