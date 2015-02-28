
Explosion[] ex = new Explosion[50];

int sValue = 100;
O[] orbit = new O[sValue];

int x=60;//x coordinate
int y=0;//y coordinate

int v=10;//velcoity

int timer=0;
int explode =0;

int enemyValue=0;//number of enemys killed
float ESxp=random(120);//enemy ship x position
float ESyp=random(120);//isnt on here, enemy y position

int cartridgex=0;//catridge x postion
int cartridge=10;//laser slot count

int laserx=0;//laser x position
int lasery=0;//laser y position
int laser=0;//total laser count

int score=0;//score
int total=1;//total score
int life=1;//life of enemy

float g=60; //force field growth rate
int ffRadius =1; //force field radius

//Blast Off Button
float xPos=300;
float yPos=510;
int br=100;

int menu = 1;
int enemy = 0;
int question = 0;
int laser1 =0;
int cartridge1 =0;
int ship = 0;
int forcefield = 0;
int gameOver=0;

String[]q = {
  "Fill this rectangle with the colour blue", "Fill this rectangle with the colour red", "Fill this rectangle with the colour green", "Fill this rectangle with the colour orange", "Fill this rectangle with the colour yellow", "Fill this rectangle with the colour purple"
};
int index;

void setup() {
  size(600, 600);
  background(0);
  smooth();
  ellipseMode(CENTER);
  PFont fontA;
  fontA = loadFont("AgencyFB-Reg-48.vlw");
  textFont(fontA, 20);

  //activate meteors
  for (int i=0;i<sValue;i++) {
    orbit[i] = new O((float)random(width), (float)random(height), (float)random(15), (float)random(360), (float)random(0.7));
  }

  //activate enemy explosion
  for (int e=0;e<ex.length;e++) {
    ex[e] = new Explosion(ESxp, ESyp);
  }
}

void draw() {
  background(0);

  timer++;

  if (laser!=0) {//if lasers meet criteria laser function called
    laser();
  }
  //score position,size and colour
  fill(255);
  text(score, width-63, height-10);

  // initalise meateors
  for (int i=0;i<sValue;i++) {
    orbit[i].meteor();
  }

  if (dist(laserx, lasery, ESxp, ESyp)<20) {
    //initialise Enemy explosion
    for (int e=0;e<ex.length;e++) {
      ex[e].activate();
    }
  }

  if (question ==1) {
    question();
  }


  if (cartridge1 ==1) {
    cartridge();
  }

  if (laser1 == 1) {
    laser();
  }

  if (forcefield == 1) {
    forcefield();
  }

  if (ship == 1) {
    ship();
  } 

  if (enemy == 1) {
    enemy();
  }

  if (explode==1) {
    if (timer<1000) {
      timer++;
      for (int e=0;e<ex.length;e++) {
        ex[e].activate();
      }
    }
    else {
      timer=0;
    }
  }

  if (menu == 1) {
    menu();
  }

  if (gameOver == 1) {
    gameOver();
  }

  //game over screen
  if (cartridge<1) {//once ammo is less than 1
    gameOver=1;
  }

  if (key == ENTER) {
    restart();
  }
}

//forcefield
void forcefield() {

  if (ffRadius>100) {
    g=-1;
  }
  if (ffRadius<60) {
    g=1;
  }

  ffRadius+=g;

  fill(170, 255, 210, 150);
  ellipse(ESxp, ESyp, 60, 60);
  fill(170, 255, 210, 100);
  ellipse(ESxp, ESyp, ffRadius, ffRadius);
}

//ammo section
void cartridge() {

  cartridgex = cartridge*12;//amount that show on screen
  while (cartridgex > cartridge+5) {//carticdges move across as used
    noStroke();
    fill(10, 255, 174);
    rect(cartridgex, height-30, 5, 25);//ammo shape and position
    cartridgex=cartridgex-10;//ammo spacing
  }
}

//game over scene
void gameOver() {
  noStroke();
  fill(0);
  rect(0, 0, width, height);
  fill(255);//colour of game over screen
  score=score*1;//score calculation
  text("GAME OVER!", 245, 200);
  text(score, 245, 250);
  text("Press ENTER to restart",245,350);

  if (score<5) {
    text("Maybe Try Again", 245, 300);
  }

  if (score>4 && score <11) {
    text("Good Going", 245, 300);
  }

  if (score>10 && score<16) {
    text("Great Job", 245, 300);
  }

  if (score>15 && score<21) {
    text("Excellent Work!", 245, 300);
  }

  if (score>20) {
    text("Your A Pro!", 245, 300);
  }
}

