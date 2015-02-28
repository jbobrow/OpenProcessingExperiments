

//variabelen van de 2 spelers
int vangerX = 180;
int vangerY = 660;
int vangerX2 = 180;
int vangerY2 = 50;

//variabelen voor de beweging van de objecten
int richtingvanger;
int richtingbalX;
int richtingbalY;
int balX;
int balY;

//images
PImage vanger;
PImage vanger2;
PImage Background;

//object ball
ball balletje;

//variabelen voor tellen levens.
int teller; 
int p1lives = 5;
int p2lives = 5;

void setup() {
  size(400,700);
  
  //images inladen
  Background = loadImage("background.jpg");
  vanger = loadImage("vanger.png");
  vanger2 = loadImage("vanger2.png");
  
  //variabelen vullen
  richtingvanger=5;
  
  balX = 197;
  balY = 630;
  richtingbalX=4;
  richtingbalY=4;

  teller = 0;  
  
  //ballletje creeëren
  balletje  = new ball(balX, balY, richtingbalX, richtingbalY);

}

void draw() {
  //images tekenen
  background(Background);
  imageMode(CENTER);
  image(vanger,vangerX,vangerY);
  image(vanger2,vangerX2,vangerY2);

  

  //balletje en methodes aanroepen
   balletje.drawball();
   balletje.updatemovement();
   balletje.drawlives();
   balletje.ballwall();



//vanger beweegt van links naar rechts

      if (keyPressed==true && keyCode == LEFT){
        vangerX = vangerX - richtingvanger;
      }
    
      if (keyPressed==true && keyCode == RIGHT){
        vangerX = vangerX + richtingvanger;
      }

    
      if (vangerX < 30) {
        vangerX = vangerX + richtingvanger;
      }
      
      if (vangerX > 360) {
        vangerX = vangerX - richtingvanger;
      }
      
      if (vangerX2 < 30) {
        vangerX2 = vangerX2 + richtingvanger;
      }
      
      if (vangerX2 > 360) {
        vangerX2 = vangerX2 - richtingvanger;
      }
      
      if(keyPressed==true && key == 'a')
      {
        vangerX2 = vangerX2 - richtingvanger;
      }
      
      if(keyPressed==true && key == 'd')
      {
        vangerX2 = vangerX2 + richtingvanger;
      }
      

    
      
//Balletje reageert met vanger

      if ((balX > (vangerX - 35)) && ((balX < (vangerX + 35))) && (balY > (vangerY - 10)))
      {
        richtingbalY = -richtingbalY;
        teller = teller + 1;
      }
      
      if ((balX > (vangerX2 - 35)) && ((balX < (vangerX2 + 35))) && (balY < (vangerY2 + 10)))
      {
        richtingbalY = -richtingbalY;
        teller = teller + 1;
      }
      


}




