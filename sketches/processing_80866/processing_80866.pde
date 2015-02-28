
Boy myBoy; //Boy Object
Mountain myMountain; //Mountain Object
Star[] star = new Star[150]; //Star array
Sand[] sand = new Sand[60]; //Sand array
Cactus[] cactus = new Cactus[2]; //Cactus array
Footstep[] footstep = new Footstep[100]; //Footstep array

void setup() {
  size (800, 600);

  //intialize arrays and objects

  myMountain = new Mountain();

  for (int i = 0; i<cactus.length; i++) {
    cactus[i] = new Cactus();
  }

  myBoy = new Boy(width/3, height*2/3);

  for ( int i = 0; i <sand.length; i++) {
    sand[i] = new Sand();
  }

  for (int i = 0; i < footstep.length; i++) {
    footstep[i] = new Footstep();
  }

  for (int i = 0; i < star.length; i++) {
    star[i] = new Star();
  }

  smooth();
}

void draw() {

  //Paint background, declare and initialize sunSpeed variable
  int sunSpeed = second();
  background(224-sunSpeed*3, 254-sunSpeed*3, 255-sunSpeed*3);

  //Draw the Sun
  drawSun();

  //Move and Display the Star array
  for (int i = 0; i < star.length; i++) {
    star[i].move();
    star[i].display();
  }

  //Move and Display Mountain object
  myMountain.move();
  myMountain.display();

  //Draw the Road
  drawRoad();

  //Move and Display the Sand array
  for (int i = 0; i < sand.length; i++) {
    sand[i].move();
    sand[i].display();
  }

  //Move and Display the Cactus array
  for (int i = 0; i < cactus.length; i++) {
    cactus[i].move();
    cactus[i].display();
  }

  //Move and Display the Footstep array
  for (int i = 0; i < footstep.length; i+=3) {
    footstep[i].move();
    footstep[i].display();
  }

  //Display and Light the Boy
  myBoy.display();
  myBoy.light();
}

class Boy {

  float x;
  int y;
  float trans;
  float lightTrans;

  Boy (int tempX, int tempY) {

    x = tempX;
    y = tempY;
    trans = 255;
    lightTrans = 0;
  }

  void display() {

    rectMode(CENTER);
    ellipseMode(CENTER);
    noStroke();
    
    //Shadow
    int sunSpeed = second();
    fill(0,0,0,100 - sunSpeed*2);
    ellipse(x+3,y+120, 100,50);
    
    //Boy's Shape
    fill (181, 220, 252, trans);
    rect(x, y + 80, 50, 100);
    ellipse(x+10, y, 100, 100);
  }

  void light() {


    rectMode(CENTER);
    ellipseMode(CENTER);

    noFill();
    stroke(255, lightTrans/10);
    rect(x, y + 10, 5, 10);
    ellipse(x, y, 10, 10);
  }
}

class Cactus{
  
  color c;
  float x;
  float y;
  float speed;
  
  Cactus(){
    
    c = color(88,208,38);
    x = random(0,width);
    speed = 1;
    y = random(410,450);
  }
  
  void display(){
    int sunSpeed = second();
    fill(0,0,0,100 - sunSpeed*2);
    ellipse(x,y+50,80,20);
    
    noStroke();
    fill(c);
    rect(x,y,50,100);
  }
  
  void move(){
    x -= speed;
    if (x+50 < 0) {
      x = width + random(25,50);
      y = random (410,450);
    }
  }
}
class Footstep{
  
  float x;
  float y;
  float speed;
  
  Footstep(){
    x = random(width/3);
    speed = 1;
    y = random(height*2/3-2,height*2/3-2);
  }
  
  void display(){
    noStroke();
    fill(240,219,152);
    ellipse(x,y+125,8,3);
    ellipse(x-5,y+130,8,3);
  }
  
  void move(){
    x-=speed;
    if(x<-5) x = width/3-10;
  }
}
class Mountain {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Mountain() {
    c = color(234,228,170);
    xpos = width*2/3;
    ypos = 400;
    xspeed = 0.5;
  }
  
  void display(){
    noStroke();
    fill(c);
    triangle(xpos,ypos,xpos+150,ypos-200,xpos+300,ypos);
  }
  
  void move(){
    xpos = xpos - xspeed;
    if (xpos+300 < 0){
      xpos = width;
    }
  }
}
void drawRoad() {
  noStroke();
  int c = color(255,248,180);
  fill(c);
  //rectMode(CENTER);
  rect(0,height,width*2,400); //Rough Draft of Road
}
class Sand{
  
  float x;
  float y;
  float speed;
  
  Sand(){
    x = random(0,width);
    speed = 1;
    y = random(410,590);
  }
  
  void display(){
    
    noStroke();
    fill(222,192,94);
    rect(x,y,3,3);
  }
  
  void move(){
    x-=speed;
    if (x<0-10) x = width+10;
  }
}
class Star{
  float x;
  float y;
  float speed;
  float opac;
  int sunSpeed;
  
  Star(){
    
    x = random(0,width);
    y = random(0,400);
    speed = 0.1;
    opac = 60;
    sunSpeed = second();
  }
  
  void display(){
    
    noStroke();
    fill(255,255,255,opac);
    ellipse(x,y,3,3);
  }
  
  void move(){
    x-=speed;
    if(x<0-3) x = width+3;
  }
  
}
void drawSun() {
  int sunSpeed = second();
  noStroke();
  fill(251, 255, 105);
  ellipseMode(CENTER);
  ellipse(width/5, -120 + sunSpeed * 12, width/15, width/15);

  //glow/radiance around the sun
  float i=1;
  while (true) {
    fill(251, 255, 105, 16-i);
    ellipse(width/5, -120 + sunSpeed * 12, i*width/30, i*width/30);
    i = i+0.3;
    if (i>11) break;
  }
}


