
Monstre m;
Monstre m2;
Monstre m3;
Arbre a;
Arbre a2;
Arbre a3;
Arbre a4;
Arbre a5;
Nubol n;
Nubol n2;
Nubol n3;
Nubol n4;

void setup() {

  size(900, 500);
  m = new Monstre (width/2, height/2, 90, 90, 60, 250);
  m2 = new Monstre (300, 350, 90, 90, 40, 50);
  m3 = new Monstre (580, 220, 90, 90, 90, 220);
  a = new Arbre (200, height/2+50, 20, 150);
  a2 = new Arbre (425, height/2+100, 40, 130);
  a3 = new Arbre (700, height/2+200, 30, 160);
  a4 = new Arbre (50, height/2+225, 50, 120);
  a5 = new Arbre (820, height/2+80, 25, 120);
  n = new Nubol (0, height/3,0.9, 75);
  n2 = new Nubol (500, 50, 0.5, 50);
  n3 = new Nubol (100, 75, 0.75, 40);
  n4 = new Nubol (50, 20, 0.35, 56);
  night = false;
}


void draw() {

  dibuixafons();
  sol();
  n2.run();
  n3.run();
  n4.run();
  pintura();
  a.run();
  a2.run();
  a5.run();
  m3.run();
  m2.run();
  m.ales();
  m.run();
  m.posicio();
  a3.run();
  a4.run();
  n.run();
  pilotacursor();
}

void pilotacursor() {
  noCursor();
  if (night) {
    fill(100, 0, 0);
    ellipse(mouseX, mouseY, 30, 30);
  }
  else {
    fill(200, 0, 0);
    ellipse(mouseX, mouseY, 30, 30);
  }
}
void mousePressed() {

  if (mouseX<pintx+pintsz/2 && mouseX>pintx-pintsz/2 && mouseY<pinty+pintsz/2 && mouseY>pinty-pintsz/2) {
    m.colour= random(0, 255);
    m2.colour=random(0, 255);
    m3.colour=random(0, 255);
  }
}

public class Arbre {
  float ampl, alt, arX, arY;

  public Arbre(float x, float y, float sizex, float sizey) {

    arX=x;
    arY=y;
    ampl=sizex;
    alt=sizey;
  }

  void run() {
    dibuix();
  }

  void dibuix() {
    if (night) {
      fill(10, 0, 0);
      rectMode(CENTER);
      rect(arX, arY-alt/2, ampl, alt);
      //triangle(myX+ampl/2
      rectMode(CORNER);
      fill(0, 50, 0);
      ellipse(arX, arY-alt, ampl*4.5, ampl*4);
    }
    else {
      fill(160, 100, 0);
      rectMode(CENTER);
      rect(arX, arY-alt/2, ampl, alt);
      //triangle(myX+ampl/2
      rectMode(CORNER);
      fill(0, 200, 0);
      ellipse(arX, arY-alt, ampl*4.5, ampl*4);
    }
  }
  
}

void dibuixafons() {
  if (night) {
    background(0, 40, 75);
    fill(0, 50, 0);
    rect(0, height/2, width, height);
  }
  else {
    background(0, 230, 255);
    fill(0, 200, 0);
    rect(0, height/2, width, height);
  }
}

public class Monstre {

  float myX, myY, vx, vy;
  int sz;
  float colour;
  float cont=70;
  float contales=20;

