
final int on = 1;
final int off =0;
int x;
int y;
int etatRectangle;
int etatCer;

void setup() {
  size(400, 400);

  smooth();

  etatRectangle = off;

  etatCer = off;

  x = width/2;
  y = height/2;
//-------------------------------------------------------------------------------
//fait appel aux class et dessine le monstre

  m1 = new Corps(x, y);
  m2 = new Corps(x, y+75);
  m3 = new Corps(x+10, y+75);
  m4 = new Corps(x+20, y+85);
  m5 = new Corps(x+30, y+95);
  m6 = new Corps(x+10, y+95);
  m7 = new Corps(x, y+105);
  m8 = new Corps(x-10, y+95);
  m9 = new Corps(x-20, y+85);
  m10 = new Corps(x-30, y+75);
  m11 = new Corps(x-30, y+85);
  m12 = new Corps(x-40, y+85);
  m13 = new Corps(x-50, y+95);
  m14 = new Corps(x-50, y+85);
  m15 = new Corps(x-60, y+75);
  m16 = new Corps(x-60, y+65);
  m17 = new Corps(x-40, y+55);
  m18 = new Corps(x-30, y+55);
  m19 = new Corps(x-20, y+45);
  m20 = new Corps(x-10, y+45);
  m21 = new Corps(x, y+35);
  m22 = new Corps(x+10, y+45);
  m23 = new Corps(x+20, y+55);
  m24 = new Corps(x+30, y+65);
  m25 = new Corps(x+40, y+45);
  m26 = new Corps(x+50, y+45);
  m27 = new Corps(x-70, y+45);
  m28 = new Corps(x, y+35);
  m29 = new Corps(x, y+15);
  m30 = new Corps(x, y+5);
  m31 = new Corps(x-20, y+35);
  m32 = new Corps(x-20, y+45);
  m33 = new Monster(100, 50);
  m34 = new Monster(150, 50);
  m35 = new Monster(200, 50);
}


Corps m1;
Corps m2;  
Corps m3;
Corps m4; 
Corps m5; 
Corps m6; 
Corps m7; 
Corps m8; 
Corps m9; 
Corps m10; 
Corps m11; 
Corps m12; 
Corps m13; 
Corps m14; 
Corps m15; 
Corps m16; 
Corps m17;
Corps m18; 
Corps m19; 
Corps m20; 
Corps m21; 
Corps m22; 
Corps m23; 
Corps m24; 
Corps m25; 
Corps m26; 
Corps m27; 
Corps m28; 
Corps m29; 
Corps m30; 
Corps m31; 
Corps m32; 
Monster m33;
Monster m34;
Monster m35;

