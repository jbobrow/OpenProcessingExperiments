
      /*¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨*\
      |*¨¨ EDITED BY MSV ¨¨¨*|
      |*__   15/05/2014   __*|
      \*____________________*/

/*
Releitura da música "Pela Internet" de Gilberto Gil.
  
  Ti­tulo: Com quantos gigabytes se faz uma jangada?
  Autor: Wyverson Bonasoli de Oliveira
 */

boolean animeRun = false;//checar se a animação esta ou não rodando
boolean day = true;//checar se é dia
float sunX = 200+212*cos(radians(45));
float sunY = 200-212*sin(radians(45));
int sAngle = 45;

void setup () {
  size (400, 400);
  smooth();
}

//Sun
void sun (float x, float y) {
  stroke(245, 245, 218);
  strokeWeight (2);
  int angle = 0;
  float sunLightX, sunLightY;
  //raios
  while (angle < 360) {
    sunLightX = x+35*cos(radians(angle));
    sunLightY = y+35*sin(radians(angle));
    line(x, y, sunLightX, sunLightY);
    angle+= 20;
  }
  strokeWeight (1);
  noStroke();
  //red
  fill (255, 0, 0);
  arc (x, y, 40, 40, radians(210), radians(330));
  //yellow
  fill (255, 255, 0);
  beginShape();
  vertex (x, y-8.2);
  vertex (x+19.2, y-11);
  vertex (x+5, y);
  endShape(CLOSE);
  arc (x, y, 40, 40, radians(330), radians(450));
  //green
  fill (50, 212, 50);
  beginShape();
  vertex (x, y+20);
  vertex (x+9.2, y);
  vertex (x, y);
  endShape(CLOSE);
  arc (x, y, 40, 40, radians(90), radians(210));
  //red
  fill(255, 0, 0);
  beginShape();
  vertex (x-17.2, y-11);
  vertex (x-7.4, y+4);
  vertex (x, y);
  endShape(CLOSE);
  //center
  fill (255);
  ellipse (x, y, 55/3, 55/3);
  fill (0, 127, 255);
  ellipse (x, y, 15, 15);
}

//anoitecer
void sunDown (){
  animeRun = true;
  sunX = 200+212*cos(radians(sAngle));
  sunY = 200-212*sin(radians(sAngle));
  sun (sunX, sunY);
  if (sAngle == 205){
    animeRun = false;
    day = false;
  }
}

//amanhecer
void sunRize (){
  animeRun = true;
  sunX = 200+212*cos(radians(sAngle));
  sunY = 200-212*sin(radians(sAngle));
  sun (sunX, sunY);
  if (sAngle == 360){
    sAngle = 0 ;
  }
  if (sAngle == 45){
    animeRun = false;
    day = true;
  }
}

 //start animation
void mouseClicked (){
  if(animeRun == false){
    animeRun = true;
  }
}
  
