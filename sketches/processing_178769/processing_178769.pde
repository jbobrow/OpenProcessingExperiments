
PFont pls;
PFont dis;
PFont vel;
PFont at;
PFont pnt;
PFont tit;

float fps = 90;
float t;

int pun = 0;
int plus;
int ins = 0;

float linespa;

float dnx;
float dny;

float trax;
float tray;

float lindx;
float lindy;

float dns = 60;

float flecx;
float flecy;

float bow = -30;
float cord;

float g;
float speed;
float speedx;
float speedy;
float speedmk = 30;

float ang = -45;
float radbow;
float radflec;

int c = 0;

int sta = 3;

void setup() {
  size(600, 400);
  dis = loadFont("TimesNewRoman Italic");
  vel = loadFont("Impact Bold");
  pls = loadFont("Cooper");
  at = loadFont("Verdana");
  pnt = loadFont("Arial Bold");
  tit = loadFont("Brush Script MT");
}

void draw() {

  background(255);

  if (sta == 0) {
    
    frameRate(15);
    
    flecx = 60;
    flecy = height - 50;
    radflec = radbow;
    cord = -30;
    lindx = dnx;
    lindy = dny;

    if (keyPressed) {

      if (key == 'w') { 
        ang -= 0.5;
      }
      if (key == 's') { 
        ang += 0.5;
      }

      if (key == 'd') { 
        speedmk += 0.5;
      }
      if (key == 'a') { 
        speedmk -= 0.5;
      }

      if (key == ' ' && speedmk != 0) { 
        sta = 1;
      }

      speedmk = constrain(speedmk, 0, 40);
      speed = speedmk/fps*5;
      ang = constrain(ang, -90, 0);
      
    }
    
  } else if(sta == 1) {
    
    frameRate(fps);
    
    t += 1/fps;
    g += 9.81/sq(fps)*5;

    speedx = speed*cos(abs(radbow));
    speedy = -speed*sin(abs(radbow)) + g;

    flecx += speedx;
    flecy += speedy;
    
    lindx = flecx;
    lindy = flecy;

    cord += speed;

    radflec = atan(speedy/speedx);
    
//    for(trax = 60; trax = flecx; trax += speedx) {
//      tray = 100;
//      point(trax, tray);
//    }
      
    for(trax = 60; trax <= flecx; trax += speedx) {
      tray = height - 50 - tan(abs(radbow))*trax + 4.95*sq(trax/(speed*cos(abs(radbow))));
      point(trax, tray);
    }

    if (flecx > width + 30 || flecy > height + 30) { 
      sta = 3;
      ins++;
    } 

    if (flecx >= dnx - dns/57 && flecx <= dnx + dns/57 && flecy <= dny + dns/2 && flecy >= dny - dns/2) { 
      sta = 2; 
      c = 0; 
    }
      
    
  } else if(sta == 2) {
      
      if (flecy <= dny + dns/16 && flecy >= dny - dns/16) {
        plus = 45;
        fill(255, c, c);
      } else if (flecy <= dny + dns/4 && flecy >= dny - dns/4) {
        plus = 15;
        fill(c, 255, c);
      } else {
        plus = 5;
        fill(c, c, 255);
      }
      
      if(c == 0) { pun = pun + plus; ins++; }
    
      c += 450/fps;
      c = constrain(c, 0, 255);
      
      textFont(pls);
      textAlign(CENTER);
      textSize(160);
      text("+" +plus, (width - 40)/2, (height - 50)/2);
    
    if(c >= 255) { sta = 3; }
  
  } else if (sta == 3) {

    dnx = round(random(200 + dns/6, width - 40 - dns/6));
    dny = round(random(100 + dns/2, height - 50 - dns/2));
    g = 0;
    t = 0;
    sta = 0;
  }

  cord = constrain(cord, bow - 15, bow);
  bow = map(speedmk, 0, 40, -30, -15);
  radbow = map(ang, 0, 360, 0, 2*PI); 

  strokeWeight(1);
 
  stroke(200);
  line(lindx, lindy, width - 40, lindy);
  line(lindx, lindy, lindx, height - 50);
  
  textFont(tit);
  textAlign(RIGHT);
  textSize(15);
  fill(170);
  text("Alejandro Camacho", width, height - 5);

  stroke(100);

  line(60, height - 50, width - 40, height - 50);
  line(width - 40, height - 40, width - 40, 0);

  for (linespa = 60; linespa <= width - 40; linespa += 500/20.0) {
    line(linespa, height - 50, linespa, height - 40);
  }

  for (linespa = 60; linespa <= width - 40; linespa += 500/80.0) {
    line(linespa, height - 50, linespa, height - 45);
  }

  for (linespa = height - 50; linespa >= 0; linespa -= 500/20.0) {
    line(width - 40, linespa, width - 30, linespa);
  }

  for (linespa = height - 50; linespa >= 0; linespa -= 500/80.0) {
    line(width - 40, linespa, width - 35, linespa);
  }

  stroke(0);

  fill(0, 0, 255);
  ellipse(dnx, dny, dns/3, dns);
  fill(0, 255, 0);
  ellipse(dnx, dny, dns/9, dns/2);
  fill(255, 0, 0);
  ellipse(dnx, dny, dns/27, dns/8);


  textFont(vel);
  textSize(18);
  textAlign(SQUARE);
  fill(speedmk*6.375, 0, 255 - speedmk*6.375);
  text(speedmk +"m/s", 100, height - 12);

  textFont(at);
  textSize(15);
  fill(0);
  text(abs(ang) +"º", 62, height - 70);

  pushMatrix();

  translate(60, height - 50);

  rotate(radbow);

  noFill();
  strokeWeight(4);
  stroke(220, 90, 0);
  arc(bow, 0, 30, 75, -PI/2, PI/2);

  strokeWeight(1);
  stroke(130, 95, 75);
  line(cord, 0, bow, 75/2);
  line(cord, 0, bow, -75/2);


  popMatrix();


  pushMatrix();

  translate(flecx, flecy);
  rotate(radflec);

  strokeWeight(2);
  stroke(0, 0, 0);

  line(0, 0, -30, 0);

  popMatrix();
  
  textFont(pnt);
  textSize(20);
  textAlign(LEFT, TOP);
  fill(0);
  text("PUNTOS = " +pun, 10, 10);
  text("PRECISION = " +int(pun/ins*100)/100, 10, 30);
  
  textSize(40);
  textAlign(RIGHT, TOP);
  fill(200);
  text(int(t*100)/100 + "s", width - 60 , 10);
  
  textFont(dis);
  fill(0);
  textAlign(CENTER);
  textSize(15);

  text(int((lindx - 60)*100/5)/100 +"m", lindx, height - 30);
  text(int((height - 50 - lindy)*100/5)/100 +"m", width - 20, lindy);
    
 
}



