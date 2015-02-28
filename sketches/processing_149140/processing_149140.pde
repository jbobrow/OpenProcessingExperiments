
/* @pjs preload = "buffy.png";"slayer.png";"nulls.png";"graveyard.png";"grr.png";"gentlemen1.png";
"gentlemen1headless.png";"gentlemen2.png";"gentlemen2headless.png";
"gentlemen3.png";"gentlemen3headless.png";"gentlemen4.png";"gentlemen4headless.png"*/
PImage graves;
PImage buffy;
PImage slayer;
PImage argh;
PImage one;
PImage oneHeadless;
PImage nulls;
int sec = 0;

void setup(){
  size(700,700);
  graves = loadImage("graveyard.png");
  buffy = loadImage("buffy.png");
  argh = loadImage("grr.png");
  slayer = loadImage("slayer.png");
  one = loadImage("gentlemen1.png");
  oneHeadless = loadImage("gentlemen1headless.png");
  nulls = loadImage("nulls.png");
  buffy1 = new Buffy(random(width),random(height),5,2);
  argh1 = new Vamp(random(width),random(height),8,1);
  one1 = new Gentlemen(random(width),random(height), 10,6);
  one2 = new Gentlemen(random(width),random(height), 7,4);
  one3 = new Gentlemen(random(width),random(height), 3,6);
}
void draw(){
  image(graves,0,0);
  sec = second();
  if (dist(buffy1.x,buffy1.y,argh1.x,argh1.y)>50){
    buffy1.move();
    buffy1.draw();
    argh1.move();
    argh1.draw();
  } else {
    image(slayer,300,300);
  }
  if (sec <= 30){
    one1.move();
    one1.draw();
    one2.move();
    one2.draw();
    one3.move();
    one3.draw();
  }
  else{
    image(oneHeadless, one1.x, one1.y);
    image(oneHeadless, one2.x, one2.y);
    image(oneHeadless, one3.x, one3.y);
  }
}

class Buffy {
  float x;
  float y;
  float x_speed;
  float y_speed;
   
  Buffy (float CLASS_X,float CLASS_Y,float X_Speed,float Y_Speed){
    x = CLASS_X;
    y = CLASS_Y;
    x_speed = X_Speed;
    y_speed = Y_Speed;
  }
   
  void draw(){
    image(buffy,x,y);
  }
   
  void move(){
    if (x > width || x < 0) {
      x_speed = -x_speed;
    }
    if (y < 150) {
      y_speed += 1;
    }
    if (y > 150) {
      y_speed -= 1;
    }
    x += x_speed;
    y += y_speed;
  }
  void replace(){
    image(nulls,700,700);
  }
}

class Vamp {
  float x;
  float y;
  float x_speed;
  float y_speed;
   
  Vamp (float CLASS_X,float CLASS_Y,float X_Speed,float Y_Speed){
    x = CLASS_X;
    y = CLASS_Y;
    x_speed = X_Speed;
    y_speed = Y_Speed;
  }
   
  void draw(){
    image(argh,x,y);
  }
   
  void move(){
    if (x > width || x < 0) {
      x_speed = -x_speed;
    }
    if (y < 150) {
      y_speed += 1;
    }
    if (y > 150) {
      y_speed -= 1;
    }
    x += x_speed;
    y += y_speed;
  }
  void replace(){
    image(nulls,0,0);
  }
}

class Gentlemen {
  float x;
  float y;
  float x_speed;
  float y_speed;
   
  Gentlemen (float CLASS_X,float CLASS_Y,float X_Speed,float Y_Speed){
    x = CLASS_X;
    y = CLASS_Y;
    x_speed = X_Speed;
    y_speed = Y_Speed;
  }
   
  void draw(){
    image(one,x,y);
  }
   
  void move(){
    if (x > width || x < 0) {
      x_speed = -x_speed;
    }
    if (y < 150) {
      y_speed += 1;
    }
    if (y > 150) {
      y_speed -= 1;
    }
    x += x_speed;
    y += y_speed;
  }
}