//restart function
void restart() {

  menu =0;
  gameOver =0;
  cartridge1 =1;
  laser1 =0;
  forcefield = 1;
  ship = 1;
  enemy = 1;
  question=0;
  if (cartridge<10) {
    cartridge=0+10;
  }
  explode=0;
  score=0;
}

//menu scene
void menu() {

  fill(0);
  rect(0, 0, 600, 600);
  fill(255);
  text("COLOUR INVASION!", 250, 100);
  text("Instructions:", 265, 190);
  text("Control the spaceship using the LEFT and RIGHT arrows", 145, 215);
  text("Shoot the spaceship's laser using the SPACEBAR", 165, 240);
  text("To destroy the enemy ship you must identify the colour", 145, 265);
  text("in the box in the botton right hand corner", 175, 290);
  text("Select the right colour using keys 1-6 to destroy the", 145, 315);
  text("enemy ship", 265, 340);
  text("The game is over when you run out of lasers", 165, 365);
  text("Press ENTER to restart at any point in the game", 155, 390);
  text("GOOD LUCK YOUNG SPACE-CADET!",205,415);
  noStroke();
  fill(191, 191, 191, 75);
  ellipse(width/2, 310, 400, 200);
  fill(170, 232, 247, 75);
  ellipse(width/2, 230, 200, 125);
  stroke(255);
  fill(255, 0, 0);
  ellipse(xPos, yPos, br, br);
  fill(255);
  text("BLASTOFF!", 272, 517);

  if (mousePressed && (mouseButton == LEFT)) {
    if (dist(xPos, yPos, mouseX, mouseY)<br/2) {
      enemy = 1;
      ship=1;
      forcefield=1;
      cartridge1=1;
      gameOver=0;
      menu=0;
    }
  }
}

//questions
void question() {

  strokeWeight(1);
  stroke(255);
  noFill();
  rect(390, 450, 200, 115);
  fill(255);
  text("colour", 447, 472);
  text("key", 417, 472);
  text("colour", 547, 472);
  text("key", 517, 472);
  text("1", 420, 497);
  text("2", 420, 527);
  text("3", 420, 557);
  text("4", 520, 497);
  text("5", 520, 527);
  text("6", 520, 557);
  fill(19, 67, 185);
  rect(450, 480, 20, 20);
  fill(19, 185, 20);
  rect(450, 510, 20, 20);
  fill(255, 10, 10);
  rect(450, 540, 20, 20);
  fill(255, 124, 0);
  rect(550, 480, 20, 20);
  fill(255, 247, 0);
  rect(550, 510, 20, 20);
  fill(156, 0, 255);
  rect(550, 540, 20, 20);

  fill(255);
  text(q[index], ESxp -127, ESyp + 52);

  noFill();
  stroke(255);
  rect(ESxp -130, ESyp +30, 265, 30);
  stroke(255);
  rect(ESxp + 110, ESyp + 35, 20, 20);
}

//ship shape,colour and position
void ship() {
  strokeWeight(1);
  stroke(0);
  fill(255, 0, 0);//hidden red bit (target)
  ellipse(x, height-50, 50, 10);
  fill(100);//grey bit of ship
  ellipse(x, height-70, 100, 50);
  fill(0, 153, 153);
  ellipse(x, height-90, 50, 30);
  fill(58, 59, 59);
  ellipse(x, height-60, 5, 5);
  ellipse(x-30, height-67, 5, 5);
  ellipse(x+30, height-67, 5, 5);
}
//enemy shape,colour and position
void enemy() {
  strokeWeight(1);
  fill(214, 0, 0);//enemy ship shape
  ellipse(ESxp, ESyp, 50, 10);
  ellipse(ESxp, ESyp, 20, 20);
  fill(0, 153, 153);
  ellipse(ESxp, ESyp, 10, 5);
  //fill(10,255,74,50);
  //ellipse(ESxp, ESyp, 70,40);
  //coordinate for hitting the ship
  if (ESxp<laserx+25&&ESxp>laserx-25&&lasery<20&&lasery>9) {//laser perameters around ship
    enemy = 0;
    index = (int)random(q.length);
    question = 1;
    forcefield=0;
    explode=1;
    cartridge=cartridge+1;//gain laser per kill
    score=score+1;//1 point is added to the score
    life=life-1;//life is taken away from enemy
    if (ESxp<width-100) {//if enemy posistion is on screen
      float r=random(100, 200);
      ESxp=ESxp+r;//keeps enemy on the screen(moves between 100 and 200 away)
    }    
    ESxp=ESxp-100;//enemy x-axis position is on screen limits
    for (int e=0;e<ex.length;e++) {//activate enemy explosion
      ex[e] = new Explosion(ESxp, ESyp);
    } 
    if (life<0) {//if enermy shot (loses 1 life)
      ESxp=random(width-405, width-195);//after shot position of the enemy stops it going off screen
      ESyp=random(50, height-210);
      enemyValue=enemyValue+1;//enemy added
      life=total;//enemy lives counted = total score accumulated
    }
  }
}

