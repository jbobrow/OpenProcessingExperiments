

int pantalla = 1; // SELECTOR DE PANTALLA
 
void setup() {
    size(1000,800);
        noLoop();
}


    switch(pantalla) { // DESPLIEGA PANTALLA CORRESPONDIENTE
        case 1:
        background(111, 240, 79);
fill(245, 111, 8);
ellipse(224, 210, 255, 255);
  
fill(0,0,0);
    textSize(71);
    text("BASKET-", 1, 62);
    textSize(57);
    text("F", 1,113);
    text("O", 1,163);
    text("R", 1,213);
    text("C", 1,263);
    text("E", 1,313);
    break;
 
case 2:

background(111, 240, 79);
stroke(150);
fill(0,0,0);
    textSize(50);
    text("¡BIENVENIDO!",0, 49);
      
    stroke(150);
fill(0,0,0);
    textSize(32);
    text("INSTRUCCIONES:",0, 97);
      
    stroke(150);
fill(0,0,0);
    textSize(25);
    text("-  Ingresar valores de masa y de",0, 128);
      
    stroke(150);
fill(0,0,0);
    textSize(25);
    text("la aceleración.",0, 157);
      
    stroke(150);
fill(0,0,0);
    textSize(23);
    text("- Dependiendo de los valores será la",0, 187);
      
    stroke(150);
fill(0,0,0);
    textSize(23);
    text(" fuerza del balón.",0, 220);
      
    stroke(150);
fill(0,0,0);
    textSize(23);
    text("- Dá click en el balón. ",0, 254);
      
    stroke(150);
fill(0,0,0);
    textSize(23);
    text("- Gana si encesta el balón. ",0, 290);
    break;
    
    case 3 :
    default:

// DEFINIR TODAS LAS VARIABLES A UTILIZAR

float xpos, ypos, xvel, yvel, acel, n, xcanasta, ycanasta, boardHeight,give, space, i, wind;
int value = 0, dir = 1,level, score, hiscore, ballColor, comment;
boolean falling, Shoot, backboard, windOn, unlock1, unlock2, reset;
PShader blur;
void setup() {
  
  xpos = width/5;
  ypos = height-300;
  yvel = .5;
  xvel = .5;
  acel = 2;
  falling = false;
  Shoot = false;
  xcanasta = (400, 800);
  ycanasta = (200, 600);
  backboard = false;
  space =  0;
  level = 1;
  hiscore = 0;
  comment = 0;
  wind = random(-.3, .3);
  windOn = false;
  unlock1 = false;
  unlock2 = false;
  ballColor = 4;
   
}
   
void draw() {
  background(96,128,209);
  textSize(20);
  fill(255);
  
  if (comment == 1){
      textSize(100);
      text("Rayos -.- !", width/3.5, height/2);
  }
   
  if (comment >= 2 && comment <6){
      textSize(100);
      text("Ganaste!", width/3.5, height/2);
    
   
  }
  fill(255);
  if (level == 2){
    unlock1 = true;
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
     text("Peso influido: " + wind, 10, height - 90);
  }
 
   
  rect(xcanasta, ycanasta, n, 5);   
   
  if (xpos >= width||ypos >= height){
     reset = false ;
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
  falling = false;
  Shoot = false;
  ycanasta = random(300, 700);
  xcanasta = random(400, 800);
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
    falling = false;
    Shoot = false;
    ycanasta = random(200, 500);
    xcanasta = random(400, 800);
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
break;

}

void mouseClicked() {
    switch(pantalla) { // CAMBIA PANTALLA SEGUN ACCION DEL MOUSE
        case 1:
            pantalla = 2; // redraw() if noLoop
            
                        break;
        case 2:
            pantalla = 3;
            // redraw();
            break;
        case 3:
            pantalla = 1;
            // redraw();
            break;
    }
}

