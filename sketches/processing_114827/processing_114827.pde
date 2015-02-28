
float placex = 10;
float placey = 50;
int banehoejde = 50;
float benplace = 0;
float speed = 0;
boolean pressed = false;
boolean lasta = false;
boolean running = true;
boolean aimmode = false;
boolean flying = false;
float angle = 0;
boolean anglein = true;
float opspeed = 0;
boolean fail = false;
int range = 0;
int record = 0;

void setup() {
  size(1000, 200);
  frameRate(60);
}
void draw() {
  //bg
  background(78, 183, 82);
  fill(150, 150, 150);//løbebane
  rect(-1, 73, width+2, 8);
  fill(214, 199, 147);//sandgrav
  rect(width-344, 73, 351, 8);

  //logic
  if (running) {
    speed=speed*0.995;
    benplace+=speed;
    placex +=speed;
    if (placex>width-350) {
      fail=true;
    }
  }
  if (aimmode) {
    fill(255, 255, 255);
    arc(placex+20, placey+5, 100, 100, -QUARTER_PI, 0);
    line(placex+20, placey+5, placex+70, placey+5);
    //line(placex+20, placey+5
    fill(255, 0, 0);
    arc(placex+20, placey+5, 100, 100, -QUARTER_PI*angle, 0);
    if (anglein) {
      angle+=0.05;
    } 
    else {
      angle-=0.05;
    }
    if (angle>1) {
      anglein=false;
    }
    if (angle<0) {    
      flying=true;
      aimmode=false;
      opspeed=angle*2;
      placey-=1;
    }
  }
  if (flying) {
    if (placey<banehoejde) {
      placex+=speed*2;
      placey-=opspeed;
      opspeed-=0.1;
      if (record<round(-(width-350-placex))) {
        record=round(-(width-350-placex));
      }
    }
  }


  //mand
  fill(237, 204, 163);
  stroke(0, 0, 0);
  ellipse(5+placex, 5+placey, 10, 10);
  line(5+placex, 10+placey, 5+placex, 20+placey);//mave
  line(5+placex, 10+placey, 7.5+placex-benplace/2, 17+placey);//harm
  line(5+placex, 10+placey, 2.5+placex+benplace/2, 17+placey);//varm
  line(5+placex, 20+placey, 10+placex-benplace, 28+placey);//hben
  line(5+placex, 20+placey, 0+placex+benplace, 28+placey);//vben
  if (benplace>10) {
    benplace = 0;
  }


  //hud
  fill(50*speed, 255-50*speed, 0);
  rect(10, 10, speed*100, 15);//speedmeter
  textSize(22);
  if (placex<30) {
    fill(0, 0, 0);
    text("Tap A and D", 10, 110);
  }
  if (fail) {
    textSize(90);
    fill(0, 0, 0);
    running=false;
    text("FAILL!!¤#!", width/2, height/2);
    textSize(22);
    text("Remember to jump!", width/2, height/2+50);
    text("Press R to restart", 10, 150);
  }
  else {
    if (placex>width-350) {
      fill(0, 0, 0);
      text(round(-(width-350-placex))+" cm!", width-350, 110);//længdemåleaddadr
      text("Press R to restart", 10, 150);
    }
    else {
      fill(0, 0, 0);
      text("SPACE!!", width-350, 110);
    }
  }
  textSize(22);
  fill(0, 0, 0);
  text("Record: "+record, 10, 180);
}

void keyPressed() {
  if ((key== 'a' || key == 'A')&&!pressed&&!lasta&&running) {
    speed+=0.2;
    pressed=true;
    lasta=true;
  }
  else {
    if ((key== 'd' || key == 'D')&&!pressed&&lasta&&running) {
      speed+=0.2;
      pressed=true;
      lasta=false;
    }
  }
  if (key== ' '&&aimmode) {
    flying=true;
    aimmode=false;
    opspeed=angle*2;
    placey-=1;
  }
  if (key== ' '&&running) {
    running=false;
    aimmode=true;
  }
  if (key== 'r' || key == 'R') {
    placex = 10;
    placey = 50;
    banehoejde = 50;
    benplace = 0;
    speed = 0;
    pressed = false;
    lasta = false;
    running = true;
    aimmode = false;
    flying = false;
    angle = 0;
    anglein = true;
    opspeed = 0;
    fail = false;
    range = 0;
  }
}

void keyReleased() {
  pressed=false;
}



