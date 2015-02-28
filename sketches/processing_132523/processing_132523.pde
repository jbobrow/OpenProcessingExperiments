
int balkX;
int balkY;
int breedteBalk;
int hoogteBalk;
int richtingBalk;
int score;
int gameover;

Kogel mijnKogel;
Kogel mijnKogel2;

// Begin void setup
void setup(){
 size(500,500); 
 balkX = 250;
 balkY = 480;
 breedteBalk = 100;
 hoogteBalk = 10;
 richtingBalk = 5;
 score = 0;
 
 mijnKogel = new Kogel(10,20,1);
 mijnKogel2 = new Kogel(3,70,1);

}
// Einde void setup


// Begin void draw
void draw(){
  background(0,0,0);
  mijnKogel.vallen();
  mijnKogel.teken();
  mijnKogel.detectie();
  
  
  mijnKogel2.vallen();
  mijnKogel2.teken2();
  mijnKogel2.detectie2();



  text(score, 50,50);
  println(score);

// Als score 10 of hoger is, zullen de kogels sneller vallen  
  if(score >= 10){mijnKogel.richtingKogel = 2;}
  if(score >= 10){mijnKogel2.richtingKogel = 2;}

// Als score 20 of hoger is, zullen de kogels sneller vallen  
  if(score >= 20){mijnKogel.richtingKogel = 3;}
  if(score >= 20){mijnKogel2.richtingKogel = 3;}

// Als score 30 of hoger is, zullen de kogels sneller vallen
  if(score >= 30){mijnKogel.richtingKogel = 4;}
  if(score >= 30){mijnKogel2.richtingKogel = 4;}

// Als score 40 of hoger is, zullen de kogels sneller vallen  
  if(score >= 40){mijnKogel.richtingKogel = 4;}
  if(score >= 40){mijnKogel2.richtingKogel = 4;}
  
// Als score 50 of hoger is, zullen de kogels sneller vallen  
  if(score >= 50){mijnKogel.richtingKogel = 5;}
  if(score >= 50){mijnKogel2.richtingKogel = 5;}
  
// Als score -5 is, zal 'GAME OVER' verschijnen
  
  if(score <= -1){background(0);textSize(75);text("GAME OVER",40,260);noLoop();}
  if(score >= 10){background(0);textSize(21);text("YOU'RE AWESOME! NOW GET A FUCKING LIFE!",20,255);noLoop();}
  
  
// Als linkerpijltje wordt ingehouden, gaat de balk naar links en stopt tegen de rand van het kader.
  if (keyPressed){      
    if (key == CODED){      
      if (keyCode == LEFT){      
        balkX = balkX - richtingBalk;  
          if(balkX < 0){    
            balkX = 0;
            }
          }
        }
      }
// Einde code besturing links


// Als rechterpijltje wordt ingehouden, gaat de balk naar rechts en stopt tegen de rand van het kader. 
    if (keyPressed){      
      if (key == CODED){      
        if (keyCode == RIGHT){      
          balkX = balkX + richtingBalk;  
            if(balkX > 400){    
              balkX = 400;
            }
          }
        }
      }
}
//Einde void draw 
   




// Klassen
class Kogel{ 
  float kogelX;
  int kogelY;
  int breedteKogel;
  int hoogteKogel;
  int richtingKogel;
  
  


Kogel(int tempX, int tempY, int tempSnelheid){
  kogelX = tempX;
  kogelY = tempY;
  breedteKogel = 30;
  hoogteKogel = 30;
  richtingKogel = tempSnelheid;
  
}
// Einde klassen

//functies
void vallen(){
// Begin vallende kogels    
      kogelY = kogelY + richtingKogel;
      if (kogelY > 500){kogelY = 0;
      kogelX = random(0,500);
      }
      
       kogelY = kogelY + richtingKogel;
      if (kogelY > 500){kogelY = 0;
      kogelX = random(0,500);
      }
      
       kogelY = kogelY + richtingKogel;
      if (kogelY > 500){kogelY = 0;
      kogelX = random(0,500);
      }
// Einde code vallende kogels

}

// Begin detectie
void detectie(){
if(kogelY > balkY && kogelX >= balkX && kogelX <= balkX + 100)
{score = score - 1; kogelY = 0;}


}
// Einde detectie

// Begin detectie2
void detectie2(){
if(kogelY > balkY && kogelX >= balkX && kogelX <= balkX + 100)
{score = score + 1; kogelY = 0;}

}
// Einde detectie2



// Begin teken kogel en balk
void teken(){
  fill(255,0,0);
  ellipseMode (CENTER);
  ellipse(kogelX,kogelY,breedteKogel,hoogteKogel);
  rect(balkX,balkY,breedteBalk,hoogteBalk);  
}
// Einde teken kogel en balk

//Begin teken2
void teken2(){
  fill(255);
  ellipseMode (CENTER);
  ellipse(kogelX,kogelY,breedteKogel,hoogteKogel);
  rect(balkX,balkY,breedteBalk,hoogteBalk);  
}
//Einde teken2

}



