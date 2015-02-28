
int x = 0;
int y = 0;
//====================================================== Zeitangabe
String timestamp;
String timestamp() {
  return timestamp = nf(hour(), 2) +     nf(minute(), 2);
}
//======================================================== Variablen und Kiste
RandomWalker[] walkerKiste;
float c = 0;
float f = 0;

//======================================================= Setup

void setup() {
  size(1600, 840);
  background(0);
  frameRate(200);
  walkerKiste = new RandomWalker[300];
  for (int i=0; i < walkerKiste.length; i++) {
    // blau // walkerKiste[i] = new RandomWalker(0,255,0);
    walkerKiste[i] = new RandomWalker(random(255), random(255), random(255));
    c = c + 10;
  }
}

//========================================================= Papierkorb

void mouseClicked() {
  if (dist(mouseX, mouseY, 45, 520) < 40) {
    for (int i=0; i<walkerKiste.length; i++) {
      walkerKiste[i].change = true;
    }
  }
  else if (dist(mouseX, mouseY, 40, 680) < 40) {
    for (int i=0; i<walkerKiste.length; i++) {
      walkerKiste[i].gravity = true;
    }
  }


  else if (dist(mouseX, mouseY, 45, 410) < 40) {
    for (int i=0; i<walkerKiste.length; i++) {
      walkerKiste[i].change = false;
    }
  }  
  else if (dist(mouseX, mouseY, 40, 680) < 40) {
    for (int i=0; i<walkerKiste.length; i++) {
      walkerKiste[i].gravity = false;
    }
  }
}

void mousePressed() {  
  if (dist(mouseX, mouseY, 50, 50) <47) {
    for (int i=0; i<walkerKiste.length; i++) {
      walkerKiste[i].an = true;
    }
  }
  else if (dist(mouseX, mouseY, 65, 140) < 40) {
    for (int i=0; i<walkerKiste.length; i++) {
      walkerKiste[i].gefahr = true;
    }
  }
  else if (dist(mouseX, mouseY, 45, 247) < 45) {
    for (int i=0; i<walkerKiste.length; i++) {
      walkerKiste[i].weed = true;
    }
  }

  else if (dist(mouseX, mouseY, 1545, 760) < 45) {
    for (int i=0; i<walkerKiste.length; i++) {
      walkerKiste[i].restart = true;
    }
  }
}


void mouseReleased() {
  if (dist(mouseX, mouseY, 50, 50) <47) {
    for (int i=0; i<walkerKiste.length; i++) {
      walkerKiste[i].an = false;
    }
  }
  else if (dist(mouseX, mouseY, 65, 140) <   40) {
    for (int i=0; i<walkerKiste.length; i++) {
      walkerKiste[i].gefahr = false;
    }
  }
  else if (dist(mouseX, mouseY, 45, 247) < 45) {
    for (int i=0; i<walkerKiste.length; i++) {
      walkerKiste[i].weed = false;
    }
  }
  else if (dist(mouseX, mouseY, 1545, 760) < 45) {
    for (int i=0; i<walkerKiste.length; i++) {
      walkerKiste[i].restart = false;
    }
  }
}


//========================================================== Warndreieck



//============================================================== Draw
void draw() {
  strokeWeight(4);
  fill(222, 222, 222, 20);
  noStroke();
  rect(0, 800, 1600, 40);
  stroke(255);
  quad(30, 15, 40, 80, 90, 80, 110, 15);
  //========================= Dreieck
  stroke(255, 0, 0);
  line(20, 180, 70, 110);
  line(70, 110, 100, 180);
  line(100, 180, 20, 180);
  stroke(255);
  line(68, 130, 68, 160);
  point(68, 170);
  //================================== Haken
  stroke(0, 255, 0);
  line(25, 260, 55, 285);
  line(55, 285, 85, 215);
  //================================================1.Kreis Random
  stroke(0);
  fill(random(255), random(255), random(255));
  noStroke();
  stroke(255);
  ellipse(45, 410, 50, 50);
  //=================================pfeil
  line(45, 447, 45, 490);
  line(45, 490, 30, 470);
  line(45, 490, 60, 470);
  stroke(0, 0, 246);
  noFill();
  fill(0, 0, 246);
  ellipse(45, 530, 20, 20);

  //======================================== 
  noFill();
  noStroke();
  stroke(255);
  point(1546, 32);
  point(1546, 41);
  noStroke();
  stroke(0, 255, 0);
  fill(118, 118, 118);
  ellipse(1550, 750, 70, 70);
  fill(255);

  //===========================================Gravity
  noStroke();
  stroke(255);
  line(40, 620, 40, 680);
  line(40, 680, 28, 650);
  line(40, 680, 52, 650);
  line(5, 680, 80, 680);


  //========================================================Text
  textSize(37);
  text(timestamp(), 1500, 50);
  text("Made by Johnson", 650, 830);
  textSize(50);
  fill(0, 0, 153);
  text("R", 1533, 770);
  noFill();
  //===================================================== Random Walker
  noStroke();
  fill(0, 20);
  rect(0, 0, 1600, 840);
  for (int i=0; i<walkerKiste.length; i++) {
    walkerKiste[i].step();
  }
}

// =================================================== Klasse RandomWalker
class RandomWalker {
  float x = 800;
  float y = 400;
  float r = 1;
  boolean an = false;
  boolean gefahr = false;
  boolean weed = false;
  boolean restart = false;
  boolean change = false;
  boolean gravity = false;
  float red = random(100, 255);
  float green = random(150, 255);
  float blue = random (100, 255);

  RandomWalker(float rd, float grn, float bl) {
    red = rd;
    green = grn;
    blue = bl;
  }  

  //====================================================== Bewegung RandomWalker
  void step() { 
    stroke(255);
    fill(red, blue, green, 90);
    strokeWeight(1);
    //stroke(red, blue, green, 90);

    r=random(4);
    int d=10;
    //====================================== Symbole klicken
    if (an==true) {

      x= x-10;
      y= y-10;
    }
    //================================================
    if (gefahr == true) {
      d=23;
      //noStroke();
      fill(red, 0, 0);
    }  
    //=====================================================
    if (weed==true) {

      d=3;
      fill(0, green, 0);
    }
    //=====================================

    if (restart==true) {

      x = width/2;
      y = height/2;
    }
    
    if (gravity==true) {
      y= y+3;
    }

    //========================================
    if (change==true) {
      noStroke();
      fill(0, 0, random(100, 255));
      ellipse(x, y, 6, 6);
      d=16;
    }
    else {
      ellipse(x, y, 15, 15);
    }

    if (r<=1) {
      x = x+d;
    }
    else if (r<=2) {
      x = x-d;
    }
    else if (r<=3) {
      y = y+d;
    }

    else {
      y = y-d;
    }

    if (x>width) {
      x=-x;
    }

    if (x<0) {
      x=-x;
    }
    if (y>height) {
      y= -y;
    }
    if (y<0) {
      y= -y;
      
    }

    //========================================================= Ausweichen der Maus

    if (dist(mouseX, mouseY, x, y)<50) {
      x = x + x - mouseX;
      y = y + y - mouseY;
    }

    //=========================================================== MausLinie

    noStroke();
    strokeWeight(5);
    stroke(0, random(100, 200), random(100, 200));
    //fill(random(100), random(200), random(20));
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}