void draw () {
  noCursor();
  frameRate (6);
  
  //Variaveis para os cantos do HD
  float x, y, ax, ay, bx, by, cx, cy, dx, dy, ex, ey, fx, fy, gx, gy;
  
  //x e y com pequenas variações para simular o efeito da jangada balançando no mar
  x = random(94, 95);
  y = random(117, 118);

  ax = 1+x;
  bx = 5+x;
  cx = 79+x;
  dx = 79+x;
  ex = 215+x;
  fx = 208+x;
  gx = 133+x;
  ay = 61+y;
  by = 81+y;
  cy = 167+y;
  dy = 149+y;
  ey = 54+y;
  fy = 72+y;
  gy = 0.5+y;
  
  background (0, 41, 84);
  stroke (100);
  strokeWeight (1);
  fill (55);
  

  
  quad (ax, ay, bx, by, cx, cy, dx, dy);
  quad (cx, cy, dx, dy, ex, ey, fx, fy);


  
  
  
  //Céu
  noStroke();
  fill(0, 255, 255);
  rect(0, 0, 400, 130);

  //sun
  if (day && !animeRun){
    sun(sunX, sunY);
  }
  if (day && animeRun){
    sunDown();
    sAngle ++;
  }
  if (!day && animeRun){
    sunRize();
    sAngle ++;
  }

//"Infomar"
  fill (0, 41, 84);
  rect (0, 130, 400, 270);
  textSize(15);
  textAlign(CENTER);
  int num = 0;
  while (num<40) {
    fill(13, 104, 179);
    text ("<html>", random(0, 390), random(150, 400));
    text ("</body>", random(0, 390), random(150, 400));
    text ("<br>", random(0, 390), random(150, 400));
    text ("<head>", random(0, 390), random(150, 400));
    text ("<title>", random(0, 390), random(150, 400));
    if (num/4 == 0){
      fill (50, 120, 250);
      text ("Tia Ciata", random(0, 390), random(150, 400));
      text ("Donga", random(0, 390), random(150, 400));
    }
    num++;
  }
  
  //HD/Jangada
  fill (55, 55, 55, 175);
  quad (ax, ay, bx, by, cx, cy, dx, dy);
  quad (cx, cy, dx, dy, ex, ey, fx, fy);
  fill (170);
  quad (ax, ay, dx, dy, ex, ey, gx, gy);

  //Adesivo
  fill(255);
  beginShape();
  vertex (21.1+x, 66+y);
  vertex (26+x, 54+y);
  vertex (65+x, 35+y);
  bezierVertex (100+x, 40+y, 85+x, 21+y, 86+x, 26+y);
  vertex (126+x, 7+y);
  vertex (140+x, 8.5+y);
  vertex (194+x, 43.5+y);
  vertex (196+x, 54+y);
  vertex (155+x, 82+y);
  bezierVertex (128+x, 80+y, 133+x, 97+y, 135+x, 95+y);
  vertex (94+x, 122+y);
  vertex (72+x, 120+y);
  endShape(CLOSE);

  //Marca e capacidade do HD / Nome e ano da jangada
  rotate(radians(-133));
  textSize(15);
  textAlign(LEFT);
  fill(0);
  text("Seagate", -286, -28);
  textSize (10);
  text ("1.916 Gb", -284, -18);
  rotate(radians(133));

  //partes sem adesivo
  fill (170);
  ellipse (90+x, 75+y, 43, 35);
  ellipse (131+x, 31+y, 15, 12);

  //screws
  stroke (150);
  fill (200);
  ellipse (17+x, 61+y, 5, 5);
  ellipse (79+x, 30.8+y, 4.5, 4.5);
  ellipse (133+x, 4+y, 4, 4);
  ellipse (202+x, 51.5+y, 4.5, 4.5);
  ellipse (146+x, 89+y, 5.5, 5.5);
  ellipse (80+x, 135+y, 6, 6);

  //Main mast
  fill (176, 124, 72);
  noStroke ();
  beginShape();
  vertex (85+x, 75+y);
  vertex (85+x, y-50);
  vertex (95+x, y-50);
  vertex (95+x, 75+y);
  bezierVertex (85+x, 80+y, 87+x, 75+y, 85+x, 75+y);
  endShape();

  //Sail
  stroke (210);
  beginShape();
  fill (255);
  vertex (x+20, y-50);
  bezierVertex (x+160, y-35, x+160, y-50, x+160, y-50);
  vertex (x+160, y+40);
  bezierVertex (x+20, y+50, x+20, y+40, x+20, y+40);
  endShape(CLOSE);
  
  //Sail Paint
  noStroke();
  //red
  fill (255, 0, 0);
  beginShape();
  vertex (x+25, y-45);
  vertex (x+87.5, y-40);
  vertex (x+87.5, y-7.5);
  vertex (x+25, y-7.5);
  endShape(CLOSE);
  //green
  fill(0, 255, 0);
  beginShape();
  vertex (x+92.5, y-39);
  bezierVertex (x+155, y-35, x+155, y-44, x+155, y-42);
  vertex (x+155, y-7.5);
  vertex (x+92.5, y-7.5);
  endShape(CLOSE);
  //yellow
  fill(255, 255, 0);
  beginShape();
  vertex (x+155, y-2.5);
  vertex (x+155, y+35);
  vertex (x+92.5, y+37);
  vertex (x+92.5, y-2.5);
  endShape(CLOSE);
  //blue
  fill(0, 0, 255);
  beginShape();
  vertex (x+25, y-2.5);
  vertex (x+87.5, y-2.5);
  vertex (x+87.5, y+38);
  bezierVertex (x+25, y+40, x+25, y+35, x+25, y+35);
  endShape(CLOSE);
  
  //anoitecer, amanhecer
  if (animeRun && day || !day && !animeRun){
    fill (0, 2.4*(sAngle-130));
    rect (0,0, 400, 400);
  }
  if (animeRun && !day){
    if (sAngle > 46 && sAngle < 315){
      fill (0, 180);
      rect (0, 0, 400, 400);
    } else if (sAngle >= 315 && sAngle <= 360){
      fill (0, 180-2.4*(sAngle-315));
      rect (0, 0, 400, 400);
    }else if (sAngle < 30){
      fill (0, 72-2.4*sAngle);
      rect (0, 0, 400, 400);
    }
  }
  
 //Stars
  if (sAngle > 170 && sAngle < 355){ 
    stroke (random (200, 255));
    strokeWeight (random(4, 6));
    point (50, 50);
  }
  if (sAngle > 187 && sAngle < 330){
    stroke (random (200, 255));
    strokeWeight (random(2, 3));
    point (386, 113); 
    stroke (random (200, 255));
    strokeWeight (random(2, 3));
    point (142, 55); 
  }
  if (sAngle > 195 && sAngle < 335){
    stroke (random (200, 255));
    strokeWeight (random(0, 3));
    point (205, 26);
    stroke (random (200, 255));
    strokeWeight (random(3, 5));
    point (15, 35);
    stroke (random (200, 255));
    strokeWeight (random(3, 4));
    point (300, 16);
  }
  if (sAngle > 205 && sAngle < 320){
    stroke (random (200, 255));
    strokeWeight (random(2, 6));
    point (38, 104);
    stroke (random (200, 255));
    strokeWeight (random(2, 4));
    point (384, 78);
  }
  if (sAngle > 210 && sAngle < 315){
    stroke (random (200, 255));
    strokeWeight (random(2, 4));
    point (274, 76);
    stroke (random (200, 255));
    strokeWeight (random(1, 5));
    point (294, 104);
    stroke (random (200, 255));
    strokeWeight (random(1, 4));
    point (65, 96);
  }
  if (sAngle > 225 && sAngle < 310){
    stroke (random (200, 255));
    strokeWeight (random(2, 5));
    point (112, 22);
  }
  
};
