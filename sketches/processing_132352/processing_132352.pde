

//AFBEELDINGEN GEBRUIKT IN SPEL
PImage boot;
PImage achtergrond;
PImage piraat;
PImage piraatTwee;
PImage piraatDrie;

//VARIABELEN
int teller;
int highscore;
int lifeTeller;
int level;

//BOOLEAN TEST VOOR GAME OVER, INTRO* (WERKT NIET, ZIE COMMENTEER ONDERAAN BESTAND)
boolean test;
boolean intro;

//PIRATEN
piraat piraat1;
piraat piraat2;
piraat piraat3;

void setup(){
  size (750,750);
  boot = loadImage("boot.png");
  achtergrond = loadImage("achtergrond.png");
  
   piraat = loadImage("piraat.png");
   piraatTwee = loadImage("piraat2.png");
   piraatDrie = loadImage("piraat3.png");
   
  piraat1 = new piraat(5, piraat);
  piraat2 = new piraat(5, piraatTwee);
  piraat3 = new piraat(5, piraatDrie);
  
  teller = 0;
  highscore = 0;
  lifeTeller = 5;
  
  test = true;
  intro = false;
  
 }

void draw(){
  
  //GAME OVER SCHERM
  if (test == false){
    background (0,255);
    
    textAlign(CENTER);
    text ("You've lost too many crew members and cannot start your journey to Jamaica", width/2, height/2);
    text ("GAME OVER! press the ENTER button to restart", width/2, 450);
    text ("Crew saved (HIGHSCORE): " +highscore, width/2, 300);
    
    if (keyPressed){test = true; lifeTeller=5; level=0; teller=0; highscore=0;}
 
 //HET SPEL ZELF 
}
    else {
  image(achtergrond,0,0);
  image(boot,mouseX,350);
  
  //level1
  piraat1.afbeelding();
  piraat1.snelheid();
  piraat1.piraatBeweging();
  
  //level 2
  if (level > 0){
  piraat2.afbeelding();
  piraat2.snelheid();
  piraat2.piraatBeweging();
  }
  
  //level 3
  if (level > 1){
    piraat2.richting = 7;
  }
    
  //level 4
  if (level > 2){
  piraat2.richting = 5;
  piraat3.afbeelding();
  piraat3.snelheid();
  piraat3.piraatBeweging();
  }
  
  //level 5
  if (level > 3){
  piraat2.richting = 6;  
  }
  
  //level 6
  if (level > 4){
  piraat3.richting = 6;
  }
  
  //level 7
  if (level > 5){
  piraat1.richting = 6;
  piraat2.richting = 7;
  }
  
  //level 8
  if (level > 6){
  piraat3.richting = 7;
  piraat2.richting = 8;
  }
  
  
  //TEXT LINKS BOVEN IN SCHERM
  textAlign(LEFT);
  textSize (20);
  text ("Score " + teller, 10,20);
  text ("Lifes " +lifeTeller,10,40);
  text ("Level " +level, 10,60);
  text ("Highscore " +highscore, 10, 80);
  
  
  //TELLER DIE ERVOOR ZORGT DAT JE NAAR DE VOLGENDE LEVELS GAAT
  if (teller == 10){
  teller = 0;
  level = level +1; 
  println (level);
  }
    }
 
}

// Ik had graag nog een intro voor het spel gehad, dit heb ik geprobeerd maar kreeg het helaas niet uitgevoerd zie hier de code:

     
/* Intro van het spel
  if (intro == false){
    background (0,255);
    textAlign(CENTER);
    textSize(40);
    text ("Arrrrr matey, welcome to rescue the pirates! Make sure you catch all crew members to go to the next level, you can lose a maximum of 5 crew members or else it's GAME OVER!", width/2, height/2);
    if (keyPressed){intro = true;}
  }
  */
       
  
class piraat {
  PImage piraat;
  
  float piraatX;
  int piraatY;
  int richting;
  
//setup
piraat(int tempRichting, PImage tempPiraat){
 
  piraat = tempPiraat;
  piraatX = random(0,700);
  piraatY = 100;
  richting = tempRichting;
}

//AFBEELDING
void afbeelding(){
   image(piraat,piraatX,piraatY);
  }  
  
//VALSNELHEID  
void snelheid(){  
  piraatY = piraatY + richting;
  }
  
//SCORE TELLER ALS PIRAAT GEVANGEN WORD
void piraatBeweging(){
  if(piraatY > 370 && piraatX > mouseX-30 && piraatX < mouseX+100){
    piraatY = 0;
    teller = teller+1;
    highscore = highscore+1;
    println (teller);
  }

//RESET VAN PIRAATY  
  else if(piraatY > 750){
  piraatY = 0;
  lifeTeller = lifeTeller-1;
  }
  
//RANDOM SPAWNEN VAN DE PIRAAT OVER DE BREEDTE
  if(piraatY == 0){
    piraatX = random (width);} 
  
//GAME OVER TELLER
  if (lifeTeller == 0){
    test = false;
    println (test); }
    }
}


