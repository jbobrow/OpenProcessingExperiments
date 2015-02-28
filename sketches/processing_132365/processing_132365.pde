
PImage gorilla;
PImage banaan;
PImage banaanTwee;
PImage achtergrond;

int teller;
int lifeTeller;
int level;

boolean test;

banaan banaan1;
banaan banaan2;

void setup(){
  size (750,650);
  gorilla = loadImage("Gorilla.png");
  achtergrond = loadImage("Achtergrond.png");
  banaan = loadImage("Banaan.png");
  banaanTwee = loadImage("Banaan2.png");
  banaan1 = new banaan (5, banaan);
  banaan2 = new banaan(5, banaanTwee);
  teller = 0;
  lifeTeller = 5;
  test = true;
  
 }

void draw(){
  //Game over
  if (test == false){
    background (0,255);
    textAlign(CENTER);
    text ("GAME OVER, press spacebar to restart!", width/2, height/2);
    if (keyPressed){test = true; lifeTeller=5; level=0; teller=0;}
  }
    else {
  image(achtergrond,0,0);
  image(gorilla,mouseX,450);
  
  //level1
  banaan1.afbeelding();
  banaan1.snelheid();
  banaan1.banaanBeweging();
  
  //level 2
  if (level > 0){
  banaan2.afbeelding();
  banaan2.snelheid();
  banaan2.banaanBeweging();
  } 
  
  //level 3
  if (level > 1){
    banaan2.richting = 7;
  }
  
   textAlign(LEFT);
   textSize(20);
   fill(255, 240, 0);
   
  text ("Score " + teller, 10,25);
  text ("Lifes " + lifeTeller,10,50);
  text ("Level " +level, 10,75);
  
  //volgend level teller
  if (teller == 10){
  teller = 0;
  level = level +1; 
  println (level);
  }
    }
 
}
class banaan {
PImage banaan;
  
  float banaanX;
  int banaanY;
  int richting;
  
//setup
banaan(int tempRichting, PImage tempBanaan){
 
  //banaan = loadImage("");
  banaan = tempBanaan;
  banaanX = random(0,700);
  banaanY = 100;
  richting = tempRichting;
}

void afbeelding(){
   image(banaan,banaanX,banaanY);
  }  
  
void snelheid(){  
  banaanY = banaanY + richting;
  }
  
void banaanBeweging(){
  if(banaanY > 370 && banaanX > mouseX-30 && banaanX < mouseX+100){
    banaanY = 0;
    teller = teller+1;
    println (teller);
  }
  
  else if(banaanY > 750){
  banaanY = 0;
  lifeTeller = lifeTeller-1;
  }
  
  if(banaanY == 0){
    banaanX = random (width);} 
  
  if (lifeTeller == 0){
    test = false;
    println (test); }
    }
}



