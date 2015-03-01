
float [][][] posMouth;
float h = -50;
boolean down = true;

float deltaT = 0.7;
float gravity = 0.9;
float damping = 0.7;

Sphere head, leftEye, rightEye;
Mouth mouth;
Leg [] leg = new Leg[8];
Button b1, b2, b3, b4, b5;
Slider s1= new Slider("flinch", 100, 100, 300, 30, -30, 30, color(200), color(255, 0, 0));

void setup()
{
  size(1500, 1000, P3D);
  head = new Sphere(0, height/3, 0, 200, color(255, 0, 0));
  leftEye = new Sphere(width/15, height/3, 170, 15, color(0));
  rightEye = new Sphere(-width/15, height/3, 170, 15, color(0));
  mouth = new Mouth(0, height*3/8, 230);

  for (int i=0; i<8; i++) 
  {
    leg[i] = new Leg(width/6, height/2, 150, i);
  }
  b1 = new Button("RIGHT", width*9/10, height/2, 50, color(255), color(200), color(255, 0, 0)); 
  b2 = new Button("LEFT", width/25, height/2, 50, color(255), color(200), color(255, 0, 0)); 
  b3 = new Button("LONG", width/2-50, height/25, 50, color(255), color(200), color(255, 0, 0));
  b4 = new Button("SHORT", width/2-50, height*23/25, 50, color(255), color(200), color(255, 0, 0));
  b5 = new Button("HELLO", width-200, height*23/25, 50, color(255), color(255), color(255, 0, 0));
}

void draw()
{
  float t = (float) millis() / 1000;


  background(38, 96, 139);
  lights();

  b1.display(); 
  b2.display(); 
  b3.display();
  b4.display();
  b5.display2();

  s1.display();

  bubbles(t);


  translate(width/2, 50+h, 0);

  if (b1.isPressed()) b1.rightButton();
  if (b2.isPressed()) b2.leftButton();
  if (b3.isPressed()) {
    for (int i=0; i<8; i++)
      leg[i].update();
  } 
  if (b4.isPressed()) { 
    for (int i=0; i<8; i++)
      leg[i].update2();
  }
  if (b5.isPressed()) {
    leg[0].hello();
  }

  head.render();
  mouth.render();
  leftEye.render();
  rightEye.render();

  for (int i=0; i<8; i++) {
    pushMatrix();
    rotateY(radians(i*45));
    leg[i].setVertexPosition();
    leg[i].render();
    popMatrix();
  }



  if (h==50) down = false;
  else if (h==-50) down = true;

  if (down==true) h++;
  else if (down==false) h--;
}

void bubbles(float t)
{
  randomSeed(1000);

  noFill();
  stroke(255, 255, random(200), 50);
  for (int i = 0; i<100; i++)
  {
    float h = random(0.5, 4.1);
    float h2 = random(0.5, 4.1);
    float r = random(5, 50);
    float v = random(6, 45);

    ellipse(random(width)+0.1*cos(h2*(t+h)), random(height)-2*v*t%(height+40), r, r);
  }
}

void mousePressed()
{
  b1.press(); 
  b2.press(); 
  b3.press();
  b4.press();
  b5.press();
}

void mouseReleased()
{
  b1.release(); 
  b2.release(); 
  b3.release();
  b4.release();
  b5.release();
}

void mouseMoved()
{
  b1.over();
  b2.over();
  b3.over();
  b4.over();
  b5.over();
}

void mouseDragged()
{
  s1.slide();
}


class Sphere
{
  float x, y, z;
  float r;
  color c;

  Sphere(float Sx, float Sy, float Sz, float Sr, color Sc)
  {
    x = Sx;
    y = Sy;
    z = Sz;
    r = Sr;
    c = Sc;
  }
  void render()
  {
    pushMatrix();
    translate(x, y, z);
    fill(c);
    noStroke();
    sphere(r);
    popMatrix();
  }
}

class Mouth
{
  float x, y, z;
  float mxp, mzp;
  float r;
  float theta;

  Mouth(float Mx, float My, float Mz)
  {
    x = Mx;
    y = My;
    z = Mz;
    r = 50;
    posMouth = new float [6][37][2];

    for (int j=0; j<5; j++)
    {

      for (int i=0; i<37; i++) 
      {
        theta=i*10;

        mxp = r * cos(radians(theta));
        mzp = r * sin(radians(theta));
        posMouth[j][i][0]= mxp;
        posMouth[j][i][1]= mzp;
      }
    }
  }
  void render()
  {
    pushMatrix();
    translate(x, y, z);
    noStroke();
    rotateX(radians(-90));
    for (int j=0; j<5; j++) 
    {
      beginShape(TRIANGLE_STRIP);
      for (int i=0; i<37; i+=1) 
      {
        vertex( posMouth[j][i][0], j*20, posMouth[j][i][1] );
        vertex( posMouth[j+1][i][0], (j+1)*20, posMouth[j+1][i][1] );
      }
      endShape();
    }
    popMatrix();
  }
}


