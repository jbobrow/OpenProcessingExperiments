
Banaan mijnBanaan;
Banaan mijnBanaan2;
Banaan mijnBanaan3;
PImage achtergrond;
PImage aap;
PImage bananen;
int teller;
int richting;
int x;
int y;
boolean test;
int score=0;

void setup() {
  size(900, 700);
  achtergrond = loadImage("achtergrond.png");
  aap= loadImage ("aap.png");
  bananen= loadImage ("bananen.png");
  mijnBanaan = new Banaan (200, 30, 5);
  mijnBanaan2 = new Banaan (70, 80, 10);
  mijnBanaan3 = new Banaan (400, 200, 20);
  richting=2;
  teller=5;
  test = true;
}



void draw() {
  if( test == false){
  gameOver();
  if (keyPressed){test = true; teller=5;} score= 0;
 
  }
  else {
  mijnBanaan.achtergrond();
  mijnBanaan.aap();
  mijnBanaan.beweging();

  mijnBanaan.testRand();
  mijnBanaan.updateBanaan();
  mijnBanaan.bananen();

  mijnBanaan2.testRand();
  mijnBanaan2.updateBanaan();
  mijnBanaan2.bananen();

  mijnBanaan3.testRand();
  mijnBanaan3.updateBanaan();
  mijnBanaan3.bananen();
  
 textSize(20);
 fill(0);
 textAlign(LEFT);
  text("Levens" +teller,20,50);
  text("score" + score,20,70);
}
  }
class Banaan { //class van de banaan
 
  float banaanX = 20;
  float banaanY = 10;
  

  Banaan(int tempX, int tempY, int tempRichting) {
    banaanX = tempX;
    banaanY = tempY; //de positie van de banaan bepalen door wat ingevuld wordt bij de setup
    richting = tempRichting;
   
  }
   void achtergrond() {

    image(achtergrond, 0, 0);
  }
      void bananen() {
    image(bananen, banaanX, banaanY);
  }

  void updateBanaan() {
    banaanY = banaanY + richting;
  }


   
  void aap() {
    imageMode(CENTER);
    image(aap, mouseX, 570);
    imageMode (CORNERS);
  }

    
    void testRand() {
    if (banaanY > 600 && banaanX > mouseX-110 && banaanX < mouseX+5) {
      banaanY = 0;
      banaanX = random (0, 900);
      score = score +1;
    }
  
   else if(banaanY == 700){ teller= teller -1;
  banaanY = 0;
  }
  if (teller == 0){
    test = false;
 println (test); }
    }
    
  void beweging() {
    y=y+1;
  }
   
 

}
 void gameOver() {
  textSize(100);
  background (0,255);
  textAlign(CENTER);
  fill(255);
  text("GAME OVER",width/2, height/2);
  textSize(25);
  text("Press enter to restart",width/2, 550);


  }
  
 


