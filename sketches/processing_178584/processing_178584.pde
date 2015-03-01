
Flower [] flower = new Flower[8];
Stem [] stem = new Stem[8];
Particle[] ptc;

Button b1, b2;
Slider s1, s2, s3;

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song1, song2, song3, song4, song5, song6, song7, song8;
FFT fft;

int totalflowers = 0;

boolean pause = false;
boolean isPlaying = false;

ArrayList stars;

void setup()
{
  size(1500, 1000, P3D);
  //noCursor();
  for (int i=0; i<8; i++) 
  {
    flower[i] = new Flower(width/6, height/4, 150, i);
    stem[i] = new Stem(20, 0, 150, i);
  }
  b1 = new Button("     START   ", 190, 400, 50, color(255, 100), color(200), color(255, 100)); 
  b2 = new Button("      STOP   ", 190, 500, 50, color(255, 100), color(200), color(255, 100)); 

  s1 = new Slider("R", 100, 100, 300, 30, 0, 255, color(200), color(255, 0, 0)); 
  s2 = new Slider("G", 100, 200, 300, 30, 0, 255, color(200), color(0, 255, 0)); 
  s3 = new Slider("B", 100, 300, 300, 30, 0, 255, color(200), color(0, 0, 255));

  ptc = new Particle[20];
  for ( int j=0; j<ptc.length; j++) {
    ptc[j] = new Particle(100);
  }
  stars = new ArrayList();
  for (int i = 1; i <= 300; i++)
  {
    stars.add(new star());
  }

  minim = new Minim(this);
  song1 = minim.loadFile("FallingFlower.mp3");
  song2 = minim.loadFile("Ice.mp3");
  song3 = minim.loadFile("Like.mp3");
  song4 = minim.loadFile("IU.mp3");
  song5 = minim.loadFile("JangYoonJeong.mp3");
  song6 = minim.loadFile("Blossom.mp3");
  song7 = minim.loadFile("LeeSooYoung.mp3");
  song8 = minim.loadFile("LeeSeungHwan.mp3");
}