void draw() {
  background(0);
  float x;
  float y;
  x = width/2;
  y = height/2;
  //-------------------------------------------------------------------------------
  // arriere-plan
  background(0);


  //-------------------------------------------------------------------------------
  // tentacules gauche
  fill(255, 100, 100); 
  noStroke();
  ellipse(x - 50, y-100, 25, 25);
  ellipse(x - 50, y-90, 25, 25);
  ellipse(x - 50, y-80, 25, 25);
  ellipse(x - 60, y-70, 25, 25);
  ellipse(x - 70, y-60, 25, 25);
  ellipse(x - 80, y-50, 25, 25);
  ellipse(x - 90, y-40, 25, 25);
  ellipse(x - 90, y-30, 25, 25);
  ellipse(x- 90, y-20, 25, 25);
  ellipse(x - 100, y-10, 25, 25);
  ellipse(x - 95, y, 25, 25);
  ellipse(x - 85, y+10, 25, 25);
  ellipse(x - 75, y+20, 25, 25);
  //-------------------------------------------------------------------------------
  // tentacules centre
  fill(255, 100, 100); 
  ellipse(x, y-100, 25, 25);
  ellipse(x, y-90, 25, 25);
  ellipse(x, y-80, 25, 25);
  ellipse(x, y-70, 25, 25);
  ellipse(x, y-60, 25, 25);
  ellipse(x+10, y-50, 25, 25);
  ellipse(x+20, y-40, 25, 25);
  ellipse(x+10, y-30, 25, 25);
  ellipse(x, y-20, 25, 25);
  //-------------------------------------------------------------------------------
  // tentacules droite
  fill(255, 100, 100); 
  ellipse(x + 50, y-100, 25, 25); 
  ellipse(x + 50, y-90, 25, 25); 
  ellipse(x + 50, y-80, 25, 25); 
  ellipse(x + 60, y-70, 25, 25); 
  ellipse(x + 70, y-60, 25, 25); 
  ellipse(x + 80, y-50, 25, 25); 
  ellipse(x + 70, y-40, 25, 25); 
  ellipse(x + 80, y-30, 25, 25); 
  ellipse(x + 80, y-20, 25, 25); 
  ellipse(x + 90, y-10, 25, 25); 
  ellipse(x + 80, y, 25, 25);
  ellipse(x + 80, y+10, 25, 25);
  ellipse(x + 80, y+20, 25, 25);
  ellipse(x + 70, y+30, 25, 25);
//-------------------------------------------------------------------------------
//permet à l'orbit de suivre la souris


  m1.update(mouseX, mouseY); 
  m2.update(mouseX, mouseY);  
  m3.update(mouseX, mouseY); 
  m4.update(mouseX, mouseY); 
  m5.update(mouseX, mouseY); 
  m6.update(mouseX, mouseY); 
  m7.update(mouseX, mouseY); 
  m8.update(mouseX, mouseY); 
  m9.update(mouseX, mouseY); 
  m10.update(mouseX, mouseY); 
  m11.update(mouseX, mouseY); 
  m12.update(mouseX, mouseY); 
  m13.update(mouseX, mouseY); 
  m14.update(mouseX, mouseY); 
  m15.update(mouseX, mouseY); 
  m16.update(mouseX, mouseY); 
  m17.update(mouseX, mouseY); 
  m18.update(mouseX, mouseY); 
  m19.update(mouseX, mouseY); 
  m20.update(mouseX, mouseY); 
  m21.update(mouseX, mouseY); 
  m22.update(mouseX, mouseY); 
  m23.update(mouseX, mouseY); 
  m24.update(mouseX, mouseY); 
  m25.update(mouseX, mouseY); 
  m26.update(mouseX, mouseY); 
  m27.update(mouseX, mouseY); 
  m28.update(mouseX, mouseY); 
  m29.update(mouseX, mouseY); 
  m30.update(mouseX, mouseY); 
  m31.update(mouseX, mouseY); 
  m32.update(mouseX, mouseY); 
  m33.update(mouseX, mouseY);
  m34.update(mouseX, mouseY);
  m35.update(mouseX, mouseY);

  //-------------------------------------------------------------------------------
  // dégradé pris dans l'exemple du cours
  smooth();

  noStroke();

  float d = width;
  float ratio = 0.9;

  while ( d > 5 ) {

    fill ( 255 - d / width * 100, 100, 100 );
    ellipse(x, y+75, d*0.07, d*0.07);
    ellipse(x+10, y+75, d*0.07, d*0.07);
    ellipse(x+20, y+85, d*0.07, d*0.07);
    ellipse(x+30, y+95, d*0.07, d*0.07);
    ellipse(x+10, y+95, d*0.07, d*0.07);
    ellipse(x, y+105, d*0.07, d*0.07);
    ellipse(x-10, y+95, d*0.07, d*0.07);
    ellipse(x-20, y+85, d*0.07, d*0.07);
    ellipse(x-30, y+75, d*0.07, d*0.07);
    ellipse(x-30, y+85, d*0.07, d*0.07);
    ellipse(x-40, y+85, d*0.07, d*0.07);
    ellipse(x-50, y+95, d*0.07, d*0.07);
    ellipse(x-50, y+85, d*0.07, d*0.07);
    ellipse(x-60, y+75, d*0.07, d*0.07);
    ellipse(x-60, y+65, d*0.07, d*0.07);
    ellipse(x-40, y+55, d*0.07, d*0.07);
    ellipse(x-30, y+55, d*0.07, d*0.07);
    ellipse(x-20, y+45, d*0.07, d*0.07);
    ellipse(x-10, y+45, d*0.07, d*0.07);
    ellipse(x, y+35, d*0.07, d*0.07);
    ellipse(x+10, y+45, d*0.07, d*0.07);
    ellipse(x+20, y+55, d*0.07, d*0.07);
    ellipse(x+30, y+65, d*0.07, d*0.07);
    ellipse(x+40, y+45, d*0.07, d*0.07);
    ellipse(x+50, y+45, d*0.07, d*0.07);
    ellipse(x-70, y+45, d*0.07, d*0.07);
    ellipse(x, y+35, d*0.07, d*0.07);
    ellipse(x, y+15, d*0.07, d*0.07);
    ellipse(x, y+5, d*0.07, d*0.07);
    ellipse(x-20, y+35, d*0.07, d*0.07);
    ellipse(x-20, y+45, d*0.07, d*0.07);
    d = d * ratio;
  }

  //-------------------------------------------------------------------------------
  //bouche
  stroke(0);
  strokeWeight(20);
  line(y-40, y+60, x+20, x+60);
  //-------------------------------------------------------------------------------
  //dents
  stroke(255);
  strokeWeight(7);
  line(y-40, y+60, x+20, x+60);

  stroke(0);
  strokeWeight(2);
  line(x, x+65, y+10, y+55);
  line(x, x+65, y, y+55);
  line(x-10, x+65, y-10, y+55);
  line(x-10, x+65, y, y+55);
  line(x-20, x+65, y-20, y+55);
  line(x-20, x+65, y-10, y+55);
  line(x-30, x+65, y-30, y+55);
  line(x-30, x+65, y-20, y+55);
  line(x-40, x+65, y-40, y+55);
  line(x-40, x+65, y-30, y+55);
  line(x+10, x+65, y+10, y+55);
  line(x+10, x+65, y+20, y+55);
  line(x+20, x+65, y+20, y+55);
  //-------------------------------------------------------------------------------
  //ligne en-dessous de la bouche
  stroke(0);
  strokeWeight(2);
  line(x-35, y+75, y+10, y+75);
  line(x-20, y+80, y, y+80);


  //---------------------------------------------------------------------------
  // bouton pour faire gonfler le monste
  if (etatRectangle == on) {


    ellipseMode(RADIUS);

    fill(0);

    beginShape();

    curveVertex(217.0, 270.0);
    curveVertex(229.0, 287.0);
    curveVertex(153.0, 291.0);
    curveVertex(144.0, 259.0);
    curveVertex(197.0, 239.0);
    curveVertex(242.0, 268.0);
    curveVertex(229.0, 287.0);
    curveVertex(163.0432, 277.85846);
    endShape();
  }
if (etatCer == off) {
  
    m33.leye.MAX_EYE_SIZE = 55;
    m34.leye.MAX_EYE_SIZE = 55;
    m35.leye.MAX_EYE_SIZE = 55;
  }
  
}
//}

