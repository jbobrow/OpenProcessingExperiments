
monster mijnmonster;
monster mijnmonster2;
monster mijnmonster3;
 
 
void setup(){
   size(500,500);
   mijnmonster = new monster (240,35,6);     //Positie 240, 35. Snelheid 6
   mijnmonster2 = new monster (450,60,4);    //Positie 450, 6. Snelheid 4
   mijnmonster3 = new monster (30, 75, 8);   //Positie 30, 75. Snelheid 8
}
 
void draw(){
  background(255);
  mijnmonster.update();
  mijnmonster.testRand();
  mijnmonster.drawmonster();
   
  mijnmonster2.update();
  mijnmonster2.testRand();
  mijnmonster2.drawmonster();
   
  mijnmonster3.update();
  mijnmonster3.testRand();
  mijnmonster3.drawmonster();
}
  class monster {       
    int monsterX;      // x-as
    int monsterY;     //y-as
    int richting;    //snelheid en richting
    int teller;     //teller kleur
    boolean test;    //kleur van monster
     
    monster (int tempX, int tempY, int tempRichting){
      monsterX = tempX;
      monsterY = tempY;
      richting = tempRichting;
      test = true;
    } 
 
   
      void update(){
        monsterY = monsterY + richting;
      }
       
      void testRand(){       
        if(monsterY <0 || monsterY > height){ 
          richting = -richting;  
          teller = teller + 1;  
        }
      }
        void drawmonster(){     
    
  
  
    
 

/*head*/
  stroke(0);
  ellipseMode(CENTER);
   fill(218,56,110);
  ellipse(monsterX,monsterY,250,250);
  
  
   
  /*eyes*/
  fill(255,255,255);
ellipse(monsterX-50,monsterY-80,100,100);
ellipse(monsterX+50,monsterY-80,100,100);
fill(0);
ellipse(monsterX-50,monsterY-80,50,50);
ellipse(monsterX+50,monsterY-80,50,50);
fill(255,255,255);
ellipse(monsterX-60,monsterY-60,10,10);
fill(255,255,255);
ellipse(monsterX+40,monsterY-60,10,10);

  
  
  
 
/*pootjes*/
   
fill(225,80,130);
 
ellipse(monsterX-35,monsterY+80,80,80);
fill(225,80,130);
ellipse(monsterX+35,monsterY+80,80,80);
  
  
  }
 
 
  
  }