  public Monstre (float _x, float _y, float _vx, float _vy, int _sz, float col) {
    myX=_x;
    myY=_y;
    vx=_vx;
    vy=_vy;
    sz= _sz;
    colour=col;
  }
  void run() {

    dibuix();
    
  }
  void dibuix() {
    color verd=color(200, colour, 10);

    if (night) {
      verd= color(50, 50, 0);
    }
    else if (mousePressed && mouseX<myX+sz/2 && mouseX>myX-sz/2 && mouseY<myY+sz/2 && mouseY>myY-sz/2) {
      verd= color(255, 100, 230);
    }
    if (mouseX>myX) {
      fill(0);
      rectMode(CENTER);
      rect(myX-sz/4, myY+sz/2, sz/8+1, sz/4+1, sz/8, sz/8, sz/8, sz/8);
      rect(myX, myY+sz/2, sz/8+1, sz/4+1, sz/8, sz/8, sz/8, sz/8);
      rectMode(CORNER);
      rect(myX, myY, -sz/2, sz/2, 0, 0, sz/8, sz/8);
      ellipse(myX, myY, sz, sz);
      fill(verd);
      noStroke();
      rectMode(CENTER);
      rect(myX-sz/4, myY+sz/2, sz/8+1, sz/4+1, sz/8, sz/8, sz/8, sz/8);
      rect(myX, myY+sz/2, sz/8+1, sz/4+1, sz/8, sz/8, sz/8, sz/8);
      rectMode(CORNER);
      rect(myX, myY, -sz/2, sz/2, 0, 0, sz/8, sz/8);
      ellipse(myX, myY, sz, sz);
      //boca amb moviment
      strokeWeight(5);
      if (cont<35) { 
        fill(0);
        bezier(myX, myY, myX, myY+sz/2, myX+sz/2, myY+sz/2, myX+sz/2, myY);
      } 
      else if (cont<70) {
        stroke(0);
        line(myX, myY, myX+sz/2, myY);
      } 
      else if (cont==70) {
        cont=0;
      }
      cont++;
      strokeWeight(2);
      //ojos
      stroke(0);
      fill(255);
      ellipse(myX-sz/8, myY-sz/4, sz/3, sz/3);
      fill(0);
      ellipse(myX-sz/8, myY-sz/4, sz/10, sz/10);
      strokeWeight(5);
      /* //corretja
       line(mouseX,mouseY,myX-sz/2,myY);
       
       line(myX-sz/2,myY,myX+sz/4,myY+sz/2);*/
    } 
    else {
      fill(0);
      rectMode(CENTER);
      rect(myX+sz/4, myY+sz/2, sz/8+1, sz/4+1, sz/8, sz/8, sz/8, sz/8);
      rect(myX, myY+sz/2, sz/8+1, sz/4+1, sz/8, sz/8, sz/8, sz/8);
      rectMode(CORNER);
      rect(myX, myY, sz/2, sz/2, 0, 0, sz/8, sz/8);
      ellipse(myX, myY, sz, sz);
      fill(verd);
      noStroke();
      rectMode(CENTER);
      rect(myX+sz/4, myY+sz/2, sz/8+1, sz/4+1, sz/8, sz/8, sz/8, sz/8);
      rect(myX, myY+sz/2, sz/8+1, sz/4+1, sz/8, sz/8, sz/8, sz/8);
      rectMode(CORNER);
      rect(myX, myY, sz/2, sz/2, 0, 0, sz/8, sz/8);
      ellipse(myX, myY, sz, sz);
      //boca amb moviment
      strokeWeight(5);
      if (cont<35) { 
        fill(0);
        bezier(myX, myY, myX, myY+sz/2, myX-sz/2, myY+sz/2, myX-sz/2, myY);
      } 
      else if (cont<70) {
        stroke(0);
        line(myX, myY, myX-sz/2, myY);
      } 
      else if (cont==70) {
        cont=0;
      }
      cont++;
      strokeWeight(2);
      //ojos
      stroke(0);
      fill(255);
      ellipse(myX+sz/8, myY-sz/4, sz/3, sz/3);
      fill(0);
      ellipse(myX+sz/8, myY-sz/4, sz/10, sz/10);

      strokeWeight(5);
    
    }
  }
  void posicio() {
    float distanceX = mouseX-myX;
    float distanceY = mouseY-myY;

    // vx y vy son inversament proporcional a la velocitat que es moura el monstre (per a vx mes gran, es mourà mes lent)
    myX += distanceX/vx;
    myY += distanceY/vy;
  }
  void ales() {
    color verd=color(200, colour, 10);
    strokeWeight(1);
    if (night) {
      verd= color(50, 50, 0);
    }
    else if (mousePressed && mouseX<myX+sz/2 && mouseX>myX-sz/2 && mouseY<myY+sz/2 && mouseY>myY-sz/2) {
      verd= color(255, 100, 230);
    }
    fill(verd);
    if (mouseX>myX) {
      if (contales<10) {
        quad(myX-sz/2, myY, myX-76, myY+20, myX-59, myY+53, myX-30, myY+66);
      }
      else if (contales<20) {
        quad(myX-sz/2, myY, myX-76, myY-20, myX-59, myY-53, myX-30, myY-66);
      }
      else if (contales==20) {
        contales=0;
      }
      ++contales;
    }
    else {
      if (contales<10) { 
        quad(myX+sz/2, myY, myX+76, myY+20, myX+59, myY+53, myX+30, myY+66);
      }
      else if (contales<20) {
        quad(myX+sz/2, myY, myX+76, myY-20, myX+59, myY-53, myX+30, myY-66);
      }
      else if (contales==20) {
        contales=0;
      }
      ++contales;
    }
    strokeWeight(5);
  }
}

