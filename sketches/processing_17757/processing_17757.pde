
//space ship is more space-shippy, borders work, and more levels!
int clickcount = 0;
int lives5;
int lives4;
int lives3;
int lives2;
int life1;
final static int EAST = 1;
final static int WEST = 2;
final static int MENU = 4;
final static int PLAYING = 8;
final static int ENDGAME = 16;
final static int RESET = 32;
int gamestate;
int result;
float healthnum = 142;
float x ;
float y;//x and y coordinates of the player 
int r;
int lives;
int herocol;//hero color
int score;

int speed=10;//hero's speed

float dropspeed;// Speed of drop
color dropcol;// Color of the drop
int currentLevel;


class Hero {// class for the player, aka hero. 
  int z;

  Hero() {

    z=53;
  }



  void display() {

    fill(0,255,0);
    
    ellipse(x,y,r*2,r*2);//creates the ellipse for the player
    noStroke();
    triangle(x,y-(r/2),x-(r+10),y+r,x+(r+10),y+r);
    triangle(x,y-(r+(r/2)),x+r,y,x-r,y);
  
}
}


class Drop {

  float dropx; //Variable for x location of drop
  float dropy;// Variable for y location of drop
  //float dropspeed;// Speed of drop
  //color dropcol;// Color of the drop
  float droprad;// Radius of drop
  //float w;//w is the color variable. color is chosen randomly 1-50; if 42, the drop will be a power up. else,
  //color is red, and very very bad.
  Drop() {
    droprad=random(10,20);// All drops are the same size
    dropx=random(width);// Start with a random x location within the game window
    dropy=-10;// Start a little above the window
    //dropspeed=3;// Pick a random speed
    // w=random(1-50);
    dropcol=color(139,98,31);// Color
  }
  // Move the drop down
  void move() {
    dropy=dropy+dropspeed;// Increase y position by speed
  }

  // Check if it hits the bottom
  boolean reachedBottom() {
    // If we go a little beyond the bottom
    if (dropy>height) { 
      return true;
    } 
    else {
      return false;
    }
  }

  // Display the drop
  void display() {
    stroke(0);
    fill(dropcol); // Fill with color variable
    noStroke();// Set stroke color with color variable or call noStroke()
    ellipse(dropx,dropy,droprad*2,droprad*2);// Draw a circle with using your variables
  }

  // If the drop is intercepted

  void intercept() {
    dropspeed=0;// Stop it from moving     
    dropy=1000;// Set the location to somewhere way off-screen
  }
}


Drop[]drops;
int totalDrops=0;



