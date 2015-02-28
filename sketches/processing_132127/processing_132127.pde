
/* @pjs font="frozen.ttf"; */

PImage elsa ;
PFont Frozen;
int x = 150;
int x1 = 840;
int x2 = 235;
int x3 = 862;
int x4 = 868;
int x5 = 178;
int x6 = 221;
int opa = 0;
int opaDelta = 1;

float y1 = 0;
float y2 = 0;
float y3 = 0;
float y4 = 0;

void setup() {
  size(1300, 700);
  elsa = loadImage("Elsa.png") ;
  Frozen = createFont("frozen.ttf" , 128);
}

void draw() {
  background(#0A0C64);
  noStroke();
  
  //backgroundcolours
  fill(#0B0D6C);
  rect(0, 100, width, 650);
  fill(#0D0F71);
  rect(0, 200, width, 550);
  fill(#131576);
  rect(0, 300, width, 425);
  fill(#16197C);
  rect(0, 400, width, 300);
  fill(#171983);
  rect(0, 450, width, 150);
  
  //snowflakesbehindelsa
    fill(250);
  ellipse(75, y2+20, 10, 10);
  ellipse(120, y1+30, 10, 10);
  ellipse(180, y4-50, 10, 10);
  ellipse(230, y3-10, 5, 5);
  ellipse(245, y4+50, 10, 10);
  ellipse(300, y3+80, 5, 5);
  ellipse(340, y2+75, 10, 10);
  ellipse(400, y1, 15, 15);
    ellipse(445, y1+20, 10, 10);
  ellipse(500, y2+30, 10, 10);
  ellipse(530, y3-50, 10, 10);
  ellipse(580, y4-10, 5, 5);
  ellipse(615, y1+50, 10, 10);
  ellipse(650, y2+80, 5, 5);
  ellipse(700, y3+75, 10, 10);
  ellipse(730, y4, 15, 15);
  
  
  image(elsa, 200, 200, 650, 500);
  
  textFont(Frozen, 80);
  fill(250, opa);
  text("LET IT GO LET IT GO. CANT HOLD IT BACK ANYMORE. LET IT GO LET IT GO. TURN AWAY AND SLAM THE DOOR. I DONT CARE WHAT THEYRE GOING TO SAY. LET THE STORM RAGE ON THE COLD NEVER BOTHERED ME ANYWAY.", x, 150);
  
  x = x - 4 ;
  if (x < -12000) {
    x = 1300 ;
  }
  
  opa = opa + opaDelta ;
  if (opa > 100) {
    opaDelta = -1 ;
  }
  if (opa < 0) {
    opaDelta = 1 ;
  }
  
  //stupidsnowflakes
  fill(250);
  ellipse(x1, 444, 10, 10);
  ellipse(x3, 480, 5, 5);
  ellipse(x4, 411, 7, 7);
  ellipse(x1+10, 435, 5, 5);
  ellipse(x3-25, 460, 8, 8);
  ellipse(x4+15, 421, 13, 13);
    ellipse(x1-10, 429, 10, 10);
  ellipse(x3-10, 500, 15, 15);
  ellipse(x4-10, 450, 7, 7);
  ellipse(x1-20, 470, 10, 10);
  ellipse(x3-15, 430, 8, 8);
  ellipse(x4-18, 510, 13, 13);
  x1+=2;
  if (x1 > 1300) {
    x1 = 840 ;
  }
    
    x3+=1.5;
    if (x3 > 1300) {
      x3 = 862 ;
    }
      
      x4+=3;
    if (x4 > 1300) {
      x4 = 868 ;
  }
  
  //morestupidsnowflakes
  fill(250);
  ellipse(x2, 600, 10, 10);
  ellipse(x5, 632, 5, 5);
  ellipse(x6, 572, 7, 7);
  ellipse(x2+10, 610, 13, 13);
  ellipse(x5-15, 622, 8, 8);
  ellipse(x6-10, 590, 6, 6);
  ellipse(x2+10, 550, 15, 15);
  ellipse(x5-15, 560, 10, 10);
  ellipse(x6+5, 650, 7, 7);
  ellipse(x2+10, 640, 13, 13);
  ellipse(x5-15, 662, 12, 12);
  ellipse(x6-10, 580, 6, 6);
  x2-=2;
  if (x2 < 0) {
    x2 = 235;
  }
  
  x5-=1;
  if (x5 < 0) {
    x5 = 178;
  }
  x6-=3;
  if (x6 < 0) {
    x6 = 221;
  }
  
  //ohmygodihatesnowflakes
  fill(250);
  ellipse(50, y1+20, 10, 10);
  ellipse(100, y2+30, 10, 10);
  ellipse(140, y3-50, 5, 5);
  ellipse(200, y4-10, 12, 12);
  ellipse(250, y1+50, 10, 10);
  ellipse(320, y2+80, 5, 5);
  ellipse(440, y3+75, 10, 10);
  ellipse(600, y4, 15, 15);
    ellipse(650, y1+20, 10, 10);
  ellipse(750, y2+30, 10, 10);
  ellipse(840, y3-50, 5, 5);
  ellipse(950, y4-10, 12, 12);
  ellipse(1050, y1+50, 10, 10);
  ellipse(1100, y2+80, 5, 5);
  ellipse(1200, y3+75, 10, 10);
  ellipse(1250, y4, 15, 15);
     ellipse(785, y3+20, 10, 10);
  ellipse(820, y4+30, 10, 10);
  ellipse(870, y2-50, 10, 10);
  ellipse(905, y3-10, 5, 5);
  ellipse(945, y2+50, 10, 10);
  ellipse(990, y3+80, 5, 5);
  ellipse(1040, y4+75, 10, 10);
  ellipse(1120, y1, 15, 15);
    ellipse(1180, y2+75, 10, 10);
  ellipse(1220, y1, 15, 15);
  ellipse(1280, y3, 12, 12);
  y1+=1;
  if(y1 > height) {
    y1 = 0;
  }
  y2+=2;
  if(y2 > height) {
    y2 = 0;
  }
  y3+=2.5;
  if(y3 > height) {
    y3 = 0;
  }
  y4+=3;
  if(y4 > height) {
    y4 = 0;
  }
  
  
  
  
  
  
  
  
}