void draw()
{
  frameRate(30);

  background(0);

  b1.display();
  b2.display();

  s1.display();
  s2.display();
  s3.display();

  //base options
  lights();
  translate(width/2, height/2, 10);


  scale(0.7);


  //core
  fill(255, 205, 0);
  drawSphere(width/6-250, height/4-345, 300, 40);

  //stem
  fill(0, 255, 0);
  stem[0].setVertexPosition();
  stem[0].render();


  //flowers
  fill(s1.pos(), s2.pos(), s3.pos());
  if (b1.isPressed())
  {
    
    if (s1.pos()<=127.5 && s2.pos()<=127.5 && s3.pos()<=127.5) song1.loop();
    else if (s1.pos()<=127.5 && s2.pos()<=127.5 && s3.pos()>127.5) song2.loop();
    else if (s1.pos()<=127.5 && s2.pos()>127.5 && s3.pos()<=127.5) song3.loop();
    else if (s1.pos()<=127.5 && s2.pos()>127.5 && s3.pos()>127.5) song4.loop();
    else if (s1.pos()>127.5 && s2.pos()<=127.5 && s3.pos()<=127.5) song5.loop();
    else if (s1.pos()>127.5 && s2.pos()<=127.5 && s3.pos()>127.5) song6.loop();
    else if (s1.pos()>127.5 && s2.pos()>127.5 && s3.pos()<=127.5) song7.loop();
    else if (s1.pos()>127.5 && s2.pos()>127.5 && s3.pos()>127.5) song8.loop();

    fill(s1.pos(), s2.pos(), s3.pos());
  }

  if (b2.isPressed())
  {
    pause = !pause;
    if (pause)
    { 
      song1.pause();
      song2.pause();
      song3.pause();
      song4.pause();
      song5.pause();
      song6.pause();
      song7.pause();
      song8.pause();
    }
  }

  for (int i=0; i<8; i++) 
  {
    pushMatrix();
    rotateX(radians(110));
    rotateY(radians(i*45));
    flower[i].setVertexPosition();
    flower[i].render();
    popMatrix();
  }


  if (isPlaying)
  {
    pushMatrix();
    translate(-width/2, -height/2, 0);
    if (s1.pos()<=127.5 && s2.pos()<=127.5 && s3.pos()<=127.5) for (int i =0; i<ptc.length/5; i++)  ptc[i].song1(color(s1.pos(), s2.pos(), s3.pos()), color(s1.pos(), s2.pos(), s3.pos()), 3, 10, 20);
    else if (s1.pos()<=127.5 && s2.pos()<=127.5 && s3.pos()>127.5) for (int i =0; i<ptc.length/5; i++)   ptc[i].song2();
    else if (s1.pos()<=127.5 && s2.pos()>127.5 && s3.pos()<=127.5) for (int i =0; i<ptc.length/5; i++)  ptc[i].song3(color(s1.pos(), s2.pos(), s3.pos(), random(100, 255)), color(s1.pos(), s2.pos(), s3.pos(), random(100, 255)));
    else if (s1.pos()<=127.5 && s2.pos()>127.5 && s3.pos()>127.5)  for (int i =0; i<ptc.length/5; i++)  ptc[i].song4();
    else if (s1.pos()>127.5 && s2.pos()<=127.5 && s3.pos()<=127.5) for (int i =0; i<ptc.length/5; i++)  ptc[i].song5();
    else if (s1.pos()>127.5 && s2.pos()<=127.5 && s3.pos()>127.5)    for (int i =0; i<ptc.length/5; i++) ptc[i].song6();
    else if (s1.pos()>127.5 && s2.pos()>127.5 && s3.pos()<=127.5)  for (int i =0; i<ptc.length/5; i++)  ptc[i].song7();
    else if (s1.pos()>127.5 && s2.pos()>127.5 && s3.pos()>127.5)   for (int i =0; i<flower.length; i++) {flower[i].song8(); ptc[i].song7();}
    popMatrix();
  }
}
class Button
{
  String name;
  int x, y;
  int size;
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
  }
  void display() 
  { 
    if (pressed) 
    {
      fill(pressCol);
    } else if (over) 
    { 
      fill(overCol);
    } else {
      fill(baseCol);
    }
    stroke(255);
    rect(x, y, size*2.5, size);
    textSize(20);
    text(name, x+size-45, y+size-16);
  }
}
void mousePressed()
{
  b1.press(); 
  b2.press();
  
 if (b1.over) isPlaying = !isPlaying;
 if (b2.over) isPlaying = !isPlaying;

  pause = !pause;
  if (pause)
  { 
    song1.pause();
    song2.pause();
    song3.pause();
    song4.pause();
    song5.pause();
    song6.pause();
    song7.pause();
    song8.pause();
  }
}

void mouseReleased()
{
  b1.release();
  b2.release();
}

void mouseMoved()
{
  b1.over();
  b2.over();
}

void mouseDragged()
{
  s1.slide();
  s2.slide();
  s3.slide();
}
class flower2{
  float centX;
  float centY;
  float color1;
  float speed;
  float radius;

  flower2() {
    radius = random(5, 30);
    centX=random(width); // Start with a random x location
    centY=-radius*4; // Start a little above the window
    speed = random(10, 100); // Pick a random speed
    color1=random(255); // Color
  }


  // Move the flower down
  void move() {
    // Increment by speed
    centY += speed;
  }

  // Check if it hits the bottom
  boolean reachedBottom() {
    // If we go a little beyond the bottom
    if (centY > height + radius*4) {
      return true;
    } else {
      return false;
    }
  }

  // Display the flower
  void display(float t) {
    float opa= map(centY, 0, height, 100, 0);
    float color2= map(centY, 0, height, 0, 255);
    fill(color2, s2.pos(), s1.pos(), opa);
    stroke(20, random(50), 70, random(5, 30));
    strokeWeight(random(0.1, 3));

    float x, y;
    float noiseval = random(1000);
    float radVariance, thisRadius, rad;

    beginShape();
    for (float ang=0; ang<=30*t; ang+=1) {
      noiseval += 0.1;
      radVariance=random(15, 30)*customNoise(noiseval);
      thisRadius = radius+radVariance;
      rad = radians(ang);
      x = centX + (thisRadius * cos(rad));
      y = centY + (thisRadius * sin(rad));
      curveVertex(x, y);
    }
    endShape(CLOSE);
  }
  float customNoise(float value) {
    int count = int(value%5);
    float retValue=pow(sin(value), count);
    return retValue;
  }
}
class Particle //<>//
{
  float gravity;
  float speed;
  float y;
  float [] x = new float[20];
  color c1, c2;