public class Nubol {

  float nubx, nuby, nubv;
  int nubsz;

  public Nubol (float x, float y, float v, int siz) {
    nubx=x;
    nuby=y;
    nubv=v;
    nubsz= siz;
  }
  void run() {
    velocitat();
    dibuixnubol();
    limits();
  }
  void dibuixnubol() {
    
    if (night){
     
    }
    else{ 
    noStroke();
    fill(255);
    ellipse(nubx, nuby, nubsz, nubsz);
    ellipse(nubx+nubsz/2, nuby, nubsz*1.5, nubsz*0.75);
    ellipse(nubx-nubsz/2, nuby, nubsz*1.5, nubsz*0.75);
    stroke(0);
    }
}

void velocitat(){
  nubx=nubx+nubv;
  
}
void limits(){
  if(nubx>width){
    nubx=0;
  }
}
}


float x=680;
float y=100;
float sunsz=60;
int sunm=40;

boolean night;

void sol() {
  if (night) {
    noStroke();
    fill(247, 255, 160);
    ellipse(x, y, sunsz, sunsz);
    stroke(0);
  }
  else {
    fill(255, 255, 0);
    noStroke();
    ellipse(x, y, sunsz, sunsz);
    if (sunm<20) { 
      triangle(x, y-1.1*sunsz, x-sunsz/4, y-1.3*sunsz/2, x+sunsz/4, y-1.3*sunsz/2);
      triangle(x, y+1.1*sunsz, x-sunsz/4, y+1.3*sunsz/2, x+sunsz/4, y+1.3*sunsz/2);
      triangle(x-1.1*sunsz, y, x-1.3*sunsz/2, y-sunsz/4, x-1.3*sunsz/2, y+sunsz/4);
      triangle(x+1.1*sunsz, y, x+1.3*sunsz/2, y-sunsz/4, x+1.3*sunsz/2, y+sunsz/4);
    } 
    else if (sunm<40) {
      triangle(x-2.5*sunsz/3, y-2.5*sunsz/3, x-2*sunsz/3, y-sunsz/3, x-sunsz/3, y-2*sunsz/3);
      triangle(x+2.5*sunsz/3, y-2.5*sunsz/3, x+2*sunsz/3, y-sunsz/3, x+sunsz/3, y-2*sunsz/3);
      triangle(x+2.5*sunsz/3, y+2.5*sunsz/3, x+2*sunsz/3, y+sunsz/3, x+sunsz/3, y+2*sunsz/3);
      triangle(x-2.5*sunsz/3, y+2.5*sunsz/3, x-2*sunsz/3, y+sunsz/3, x-sunsz/3, y+2*sunsz/3);
    } 
    else if (sunm==40) {
      sunm=0;
    }
    ++sunm;

    stroke(0);
  }
}

void mouseClicked(){
  if (mouseX<x+sunsz/2 && mouseX>x-sunsz/2 && mouseY<y+sunsz/2 && mouseY>y-sunsz/2) {
     night = !night;
  }
}


float pintx=500;
float pinty=400;
float pintsz=60;

void pintura() {
  if (night) {
    fill(155);
    rectMode(CENTER);
    rect(pintx, pinty, 2*pintsz/3, pintsz);
    fill(155, 50, 0);
    rect(pintx, pinty+pintsz/4, 2*pintsz/3, pintsz/10);
    rect(pintx, pinty-pintsz/4, 2*pintsz/3, pintsz/10);
    fill(50);
    textSize(12);
    text("PAINT", pintx-pintsz/3.5, pinty+pintsz/10);
    rectMode(CORNER);
  }
  else {
    fill(255);
    rectMode(CENTER);
    rect(pintx, pinty, 2*pintsz/3, pintsz);
    fill(255, 100, 50);
    rect(pintx, pinty+pintsz/4, 2*pintsz/3, pintsz/10);
    rect(pintx, pinty-pintsz/4, 2*pintsz/3, pintsz/10);
    fill(150);
    textSize(12);
    text("PAINT", pintx-pintsz/3.5, pinty+pintsz/10);
    rectMode(CORNER);
  }
}



