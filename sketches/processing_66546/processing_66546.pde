
PImage corgi;
PImage lovehim;
PImage drawnhim;
PImage love;
PFont font;
int LbtnX;
int LbtnY;
boolean isLove;
int DbtnX;
int DbtnY;
boolean isDrawn;

void setup(){
  size(1000,600);
  smooth();
  corgi = loadImage("corgi.jpg");
  image(corgi, 0,0,1000,600);
  font = loadFont("01.vlw");
  LbtnX = 400;
  LbtnY = 470;
  DbtnX = 530;
  DbtnY = 470;
  isLove = false;
  isDrawn = false;
  
}

void draw(){
  
  //love
  if (dist(mouseX, mouseY, LbtnX, LbtnY) <= 80) {
    if (dist(mouseX, mouseY, DbtnX, DbtnY) >= 80){
    love = loadImage("love.png");
    image(love, random(-50,1070), random(-50,670), random(80,120), random(80,120));
    fill(255);
    textFont(font,24);
    text("LOVE HIM", 388, 575);}
    else{
      image(corgi, 0, 0, 1000, 600);}

  }else{
    if(dist(mouseX, mouseY, DbtnX, DbtnY) <= 80){
    fill(random(150,200), random(200,255), random(230,255), 100);
    noStroke();
    ellipse(random(-30,1050),random(-30,650), 50,50);
    textFont(font,24);
    fill(255);
    text("DRAWN HIM", 508, 575);
    }else{
    image(corgi, 0,0,1000,600);}
  }
  
  //drawn
 /* if (isDrawn == true) {
    fill(random(150,200), random(200,255), random(230,255), 100);
    noStroke();
    ellipse(random(-30,1050),random(-30,650), 50,50);
    textFont(font,24);
    fill(255);
    text("DRAWN HIM", 508, 575);
  }else{
    image(corgi, 0,0,1000,600);
  }*/
  
  
  lovehim = loadImage("lovehim.png");
  image(lovehim, 400, 470);
  
  drawnhim = loadImage("drawnhim.png");
  image(drawnhim, 530, 470);
  
}


/*
void mouseReleased() {
  if (dist(mouseX, mouseY, LbtnX, LbtnY) <= 80) {  
    if(dist(mouseX, mouseY, DbtnX, DbtnY >=80
    isLove = true;
    isDrawn = false;
  }
  else {
    if(dist(mouseX, mouseY, DbtnX, DbtnY) <=80) {
    isDrawn = true;
    isLove = false;
  }
  }
}
  */

