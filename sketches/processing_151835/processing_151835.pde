


  Fish[] fishes = new Fish[8]; // dichiaro gli oggetti
  Tv tele;                  
  Bubbles bub;              

  
  void setup() {
    size(600, 400);
    smooth();
  
    for (int i = 0; i < fishes.length; i++) {    // creo gli oggetti e richiamo i parametri
    float x = random(width);
    float y = random(height);
    fishes[i] = new Fish(x, y);
   }
     tele= new Tv(0, 0, 5,0,0);             
     bub = new Bubbles(width/2, height+10,10,0.1); 
   
  }


  void draw() {                    //richiamo i methods delle varie classi 
     background(255);
     for (int i = 0; i < fishes.length; i++) {
     fishes[i].display();
     fishes[i].move();
     tele.display();
     tele.on();
     bub.display();
     bub.move();
  
   }
  }
  


  class Fish { //classe pesci
    
    float x;                 //fields
    float y;
    float speed = 0.5;
   
    Fish(float tempX, float tempY) {    //constructor
    x= tempX;
    y= tempY;
  
  }
    
   void move() {   //mothod  movimento
      
     x-=speed;
     if(x < -40) {
     x = width;
      }
  
     }
  
  void display() {    //method che crea l'immagine 
 
    fill(0);
    ellipse(x, y, 30, 20);
    triangle(x+ 15, y, x+25,y-10,x+25,y+10);
  
    }
  }
  

class Tv {    //classe tv
  
  float x ;                 //fields
  float y ;
  int diameter;
  color c = color(0,0,0);
  color d = color(0,0,0);
  
  Tv(float tvX, float tvY, int tvDiameter, color tvC, color tvD) {   ///constructor
    
    x = tvX; 
    y = tvY;
    diameter = tvDiameter;
    c = tvC;
    d = tvD;
  }
  
  void on() {               //method al click del mosue tv accesa altrimenti spenta 
    if(mousePressed) {
       
    c= color(255,255,255,0);
    d= color(245, 15,15);}else
    { c=color(0);
    d=color(0);
       
    }
   }
  
  void display() {           // method (disegno tv)  
    
    fill(c);
    rect(x, y, 600, 400);
    fill(50,50,50,255);
    noStroke();
    rect(x, y, 50, 400);
    rect(x+ 50, y+ 350, 500, 50);
    rect(x+ 550, y, 50, 400);
    rect( x+50, y, 500, 50); 
    fill(d);
    ellipse( width/2, y+ 375, diameter, diameter);
  }
}
    


class Bubbles{   // classe bolle
  
  float x;           //fields
  float diam;
  float y;
  float speed= 0;
  
  Bubbles(float tempX, float tempY, float tempDiam, float tempSpeed) {    //constructor
    x = tempX;
    y = tempY;
    diam = tempDiam;
    speed = tempSpeed;
  }
  
  void display() {            //methods
     smooth();
     fill(45,5);
     ellipse(x, y, diam, diam);
     ellipse(x+15, y+15, diam-2, diam-2);
     ellipse(x, y+15, diam , diam );
   }
    
   void move() {
     y-=speed;
     if(y < -40){
     y=height;}
      
   }
  }



