
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

String letters = "";
String letters0 = "";

float hanabiSize = 2;
String colorType = "colorful";

int letter_lifetime;

ArrayList<Tane> tanes = new ArrayList();
ArrayList<Hanabi> hanabis = new ArrayList();

PGraphics pg;

final float G = 0.02;
final int NUM = 300;

Minim minim;
AudioPlayer player1;
AudioPlayer player2;

void setup()
{
  minim = new Minim(this);
  
  textSize(30);

  player1 = minim.loadFile("fall.mp3");
  player2 = minim.loadFile("hanabi.mp3");

  background(0);
  size(800, 600);

  pg = createGraphics(width/2, height/2, P2D);
  pg.background(0);

  colorMode(HSB, 255);
}

void stop()
{
  // the AudioPlayer you got from Minim.loadFile()
  player1.close();
  // the AudioInput you got from Minim.getLineIn()
  player2.close();
  minim.stop();

  // this calls the stop method that 
  // you are overriding by defining your own
  // it must be called so that your application 
  // can do all the cleanup it would normally do
  super.stop();
}

void draw()
{
  /*
  pg.beginDraw();
   pg.background(0);
   pg.image(get(),0,0,pg.width,pg.height);
   pg.endDraw();
   
   background(0);
   image(pg,0,0,width,height);
   */


  noStroke();
  fill(0, 32);
  rect(0, 0, width, height);

  for (Tane t : tanes) {
    t.update();
    t.draw();
  }

  int i=0;
  while (i< tanes.size ()) {
    Tane t = tanes.get(i);
    if (t.isDead) {
      tanes.remove(i);
      player2.rewind();
      player2.play();
      hanabis.add(new Hanabi(t.x, t.y, t.c));
    }
    else i++;
  }

  for (Hanabi t : hanabis) {
    t.update();
    t.draw();
  }

  i=0;
  while (i< hanabis.size ()) {
    Hanabi t = hanabis.get(i);
    if (t.isDead) {
      hanabis.remove(i);
    }
    else i++;
  }
  
  fill(255);
  text(letters, 100, height-40);
  
  fill(55);
  text("click anywhere as you like", 100, height);

  if (letter_lifetime>0) {
    fill(40, 255, 255, letter_lifetime);
    pushMatrix();
    translate(100, height-40);
    scale(map(letter_lifetime, 255, 0, 1, 1.5));
    text(letters0, 0,0);
    popMatrix();
    letter_lifetime-=4;
  }
}

color getColor() {
  if(colorType.equals("colorful")){
    return color(random(0, 255), 200,  random(200,255));
  }else if(colorType.equals("red")){
    return color(random(-10, 10), 200, random(200,255));
  }else if(colorType.equals("water")){
    return color(random(120, 140), 200, random(200,255));
  }else if(colorType.equals("green")){
    return color(random(60, 80), 200, random(200,255));
  }else if(colorType.equals("purple")){
    return color(random(200, 220), 200, random(200,255));
  }else if(colorType.equals("blue")){
    return color(random(160, 180), 200, random(200,255));
  }else if(colorType.equals("yellow")){
    return color(random(20, 40), 200, random(200,255));
  }
  
  return color(255,255,255);
}

float getHanabiSize() {
  return hanabiSize;
}

void keyPressed() {
  if (key==BACKSPACE && letters.length() > 0) {
    letters = letters.substring(0, letters.length()-1);
  }
  else if (!isLetter() && !isSign()) {
  }
  else {
    letters += key;
  }
  
  keywordCheck();
}

//###############################
//###############################

void  keywordCheck(){
  if(is("red")){
    colorType = "red";
  }else if(is("colorful")){
    colorType = "colorful";
  }else if(is("green")){
    colorType = "green";
  }else if(is("yellow")){
    colorType = "yellow";
  }else if(is("blue")){
    colorType = "blue";
  }else if(is("purple")){
    colorType = "purple";
  }else if(is("water")){
    colorType = "water";
  }else if(Pattern.matches("([0-9].[0-9])", letters)){
    float i = Float.parseFloat(letters);
    hanabiSize = i;
  }else{
    return;
  }
  
  letters0 = letters;
  letters = "";
  letter_lifetime = 255;
}
//###############################


boolean is(String str){
  return letters.equals(str);
}

boolean isLetter() {
  return String.valueOf(key).matches("[0-9a-zA-Z_]+");
}

boolean isSign() {
  return String.valueOf(key).matches("[ -/:-@]+");
}

void mousePressed()
{
  player1.rewind();
  player1.play();
  tanes.add(new Tane(mouseX, height, mouseX, mouseY));
}

class Tane
{
  float x;
  float y;
  float targetX;
  float targetY;

  color c = getColor();

  boolean isDead = false;

  float vy = 4;

  Tane(float _x, float _y, float _targetX, float _targetY) {
    x = _x;
    y = _y;
    targetX = _targetX;
    targetY = _targetY;
  }

  void update() {
    y -= vy;

    vy *= 0.995;

    if (y < targetY) {
      isDead = true;
    }
  }

  void draw() {
    noStroke();
    fill(c);
    rect(x, y, 2, 2);
  }
}

class Hanabi
{
  float x;
  float y;

  color c;

  ArrayList<Fire> fires = new ArrayList();

  boolean isDead = false;

  int lifetime = 100;

  Hanabi(float _x, float _y, color _c) {
    x = _x;
    y = _y;
    c = _c;

    for (int i=0; i<NUM; i++) {
      fires.add(new Fire(x, y, c));
    }
  }

  void update() {
    for (Fire f : fires) {
      f.update();
    }

    lifetime -=1;

    if (lifetime < 0) isDead = true;
  }

  void draw() {
    for (Fire f : fires) {
      f.draw();
    }
  }
}

class Fire
{
  float x;
  float y;
  float vx;
  float vy;

  color c;

  int alpha = 200;

  Fire(float _x, float _y, color _c) {
    x = _x;
    y = _y;
    c = _c;

    vx = random(0, getHanabiSize())*cos(random(0, TWO_PI));
    vy = random(0, getHanabiSize())*sin(random(0, TWO_PI));
  }

  void update() {
    x += vx;
    y += vy;

    alpha -= 2;

    if (alpha < 0) alpha = 0;

    vy += G;
  }

  void draw() {
    noStroke();
    fill(c, alpha);
    rect(x, y, 1, 1);
  }
}