  //for song2 (ice)
  float[] xArray = new float[width/2];
  float[] yArray = new float[1000];
  int initiator = 0;
  float separator = 5;

  //for song4(flower)
  int totalflowers = 0;
  flower2[] flowers = new flower2[400];

  //for song5
  int xspacing = 8;   // How far apart should each horizontal location be spaced
  int w;              // Width of entire wave

  // Start angle at 0
  float amplitude = 175;  // Height of wave
  float period = 500;    // How many pixels before the wave repeats
  float dx;                 // Value for incrementing X, to be calculated as a function of period and xspacing
  float[] yvalues;


  Particle(float speed )
  {
    gravity = 0.98;
    this.speed = speed;
    y = 0;
  }

  void song1(color c1, color c2, float sz, float sz2, float s)
  {
    for (int i =0; i<20; i++)
    {
      x[i] = random(width);
      ellipseMode(CENTER);
      ellipse(x[i], y, sz, sz2);
      fill(c1);
      line(x[i], y, x[i], y-20);
      stroke(c2);
      y = y+ speed + gravity;

      if (y>height)
      {
        y = -50;
        speed = s;
      }
    }
  }

  void song2()
  {
    noStroke();
    fill(203, 236, 255);
    for (int i =0; i<1; i++)
    {
      x[i] = random(width);
      ellipse(x[i], random(height), 20, 20);
    }
  }

  void song3(color c1, color c2)
  {
    for (int i =0; i<1; i++)
    {
      x[i] = random(width);

      fill(c1);
      beginShape();
      vertex(22+x[i], 20+y);
      vertex(22+x[i], 21+y);
      vertex(21+x[i], 23+y);
      curveVertex(21+x[i], 23+y);
      curveVertex(20+x[i], 23+y);
      curveVertex(13+x[i], 24+y);
      curveVertex(10+x[i], 32+y);
      curveVertex(12+x[i], 40+y);
      curveVertex(11+x[i], 43+y);
      curveVertex(8+x[i], 44+y);
      curveVertex(12+x[i], 44.5+y);
      curveVertex(20+x[i], 42+y);
      curveVertex(25+x[i], 38+y);
      curveVertex(27+x[i], 33+y);
      curveVertex(26+x[i], 28+y);
      curveVertex(22.5+x[i], 24+y);
      curveVertex(22.5+x[i], 24+y);
      vertex(23+x[i], 21.5+y );
      endShape(CLOSE);

      //stroke(c2);
      y = y+ random(3*(speed + gravity));

      if (y>height)
      {
        y = -50;
        speed = 5;
      }
    }
  }

  void song4()
  {
    flowers[totalflowers] = new flower2();
    totalflowers++ ;
    if (totalflowers >= flowers.length) {
      totalflowers = 0; //Start over
    }

    // Move and display drops
    for (int i = 0; i < totalflowers/2; i++ ) {
      flowers[i].move();
      flowers[i].display(1);
    }
  }

  void song5()
  {
    flowers[totalflowers] = new flower2();
    totalflowers++ ;
    if (totalflowers >= flowers.length) {
      totalflowers = 0; //Start over
    }

    // Move and display drops
    for (int i = 0; i < totalflowers/2; i++ )
    {
      flowers[i].move();
      flowers[i].display(12);
    }
  }

  void song6()
  {
    frameRate(10);
    rotate(radians(random(-27, 27)));
    y++;
    for (int i =0; i<ptc.length/20; i++)  ptc[i].song1(color(s1.pos(), s2.pos(), s3.pos()), color(s1.pos(), s2.pos(), s3.pos()), 20, 50, 1);
  }