//-------------------------------------------------------------------------------
//code pour annimer le montre de facons aléatoire inspiré par Author: David Langly

class Corps
{

  float corpsX;
  float corpsY;
  E leye;



  Corps(int x, int y) {
    corpsX = x;
    corpsY = y;
    leye = new E(50, 50);// taille des yeux
  }

  void update(int mx, int my) {
    leye.update(mx-corpsX, my-corpsY);

    pushMatrix();
    translate(corpsX, corpsY);


    leye.display();// dessine les yeux

    popMatrix();
  }
}


class E
{
  final static int MAX_EYE_SIZE = 55;  //grosseur mx des yeux
  final static int MIN_EYE_SIZE = 45;  //grosseur min des yeux

  final static float MAX_EYE_VELOCITY = 0.5;
  final static float MIN_EYE_VELOCITY = -0.5;

  int ex, ey;
  float size;
  float velocity;
  float angle = 0.0;

  E(int x, int y) {
    ex = x;
    ey = y;   
    size = random(MIN_EYE_SIZE, MAX_EYE_SIZE);
    velocity = random(MIN_EYE_VELOCITY, MAX_EYE_VELOCITY);
  }

  boolean isInside(float mx, float my) {
    float distance = sqrt(sq(ex - mx) + sq(ey - my));
    if (distance <= size)
    {
      return true;
    }
    else
    {
      return false;
    }
  }