void keyPressed() {

  if (keyCode == 49) {
    if (index == 0) {
      fill(19, 67, 185);
      rect(ESxp + 110, ESyp + 35, 20, 20);
      question = 0;
      enemy= 1;
      forcefield=1;
    }
    else {
      cartridge=cartridge-1;
    }
  }

  if (keyCode == 50) {
    if (index == 2) {
      fill(19, 185, 20);
      rect(ESxp + 110, ESyp + 35, 20, 20);
      question = 0;
      enemy = 1;
      forcefield=1;
    }
    else {
      cartridge=cartridge-1;
      }
    }

  if (keyCode == 51) {
    if (index == 1) {
      fill(255, 10, 10);
      rect(ESxp + 110, ESyp + 35, 20, 20);
      question = 0;
      enemy = 1;
      forcefield=1;
    }
    else {
      cartridge=cartridge-1;
    }
  }

  if (keyCode == 52) {
    if (index == 3) {
      fill(255, 124, 0);
      rect(ESxp + 110, ESyp + 35, 20, 20);
      question = 0;
      enemy = 1;
      forcefield=1;
    }
    else {
      cartridge=cartridge-1;
    }
  }

  if (keyCode == 53) {
    if (index == 4) {
      fill(255, 247, 0);
      rect(ESxp + 110, ESyp + 35, 20, 20);
      question = 0;
      enemy = 1;
      forcefield=1;
    }
    else {
      cartridge=cartridge-1;
    }
  }

  if (keyCode == 54) {
    if (index == 5) {
      fill(156, 0, 255);
      rect(ESxp + 110, ESyp + 35, 20, 20);
      question = 0;
      enemy = 1;
      forcefield=1;
    }
    else {
      cartridge=cartridge-1;
    }
  }

  if (keyCode == 37) {//move ship left
    x-=v;
  }
  if (keyCode == 39) {//move ship right
    x+=v;
  }

  if (key==' ') {//space bar shoots the laser
    laser=1;
  }

  //Spaceship returns to screen
  if (x>width) {
    x=0;
  }
  if (x<0) {
    x=width;
  }
  if (y>height) {
    y=0;
  }
  if (y<0) {
    y=height;
  }
}

//Laser command
void laser() {
  if (laser<5) {//?
    laserx=x;//laser start point x position
    lasery=height-130;//laser start point y position
    laser=5;//?
    cartridge=cartridge-1;//laser is taken away from cartridge
  }
  if (laser!=0) {
    noStroke();
    fill(10, 255, 74);//laser colour
    rect(laserx, lasery, 2, 7);//laser shape
    lasery=lasery-20;//laser speed
  }
  if (lasery<0) {
    laser=0;//if no lasers left no longer shoot
  }
}

//Meteor Backdrop
class O {
  float x=0;
  float y=0;
  float d=0;
  float a=0;
  float m=0;

  public O(float x, float y, float d, float a, float m) {
    this.x = x;
    this.y = y;
    this.d = d;
    this.a = a;
    this.m = m;
  }

  public void meteor() {
    stroke(51, 26, 0);
    strokeWeight(2); 
    fill(102, 51, 0);

    float ychange = sin(radians(a));
    ellipse(x, y+height/60, d, d);
    x+=m;
    a+=0.5;
    y+= ychange;

    if (x>width) {
      m=m*-1;
    }

    if (x<0) {
      m=m*-1;
    }
  }
}

//Exploding enemy ship class
class Explosion {

  float ESxp=0;
  float ESyp=0;
  float t=0;
  float m=0;

  public Explosion(float ESxp, float ESyp) {
    this.ESxp = ESxp;
    this.ESyp = ESyp;
    t = random(360);
    m=random(5);
  }

  public void activate() {
    //function calling particles to appear
    stroke(255, 51, 0);
    strokeWeight(1);
    fill(255, 51, 0);
    ESxp += m*cos(radians(t));
    ESyp += m*sin(radians(t));
    fill(255, 51, 0);
    ellipse(ESxp, ESyp, 5, 5);
  }
}


