
/*float son valores reales, todos los que estÃ�ï¿½Ã�Â¡n en comas son variables*/
/*int son valores enteros, todos los que estÃ�ï¿½Ã�Â¡n en comas son variables*/
/* el unlock 1, unlock 2, son para desblquear los demÃ�ï¿½Ã�Â¡s niveles*/
float posicionx, ypos, xvel, yvel, accel, n, xbasket, ybasket, boardHeight,give, space, i, wind;
int value = 0, dir = 1,level, score, hiscore, ballColor, comment;
boolean falling, Shoot, backboard, windOn, unlock1, unlock2, reset;
PShader blur;
void setup() {
  size (1000, 800 );
  posicionx = width/5;
  ypos = height-300;
  yvel = .5;
  xvel = .5;
  accel = 2;
  falling = false;
  Shoot = false;
  xbasket = random(400, 800);
  ybasket = random(200, 600);
  backboard = false;
  give = 20;
  score = 0;
  space =  0;
  level = 1;
  hiscore = 0;
  comment = 0;
  wind = random(-.3, .3);
  windOn = false;
  unlock1 = false;
  unlock2 = false;
  ballColor = 4;
  reset = false;
}
 
void draw() {
  background(96,128,209);
  textSize(20);
  fill(255);
  /*AquÃ�ï¿½Ã�Â­ estaban todos los niveles se puede poner asÃ�ï¿½Ã�Â­ con la pura leyenda de abajo o un cambiod e pantalla*/ 
  if (comment == 1){
      text("Rayos,perdiste", width/2, height -60);
  }
 
  if (comment >= 2 && comment <6){
      text("Ganaste!", width/2, height -60);
  /* hasta aquÃ�ï¿½Ã�Â­*/     
 
  }
  fill(255);
  if (level == 2){
    unlock1 = true;
  }
  boardHeight = 180 - level*30;
  n = 180 - level*30;
  /*Sin Ã�ï¿½Ã�Â©sta funciÃ�ï¿½Ã�Â³n el programa no corre*/
  noStroke();
  fill(255);
  if (score > hiscore){
    hiscore = score;
  }
  /*hasta aquÃ�ï¿½Ã�Â­*/
  textSize(20);
  if (windOn == true){
     xvel += wind;
     text("WIND: " + wind, 10, height - 90);
  }
 /*SI se boora Ã�ï¿½Ã�Â©sta parte hasta donde empieza el otro comentario se eliminan los niveles pero la pelota avanza mÃ�ï¿½Ã�Â¡s rÃ�ï¿½Ã�Â¡pido*/
  text("HIGHSCORE: " + hiscore, 10, height - 70);  
  text("SCORE: " + score, 10, height - 30);
  level = score/10 + 1;
  text("LEVEL: " + level, 10, height - 50);
  /*Hasta aquÃ�ï¿½Ã�Â­*/
  rect(xbasket, ybasket, 50, 5);   
  
    
  /* Ã�ï¿½Ã�Â©ste imprime los niveles que has ganado*/
  println(score + ", " + level);
  /*hasta aquÃ�ï¿½Ã�Â­*/
  if (posicionx >= width||ypos >= height){
     reset = true;
  }
  if (xvel > 25){
    xvel = 25;
  }
  if (yvel >25){
    yvel = 25;
  }
  rect(0, 0, yvel*20, 5);
  rect(0, 10, xvel*20, 5);
  rect(xbasket+n, ybasket - boardHeight, 5, boardHeight+5);
if (Shoot == false||falling==false){
  xvel = (mouseX-width/5)/7;
  yvel = (height-300 - mouseY)/7;
  stroke(255);
  line(posicionx, ypos, posicionx +xvel*5, ypos-yvel*5);
  noStroke();
}
if (Shoot == true||falling==true) {
  falling = true;
  if (backboard) {
    yvel -= 5 ;
    posicionx -= 1.25*xvel;
    give = 40;
  }
  else {
    posicionx += xvel;
  }
 
  yvel -= accel;
  ypos -= yvel;
}
  if (posicionx > xbasket-20 + n && xpos < xbasket + n + 30 && ypos > ybasket -boardHeight-5 && ypos < ybasket) {
     backboard = true;
  } 
  if(posicionx>xbasket-10 && posicionx<xbasket+20 && ypos < (ybasket + give) && ypos > (ybasket -10)){
    yvel = -yvel;
    xvel = -xvel;
  }
if (posicionx >xbasket+20 && posicionx<(xbasket+n) && ypos < (ybasket + give) && ypos > (ybasket -10) && yvel < 1 ) {
  posicionx = width/5;
  ypos = height-300;
  yvel = .1;
  xvel = .1;
  accel = 1;
  falling = false;
  Shoot = false;
  ybasket = random(300, 700);
  xbasket = random(400, 800);
  wind = random(-.3, .3);
 
//  n -=30;
  backboard = false;
//  boardHeight-=30;
  score += 1;
  comment = score + 1;
}
if (ballColor == 4){
  fill(242, 98, 15);
}
if (ballColor == 1){
  fill(255, 0, 0);
}
if (ballColor == 2){
  fill(0, 255, 0);
}
if (ballColor == 3){
  fill(random(0,255),random(0,255),random(0,255));
}
 
 
ellipse(posicionx, ypos, 30, 30); 
  if (unlock1 == true){
    fill(255, 0, 0);
    ellipse(int(width-40), int(height - 40), 30, 30);
    fill(0,255, 0);
    ellipse(int(width-80), int(height - 40), 30, 30);
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(int(width-120), int(height - 40), 30, 30);
   }
  if (reset == true){
    posicionx = width/5;
    ypos = height-300;
    yvel = .1;
    xvel = .1;
    accel = 1;
    n = 150;
    falling = false;
    Shoot = false;
    ybasket = random(200, 500);
    xbasket = random(400, 800);
    wind = random(-.3, .3);
    backboard = false;
    boardHeight = 150;
    give = 15;
    score = 0;
    i = 0;
    space = 0; 
    comment = 1;  
    reset = false;
  }
}
 
