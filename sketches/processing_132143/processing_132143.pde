
//Bibi Buursen
//1321064
//CMD1B

//Er is gewerkt met een begin uitleg voor het starten van de game. Starten = key indrukken).
//Je speelt het spel met of de muis of touchpad van laptop.
//Een bad apple (oranje-bruin) wil zeggen dat het gif voor sneeuwwitje is en ze deze niet mag vangen.
//Poison: 5 wil zeggen dat ze maximaal 4 mag vangen want bij de 5e heeft haar lichaam teveel gif ingenomen door het vangen van de appels.
//Bij 5 gif appels zal er Game Over in het beeld komen samen met de behaalde score en manier om opnieuw te beginnen (key indrukken).

PImage startscreen;
PImage img;

int stage;
int monsterX;
int amountAppels = 0;                    //aantal appels
Catcher catcher;
Drop[] drops; 
float make; 
float choose; 
int lives;                               //aantal levens
int score;                              //aantal punten

 
 
void setup(){
  size(700,700);
  choose = 0.9476;
  lives = 5;
  catcher = new Catcher();
  drops = new Drop[250];
  
  startscreen = loadImage("startscherm1.jpg");
  image (startscreen, 0, 0, 700, 700);
  
  stage = 1;
}





  
void draw(){
      if(stage==1){
          img = loadImage("startscherm1.jpg");
       }



      if(keyPressed == true){
          stage = 2;
       }



      if(stage==2){
         
        PImage img;
        img = loadImage("sneeuwwitje19.jpg");
        background(img);
       
         
         
         
    catcher.setLocation(mouseX-60);          //middelpunt van vanger
    catcher.display();
    if( lives > 0 ) {
    fill(0);
    textSize(20);
    text("Poison:   " + str(lives),10,532);
    text("Score: " + str(score),10,555);
  
    catcher.setLocation(mouseX-60); 
    catcher.display();
    
    make = random(0,1);      //hoeveelheid
    
    
    
    if (make >= choose) {
      drops[amountAppels] = new Drop();
      amountAppels++ ;
      if (amountAppels >= drops.length) {
        amountAppels = 0;
      }
    }
  
  for (int i = 0; i < amountAppels; i++ ) {
      drops[i].move();
      drops[i].display();
      if (catcher.intersect(drops[i]) == 1) {
        score = score + 10;                          //aantal punten dat erbij komt als goede appel gevangen wordt
        drops[i].caught();
      } else if (catcher.intersect(drops[i]) == 2) {
        score = score - 0;                           //aantal punten dat verminderd als slechte appel gevangen wordt
        lives = lives-1;
        drops[i].caught();
      }
    }
  } else {
    textSize(80);
    fill(0);
    text("GAME OVER",130,350);
    textSize(30);
    text("Score: " + str(score),275,530);
    text("Press any key to start a new game",120,565);
    if(keyPressed){
      amountAppels = 0;
      setup();
    }
  }
  
}
}
//Bibi Buursen
//1321064
//CMD1B

PImage img2;
PImage img3;

class Drop {
  float x,y;                // plaats van vallende appel
  float speed;              // snelheid van de vallende appel
 
  float bad;
  float choose;
  
  Drop() {
   
    bad = random(0,01);     // willekeurige vallen of niet vallen van een slechte appel
    x = random(600);        // beeldbreedte
    y = 0;                  // startpunt
    speed = random(3,7);    // willekeurige snelheid tussen 3 - 7 dat appels vallen
    
    
    img2 = loadImage ("appel.png");
    img3 = loadImage ("rotteappel.png");
    choose = 0.7;
  }
  // appels vallen naar beneden
  void move() {
    
    y += speed;   // vergroten van aantal
  }

  
  void display() {      // beeld van de appel
      

      if (bad <= choose){
//goede appel (moet gevangen worden)


   image(img2, x,y);
      }
        
      else {
     //slechte appel (moet ontweken worden)
    
   image(img3, x,y);
  
  }
    
  }
  //als de appel gevangen wordt
  void caught() {
    speed = 0;               // snelheid stoppen
    y = - 1000;              // beeld weg
  }
}


//Bibi Buursen
//1321064
//CMD1B

PImage img4;


class Catcher {
  float x,y; // location
  
  Catcher() {
    y = 0;
    img4 = loadImage ("images.jpg");
  }
  
  void setLocation(float tempX) {
    x = tempX;
    y = 570;            //plaats van sneeuwwitje
    if (x>600){                    
      x = 600; 
    }
  }
 
 
 
  void display() { // het vangende object uitgewerkt   
   
   
 
   
   
   
   image(img4, x,y);
  }
  
  
   int intersect(Drop c) {
    float distance = dist(x,y,c.x,c.y); 
    if (distance < 75){                   //punt dat appel en sneeuwwitje raken
          if  (c.bad <= c.choose){
            return 1;
          } else {
            return 2;
          } 
    } else {
      return 0;
    }
  }
    
  }