  void song7()
  {
    for (int i = 0; i <= stars.size ()-1; i++) {
      star starUse = (star) stars.get(i);
      starUse.display();
    }
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
    highlightCol = hc; // highlight color 
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
    stroke(0);
    rect(x, y, w, h);
    fill(highlightCol);
    rect(x, y, map(pos, min, max, 0, w), h);
    textSize(15);
    fill(255);
    text(name, x-30, y+h/2);
    text(nf(min, 0, 0), x-10, y+h+20);
    text(nf(max, 0, 0), x+w-10, y+h+20); 
    text(nf(pos, 0, 0), map(pos, min, max, x, x+w), y-5);
  }
}
class Flower
{
  float x, y, z;
  float r;
  float theta;
  float degree = 0;
  PVector[][] vertex;
  int num;
  boolean up=true;

  Flower(float x, float y, float z, int num)
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
    r = 110;
    for (int j=0; j<10; j+=1) 
    {
      r-=j*2;
      for (int i=0; i<37; i++) 
      {
        theta=i*10;

        float lxp = r * cos(radians(theta)) * cos(radians(5*theta+100)) + 1.5*r; 
        float lyp = j*20;
        float lzp = r * sin(radians(theta)) * cos(radians(5*theta+100)) - 1.5*r;
        vertex[j][i] = new PVector( - lxp, lyp, lzp );
      }
    }
  }

  void render()
  {
    pushMatrix();
    translate(x, y, z);
    noStroke();


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

  void select()
  {
    if (degree==-50) up = false;
    else if (degree==20) up = true;

    if (up==true) degree--;
    if (up==false) degree++;
    setVertexPosition();
  }
  
  void song8()
  {
    stroke(1);
    rotate(radians(random(300)));
    z--;
    x--;
    y--;
  }
}
void drawSphere(float x, float y, float z, float r)
{
  pushMatrix();
  noStroke();
  translate(x, y, z);
  sphere(r);
  popMatrix();
}
class star 
{
  int xPos, yPos, starSize;
  float flickerRate, light;
  boolean rise;
  star() 
  {
    flickerRate = random(2, 5);
    starSize = int(random(2, 5));
    xPos = int(random(width - starSize));
    yPos = int(random(height - starSize));
    light = random(10, 245);
    rise = true;
  }
  void display() 
  {
    if (light >= 245) 
    {
      rise = false;
    }
    if (light <= 10) 
    {
      flickerRate = random(2, 5);
      starSize = int(random(5, 10));
      rise = true;
      xPos = int(random(width- starSize));
      yPos = int(random(height - starSize));
    }
    if (rise == true) 
    {
      light += flickerRate;
    }
    if (rise == false) 
    {
      light -= flickerRate;
    }
    fill(light);
    
    ellipse(xPos, yPos, starSize, starSize);
  }
}
class Stem
{
  float x, y, z;
  float r;
  float theta;
  float degree = 0;
  PVector[][] vertex;
  int num;

  Stem(float x, float y, float z, int num)
  {
    this.x = x;
    this.y = y;
    this.z = z;
    this.num = num;

    r = 100;

    vertex = new PVector [31][37];
    setVertexPosition();
  }
  void setVertexPosition() 
  {
    r = 10;
    for (int j=0; j<30; j+=1) 
    {
      r-=j/20;
      for (int i=0; i<37; i++) 
      {
        theta=i*10;

        float lxp = r * cos(radians(theta));
        float lyp = j*25;
        float lzp = r * sin(radians(theta));
        vertex[j][i] = new PVector( - lxp, lyp, lzp );
      }
    }
  }

  void render()
  {
    pushMatrix();
    translate(x-15, y-80, z+150);
    noStroke();

    //hello degree
    translate(-190, -25, 15);
    rotateZ(radians(degree));
    translate(190, 25, -15);

    for (int j=0; j<30; j++) 
    {
      beginShape(TRIANGLE_STRIP);
      for (int i=0; i<37; i+=1) 
      {
        vertex(vertex[j][i].x, vertex[j][i].y, vertex[j][i].z );
        if (j<25)
          vertex(vertex[j+1][i].x, vertex[j+1][i].y, vertex[j+1][i].z );
      }
      endShape();
    }
    popMatrix();
  }
}