void mouseClicked() {
  if (value == 0) {
    Shoot = true;
  }
}
 


/* Programa original


float xpos, ypos, xvel, yvel, accel, n, xbasket, ybasket, boardHeight,give, space, i, wind;
int value = 0, dir = 1, level, score, hiscore, ballColor, comment;
boolean falling, Shoot, backboard, windOn, unlock1, unlock2, reset;
PShader blur;
void setup() {
  size (1000, 800 );
  xpos = width/5;
  ypos = height-300;
  yvel = .5;
  xvel = .5;
  accel = 2;
  falling = false;
  Shoot = false;
  xbasket = random(400, 800);
  ybasket = random(200, 600);
  backboard = false;
  give = 20;
  score = 0;
  space =  0;
  level = 1;
  hiscore = 0;
  comment = 0;
  wind = random(-.3, .3);
  windOn = false;
  unlock1 = false;
  unlock2 = false;
  ballColor = 4;
  reset = false;
}
 
void draw() {
  background(50);
  textSize(20);
  fill(255);
  if (comment == 1){
      text("Really, bro?", width/2, height -60);
  }
 
  if (comment >= 2 && comment <6){
      text("AMAZING!", width/2, height -60);
  }
  if (comment >= 6 && comment <11){
      text("BALLIN'!", width/2, height -60);
  }
  fill(random(0,255),random(0,255),random(0,255));
  if (comment >= 11 && comment <16){
      text("C-C-C-COMBO BREAKER!", width/2, height -60);
  }
  if (comment >= 16 && comment <21){
      text("SWEET SHOT!", width/2, height -60);
  }
  if (comment >= 21 && comment <31){
      text("UNSTOPPABLE!", width/2, height -60);
  }
  if (comment >= 31 && comment <41){
      text("LET'S SEE SOME MORE!", width/2, height -60);
  }
  if (comment >= 41 && comment <51){
      text("WE GOTS A HAXOR!", width/2, height -60);
  }
  if (comment >= 51 && comment <76){
      text("DOMINATING", width/2, height -60);
  }
  if (comment >= 76){
      text("GODLIKE", width/2, height -60);
  }
  fill(255);
  if (level == 2){
    unlock1 = true;
  }
  if (level == 3){
    unlock2 = true;
  }
  boardHeight = 180 - level*30;
  n = 180 - level*30;
 
  noStroke();
  fill(255);
  if (score > hiscore){
    hiscore = score;
  }
  textSize(20);
  if (windOn == true){
     xvel += wind;
     text("WIND: " + wind, 10, height - 90);
  }
  text("HIGHSCORE: " + hiscore, 10, height - 70);  
  text("SCORE: " + score, 10, height - 30);
  level = score/10 + 1;
  text("LEVEL: " + level, 10, height - 50);
  rect(xbasket, ybasket, n, 5);     
  println(score + ", " + level);
  if (xpos >= width||ypos >= height){
     reset = true;
  }
  if (xvel > 25){
    xvel = 25;
  }
  if (yvel >25){
    yvel = 25;
  }
  rect(0, 0, yvel*20, 5);
  rect(0, 10, xvel*20, 5);
  rect(xbasket+n, ybasket - boardHeight, 5, boardHeight+5);
if (Shoot == false||falling==false){
  xvel = (mouseX-width/5)/7;
  yvel = (height-300 - mouseY)/7;
  stroke(255);
  line(xpos, ypos, xpos+xvel*5, ypos-yvel*5);
  noStroke();
}
if (Shoot == true||falling==true) {
  falling = true;
  if (backboard) {
    yvel -= 5 ;
    xpos -= 1.25*xvel;
    give = 40;
  }
  else {
    xpos+= xvel;
  }
 
  yvel -= accel;
  ypos -= yvel;
}
  if (xpos > xbasket-20 + n && xpos < xbasket + n + 30 && ypos > ybasket -boardHeight-5 && ypos < ybasket) {
     backboard = true;
  } 
  if(xpos>xbasket-10 && xpos<xbasket+20 && ypos < (ybasket + give) && ypos > (ybasket -10)){
    yvel = -yvel;
    xvel = -xvel;
  }
if (xpos>xbasket+20 && xpos<(xbasket+n) && ypos < (ybasket + give) && ypos > (ybasket -10) && yvel < 1 ) {
  xpos = width/5;
  ypos = height-300;
  yvel = .1;
  xvel = .1;
  accel = 1;
  falling = false;
  Shoot = false;
  ybasket = random(300, 700);
  xbasket = random(400, 800);
  wind = random(-.3, .3);
 
//  n -=30;
  backboard = false;
//  boardHeight-=30;
  score += 1;
  comment = score + 1;
}
if (ballColor == 4){
  fill(242, 98, 15);
}
if (ballColor == 1){
  fill(255, 0, 0);
}
if (ballColor == 2){
  fill(0, 255, 0);
}
if (ballColor == 3){
  fill(random(0,255),random(0,255),random(0,255));
}
 
 
ellipse(xpos, ypos, 30, 30); 
  if (unlock1 == true){
    fill(255, 0, 0);
    ellipse(int(width-40), int(height - 40), 30, 30);
    fill(0,255, 0);
    ellipse(int(width-80), int(height - 40), 30, 30);
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(int(width-120), int(height - 40), 30, 30);
   }
  if (reset == true){
    xpos = width/5;
    ypos = height-300;
    yvel = .1;
    xvel = .1;
    accel = 1;
    n = 150;
    falling = false;
    Shoot = false;
    ybasket = random(200, 500);
    xbasket = random(400, 800);
    wind = random(-.3, .3);
    backboard = false;
    boardHeight = 150;
    give = 15;
    score = 0;
    i = 0;
    space = 0; 
    comment = 1;  
    reset = false;
  }
}
 
void mouseClicked() {
  if (value == 0) {
    Shoot = true;
  }
}
 
void keyPressed() {
  if (key == 'r') {
    reset = true;
  }
  if (key == 'w'){
    windOn = !windOn;
  }
  if ( unlock1 == true){
    if (key == 'c'){
      ballColor = 1;
    }
    if (key == 'v'){
      ballColor = 2;
    }
    if (key == 'b'){
      ballColor = 3;
    }
    if (key == 'n'){
      ballColor = 4;
    }
 
  }
        
} */

