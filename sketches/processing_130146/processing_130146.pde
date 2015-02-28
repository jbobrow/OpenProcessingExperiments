
Greeny mijnGreeny;
Greeny mijnGreeny2;
Greeny mijnGreeny3;


void setup(){
   size(500,500);
   mijnGreeny = new Greeny (240,35,6);     //Positie 240, 35. Snelheid 6
   mijnGreeny2 = new Greeny (450,60,4);    //Positie 450, 6. Snelheid 4
   mijnGreeny3 = new Greeny (30, 75, 8);   //Positie 30, 75. Snelheid 8
}

void draw(){
  background(255);
  mijnGreeny.update();
  mijnGreeny.testRand();
  mijnGreeny.drawGreeny();
  
  mijnGreeny2.update();
  mijnGreeny2.testRand();
  mijnGreeny2.drawGreeny();
  
  mijnGreeny3.update();
  mijnGreeny3.testRand();
  mijnGreeny3.drawGreeny();
}
  class Greeny {        
    int greenyX;      // x-as
    int greenyY;     //y-as
    int richting;    //snelheid en richting
    int teller;     //teller kleur
    boolean test;    //kleur van Greeny
    
    Greeny (int tempX, int tempY, int tempRichting){
      greenyX = tempX;
      greenyY = tempY;
      richting = tempRichting;
      test = true; 
    }  

  
      void update(){
        greenyY = greenyY + richting;
      }
      
      void testRand(){        
        if(greenyY <0 || greenyY > height){ //voorwaarde heen en weer
          richting = -richting;  //veranderen van richting
          teller = teller + 1;   
        }
      }
        void drawGreeny(){     //tekenen
                   /*head*/
  stroke(0);
  if(test == true){
    fill(119,229,170);
  }
   
  if(test == false){
    fill(131,227,245);
  }
  ellipseMode(CENTER);
  ellipse(greenyX,greenyY,140,150);
  /*eyes*/
  fill(255);
  ellipse(greenyX,greenyY-30,45, 60);
  fill(0);
  ellipse(greenyX,greenyY-20,30,40);
  /*mouth*/
  fill(0);
  ellipse(greenyX,greenyY+40,20,30);
  /*body*/
  if(test == true){
    fill(119,229,170);
  }
  if(test == false){
    fill(131,227,245);
  }
  ellipse(greenyX-25,greenyY+60,50,60);
  if(test == true){
    fill(119,229,170);
  }
  if(test == false){
    fill(131,227,245);
  }
  ellipse(greenyX+25,greenyY+60,50,60);
  
  
  }
  }

