
float xpos, ypos, xvel, yvel, acel, n, xcanasta, ycanasta, boardHeight, give, espacio, i, peso;
int value = 0, dir = 1,nivel, puntos, puntos2, ballColor, comment;
boolean cae, disparo, backboard, windOn, unlock1, unlock2, reset;
PShader blur;
void setup() {
  size (1000, 800 );
  xpos = width/5;
  ypos = height-300;
  yvel = .5;
  xvel = .5;
  acel = 2;
  cae = false;
  disparo = true;
  xcanasta = random (400, 800);
  ycanasta = random (200, 600);
  backboard = false;
  give = 20;
  puntos = 0;
  space =  0;
  nivel = 1;
  puntos2 = 0;
  comment = 6;
  peso = random(-.3, .3);
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
   
  if (comment == 1){
      textSize(20);
      text("Rayos, intentalo de nuevo!", width/2, height-60);
  }
    
  if (comment >= 2 && comment <6){
      textSize(20);
      text("Ganaste, intenta atinar una de nuevo!", width/2, height-60);
     
    
  }
   
  boardHeight = 180 - nivel*30;
 n = 180 - nivel*30;
  
  noStroke();
  fill(255);
  if (puntos > puntos2){
   puntos2 = puntos;
  }
   
  textSize(20);
  if (windOn == true){
     xvel += peso;
     text("Peso influido: " + peso, 10, height - 90);
  }
  
    
  rect(xcanasta, ycanasta, n, 5);  
    
  if (xpos >= width||ypos >= height){
     reset = true ;
  }
  if (xvel > 25){
    xvel = 25;
  }
  if (yvel >25){
    yvel = 25;
  }
  rect(0, 0, yvel*20, 5);
  rect(0, 10, xvel*20, 5);
  rect(xcanasta+n, ycanasta - boardHeight, 5, boardHeight +5);
if (disparo == false||cae==false){
  xvel = (mouseX-width/5)/7;
  yvel = (height-300 - mouseY)/7;
  stroke(255);
  line(xpos, ypos, xpos+xvel*5, ypos-yvel*5);
  noStroke();
}
if (disparo == true||cae==true) {
  cae = true;
  if (backboard) {
    yvel -= 5 ;
    xpos -= 1.25*xvel;
    give = 40;
  }
  else {
    xpos+= xvel;
  }
    
  yvel -= acel;
  ypos -= yvel;
}
  if (xpos > xcanasta-20 + n && xpos < xcanasta + n + 30 && ypos > ycanasta -boardHeight-5 && ypos < ycanasta) {
     backboard = true;
  }
  if(xpos>xcanasta-10 && xpos<xcanasta+20 && ypos < (ycanasta + give) && ypos > (ycanasta -10)){
    yvel = -yvel;
    xvel = -xvel;
  }
  if (xpos>xcanasta+20 && xpos<(xcanasta+n) && ypos < (ycanasta + give) && ypos > (ycanasta -10) && yvel < 1 ) {
  xpos = width/5;
  ypos = height-300;
  yvel = .1;
  xvel = .1;
  acel = 1;
  cae = false;
  disparo = false;
  ycanasta = random(300, 700);
  xcanasta = random(400, 800);
  peso = random(-.3, .3);
    
//  n -=30;
  backboard = false;
//  boardHeight-=30;
  puntos += 1;
  comment = puntos + 1;
}
if (ballColor == 4){
  fill(242, 98, 15);
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
    acel = 1;
    n = 150;
    cae = false;
    disparo = false;
    ycanasta = random(200, 500);
    xcanasta = random(400, 800);
    peso = random(-.3, .3);
    backboard = false;
    boardHeight = 150;
    give = 15;
    puntos = 0;
    i = 0;
    espacio = 0;
    comment = 1;
    reset = false;
  }
}
    
void mouseClicked() {
  if (value == 0) {
    disparo = true;
  }
}