  void update(float mx, float my) {
    angle = atan2(my-ey, mx-ex);
    size += velocity;
    if (size > MAX_EYE_SIZE) {
      velocity = -velocity;
    }
    if (size < MIN_EYE_SIZE) {
      velocity = -velocity;
    }
  }

  void display() {
    pushMatrix();
    translate(ex, ey);
    fill(255, 100, 100); 
    noStroke();
    ellipse(-50, -50, size, size);
    popMatrix();
  }
}

class Monster
{
  float monsterX;
  float monsterY;
  public Eye leye;



  Monster(int x, int y) {
    monsterX = x;
    monsterY = y;
    leye = new Eye(50, 50);// taille des yeux
  }

  void update(int mx, int my) {
    leye.update(mx-monsterX, my-monsterY);

    pushMatrix();
    translate(monsterX, monsterY);


    leye.display();// dessine les yeux

    popMatrix();
  }
}

//-----------------------------------------------------------------------------
//code pris sur open processing pour faire bouger les yeux et les faire 
//grossir de facons aléatoire Author: David Langly
class Eye
{

   int MAX_EYE_SIZE = 55;
   int MIN_EYE_SIZE = 45;

  final static float MAX_EYE_VELOCITY = 0.2;
  final static float MIN_EYE_VELOCITY = -0.2;

  int ex, ey;
  float size;
  float velocity;
  float angle = 0.0;

  Eye(int x, int y) {
    ex = x;
    ey = y;   
    size = random(MIN_EYE_SIZE, MAX_EYE_SIZE);
    velocity = random(MIN_EYE_VELOCITY, MAX_EYE_VELOCITY);
  }

  boolean isInside(float mx, float my) {
    float distance = sqrt(sq(ex - mx) + sq(ey - my));
    if (distance <= size)
    {
      return true;
    }
    else
    {
      return false;
    }
  }

  void update(float mx, float my) {
    angle = atan2(my-ey, mx-ex);
    size += velocity;
    if (size > MAX_EYE_SIZE) {
      velocity = -velocity;
    }
    if (size < MIN_EYE_SIZE) {
      velocity = -velocity;
    }
  }

  void display() {
    pushMatrix();
    translate(ex, ey);
    fill(255);
    stroke(0);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(153);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
}

//-------------------------------------------------------------------------------
// fonction qui permet d'avoir une zone carré et ronde pour permet au 
//monstre de grossir


void mousePressed() {


  m33.leye.MAX_EYE_SIZE = 100;
  m34.leye.MAX_EYE_SIZE = 100;
  m35.leye.MAX_EYE_SIZE = 100;

  float distance = dist(mouseX, mouseY, 150, 100);
  if (distance < 50/2) {
    if (etatCer == off) {
      etatCer = on;
    }
    else {
      etatCer = off;
    }
  }

  float distance2 = dist(mouseX, mouseY, 200, 100);
  if (distance2 < 50/2) {
    if (etatCer == off) {
      etatCer = on;
    }
    else {
      etatCer = off;
    }
  }
  float distance3 = dist(mouseX, mouseY, 250, 100);
  if (distance3 < 50/2) {
    if (etatCer == off) {
      etatCer = on;
    }
    else {
      etatCer = off;
    }
  }

  if (mouseX> 75 && mouseX < 290 && mouseY > 125 && mouseY < 325) {

    if ( etatRectangle == off ) {
      etatRectangle = on;
    }
    else {
      etatRectangle = off;
    }
  }
}

//-------------------------------------------------------------------------------
// fonction permettant de revenir à ellipseMode(center);
void mouseReleased() {
  etatRectangle = off;
  {
    ellipseMode(CENTER);
  }

  
}