void setup() {
  size(600,600);
  result=0;

  x=250;
  y=450;
  r=25;
  
  score=0;
  drops = new Drop[6000];

  score = 0; 

  gamestate = MENU;
}
void draw() { 
   if(clickcount > 0) {
     gamestate = PLAYING;
   } else {
     gamestate = MENU;
   }
  if(healthnum <=3) {
    gamestate = ENDGAME;
  }

x = constrain(x,0,600);
  switch(gamestate) {
    
  case PLAYING:
    textSize(12);
    background(0);
    Hero hero;

    hero= new Hero();
    hero.display();
    smooth(); 
    frameRate(60);
    score=score+1;
    fill(255);
    text(lives,10,10);
    
    
    //new health idea 
    fill(255,0,0);
    rect(1,1,healthnum,20);
    
    
    fill(255);
    text(score,470,10);

    drops[totalDrops]=new Drop();
    totalDrops++;
    frameRate(60);
    if(totalDrops>=drops.length) {
      totalDrops=0;//start over
    }
    for(int i=0;i<totalDrops;i=i+7) {
      drops[i].move();
      drops[i].display();
      if(dist(x,y,drops[i].dropx,drops[i].dropy)<drops[i].droprad+ r) {
        drops[i].intercept();
        healthnum = healthnum - drops[i].droprad;
      }
    }


    if(lives>=5) {
      herocol=lives5;
    }

    if(lives==4) {
      herocol=lives4;
    }

    if(lives==3) {
      herocol=lives3;
    }

    if(lives==2) {
      herocol=lives2;
    }

    if(lives==1) {
      herocol=life1;
    }

 
    if(x < 0|| x > 600) {
      speed = speed * -1; //player bounces off borders
    }

    //BEGGINNING OF LEVEL BLOB


    fill(255);
    text("Your current level is "+currentLevel, 200,10); 
    
    if(score<2000) {
      currentLevel = 1;
      r=10;
      dropspeed=2;
    }
    if((score>2000)&&(score<4000)) {
      currentLevel = 2;
      dropspeed=3;
    }
    if((score>=4000)&&(score<6000)) {
      currentLevel = 3;
      dropspeed = 3.5;
    }

    if((score>=6000)&&(score<8000)) {
      currentLevel = 4;
      dropspeed = 4;
    }
    if((score>=8000)&&(score<10000)) {
      currentLevel = 5;
      dropspeed = 5;
    }
    if((score>=10000)&&(score<12000)) {
      currentLevel = 6;
      dropspeed = 6;
    }
    if((score>=12000)&&(score<14000)) {
      currentLevel = 7;
      dropspeed = 7;
    }
    if((score>=14000)&&(score<16000)) {
      currentLevel = 8;
      dropspeed = 8;
    }
    if((score>= 16000)&&(score<18000)) {
      currentLevel = 9;
      dropspeed = 9;
    }
    if((score>=18000)&&(score<20000)) {
      currentLevel = 10;
      dropspeed = 10;
    }

    if((score>=20000)&&(score<22000)) {
      currentLevel = 11;
      dropspeed = 11;
    }

    if((score>=22000)&&(score<24000)) {
      currentLevel = 12;
      dropspeed = 12;
    } 

    if((score>=24000)&&(score<26000)) {
      currentLevel = 13;
      dropspeed = 13;
    }

    if((score>=26000)&&(score<28000)) {
      currentLevel = 14;
      dropspeed = 14;
    }

    if((score>=28000)&&(score<30000)) {
      currentLevel = 15;
      dropspeed = 15;
    }
    if((score>=30000)) {
      currentLevel = 16;
      dropspeed = 16;
    }
      //END OF LEVEL BLOB




      switch(result) {

      case RESET:
        clickcount = 0;
        score = 0;
        
        lives = 5;
        break;

      case EAST: 
        x=x+speed; 
        break;

      case WEST: 
        x=x-speed; 
        break;
      }

      break;

    case MENU:
      background(0);
      fill(255);
      textSize(32);
      text("ASTEROID QUEST!!!", 170,200);
      fill(255);
      rect(225,275,150,75);
      
      //play button
      fill(0);
      textSize(12);
     
      text("Click Here to Play",250,315);
      
      if((mouseX>225)&&(mouseX<375)&&(mouseY>275)&&(mouseY<350)&&(mousePressed)) {
        clickcount = clickcount + 1;
      }
      
       /*instructions button
       rect(225,375,150,75);
       text("Instructions",264,415);
       if((mouseX>225)&&(mouseX<375)&&(mouseY>375)&&(mouseY<450)&&(mousePressed)) {
        
      }
      */
      
      break;


    case ENDGAME:
      score = score;
      background(0);
      fill(255);
      textSize(42);
      text("MISSION ABORTED", 150,200);
      textSize(15);
      text("YOU HAVE SUSTAINED FATAL DAMAGE\nIT IS TOO DANGEROUS TO GO ON\n THE AMOUNT OF PARSECS YOU HAVE TRAVERSED IS",150,250);
      text(score,200,320);
      text("Retry your mission by pressing the 'R' Key",150,335);


      if(keyPressed) {
        if(key == 'r' || key == 'R') {
         gamestate = PLAYING;
         x = 300;
         healthnum = 142;
         score = 0;
         
        }
      }
    }
  }






  void keyPressed() {
    switch(key) {

      case('p'):
      case('P'):
      gamestate |=PLAYING;

      break; 


      case('m'):
      case('M'):
      gamestate |=MENU;

      break;

      case('r'):
      case('R'):
      result |=RESET;
      break;    

      case('d'):
      case('D'):
      result |=EAST;
      speed=5;
      break;

      case('a'):
      case('A'):
      result |=WEST;
      speed=5;
      break;
    }
  }

  void keyReleased() {  
    switch(key) {

      case('d'):
      case('D'):
      result ^=EAST;
      break;

      case('a'):
      case('A'):
      result ^=WEST;
      break;

      case('r'):
      case('R'):
      result ^=RESET;
      gamestate = PLAYING;
      break;
    }
  }