class Leg
{
  float x, y, z;
  float r;
  float theta;
  float t;
  float d =0;
  float degree = 0;
  PVector[][] vertex;
  int num;
  boolean up=true;

  Leg(float x, float y, float z, int num)
  {
    this.x = x;
    this.y = y;
    this.z = z;
    this.num = num;

    r = 100;

    vertex = new PVector [11][37];
    setVertexPosition();
  }
  void setVertexPosition() 
  {
    r = 100;
    for (int j=0; j<10; j+=1) 
    {
      r-=j*2;
      for (int i=0; i<37; i++) 
      {
        theta=i*10;

        float lxp = r * cos(radians(theta)) * cos(radians(theta+s1.pos())) + 1.5*r; 
        float lyp = j*20 + d * j;
        float lzp = r * sin(radians(theta)) * cos(radians(theta+s1.pos())) - 1.5*r;
        vertex[j][i] = new PVector( - lxp, lyp, lzp );
      }
    }
  }

  void render()
  {
    pushMatrix();
    translate(x, y, z);
    noStroke();
    fill(255, 0, 0);

    //hello degree
    translate(-190, -25, 15);
    rotateZ(radians(degree));
    translate(190, 25, -15);

    for (int j=0; j<10; j++) 
    {
      beginShape(TRIANGLE_STRIP);
      for (int i=0; i<37; i+=1) 
      {
        vertex(vertex[j][i].x, vertex[j][i].y, vertex[j][i].z );
        if (j<9)
          vertex(vertex[j+1][i].x, vertex[j+1][i].y, vertex[j+1][i].z );
      }
      endShape();
    }

    popMatrix();
  }

  void update()
  {
    d+=0.1;
    setVertexPosition();
  }

  void update2()
  {
    d-=0.1;
    setVertexPosition();
  }
  void hello()
  {
    if (degree==-90) up = false;
    else if (degree==0) up = true;

    if (up==true) degree--;
    if (up==false) degree++;

    setVertexPosition();
  }
}





class Button
{

  String name;
  int x, y;
  int size;
  float t1, t2;
  color baseCol;
  color overCol;
  color pressCol; 
  boolean over = false; 
  boolean pressed = false;
  boolean isPressed() {
    return pressed;
  }
  Button(String s, int xp, int yp, int sz, color b, color o, color p) { 
    name = s;
    x=xp;
    y=yp;
    size = sz; 
    baseCol = b; 
    overCol = o; 
    pressCol = p;
    t1=0;
    t2=0;
  }
  void over() {
    if ((mouseX >=x ) && (mouseX <= x+2*size) &&
      (mouseY >= y) && (mouseY <= y+size)) {
      over = true;
    } else {
      over = false;
    }
  }
  void press() { 
    if (over) {
      pressed = true;
      println(name + " button clicked");
    }
  }
  void release() {
    pressed = false;
    t1=0;
    t2=0;
  }
  void display() { 
    if (pressed) {
      fill(pressCol);
    } else if (over) { 
      fill(overCol);
    } else {
      fill(baseCol);
    }
    stroke(255);
    rect(x, y, 2*size, size); 
    textSize(20);
    text(name, x+size-30, y+size-15);
  }
  
  void display2() { 
    if (pressed) {
      fill(pressCol);
    } else if (over) { 
      fill(overCol);
    } else {
      fill(baseCol);
    }
    noStroke();
    beginShape();
    ellipse(x+50, y+25, 4*size, 2*size);
    vertex(x+50, y+20);
    vertex(x+150, y+100);
    vertex(x,y+25);
    endShape();
    textSize(20);
    text(name, x+size-30, y+size-15);
  }

  void rightButton()
  {
    rotateY(radians(t1));
    t1++;
  }
  void leftButton()
  {
    rotateY(radians(t2));
    t2--;
  }
}

class Slider {
  String name;
  int x, y; // position
  int w, h; // width and height 
  float min, max;
  float pos; // current value 
  color baseCol;
  color highlightCol;
  float pos() { 
    return pos;
  }
  Slider(String s, int xp, int yp, int sw, int sh, float mi, float ma, color bc, color hc) { 
    name = s; // name
    x=xp; // x position
    y=yp; // y position
    w = sw; // slide width
    h = sh; // slide height
    min = mi; // min
    max = ma; // max
    baseCol = bc; // base color 
    highlightCol = hc; // highlight 
    pos = (min+max)/2; // default position
  }
  void slide() {
    if ((mouseX >=x ) && (mouseX <= x+w) &&
      (mouseY >= y) && (mouseY <= y+h) ) { 
      pos = map(mouseX, x, x+w, min, max);
    }
  }
  void display() {
    fill(baseCol);
    stroke(255);
    rect(x, y, w, h);
    fill(highlightCol);
    rect(x, y, map(pos, min, max, 0, w), h);
    textSize(20);
    fill(255);
    text(name, x*2+20, y+h*2/3);
  }
} 


