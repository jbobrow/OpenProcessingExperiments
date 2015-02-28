
Alien a;

float redcol;
float bluecol;

void setup(){
  size(800, 700);
  background(255);
  
  a = new Alien();
  
  noStroke();
  fill(40, 90, 155);
  ellipse(width/2, height+100, 600, 600);
  fill(40, 155, 90);
  ellipse(600, 700, 80, 50);//lower right middle
  
  ellipse(300, 650, 50, 60);//top left
  ellipse(310, 620, 60, 50);
  ellipse(280, 630, 40, 40);
  
  ellipse(500, 600, 50, 50);//top right
  ellipse(480, 600, 30, 30);
  ellipse(520, 580, 40, 40);
  ellipse(500, 580, 30, 30);
  
  ellipse(200, 680, 30, 30);//right corner
  ellipse(210, 660, 50, 50);
  ellipse(180, 670, 50, 40);
}

void draw(){
  //background(255);
  a.display();
  a.move();
  
  /*redcol = xpos*4;//changing ball col
  bluecol = ypos*4;*/
  
  PVector loc = a.getLoc();
  if (loc.x > width || loc.y -75 > height) {
     loc.x = -400;
     loc.y = random(100, 200);
    a.setLoc(loc); 
  }
}
class Alien {
  PVector sz;
  PVector loc;
  float speedX;
  float speedY;
  float x;
  float y;
  int w = 150;
  int h = 70;
  float alienRot;
  float alienSpeed;
  float alienSpeed2;

  Alien() {
    init();
  }

  /*Alien(float w, float h) {
    sz = new PVector(w,h);
    init();
  }*/

  Alien(PVector sz) {
    this.sz = sz;
    init();
  }

  void init() {
    loc = new PVector();
    speedX = (float) random(.6, .8);
    speedY = (float) random(-.2, .2);
    alienSpeed2 = speedY;
    alienSpeed = speedX;
  }

  void move() {
    loc.x += speedX;
    loc.y += speedY;
    speedY *= 6*loc.y;
  }

  void display() {

    smooth();

    //eyestick
    stroke(100);
    strokeWeight(0);
    fill(21,191,39);
    rect(loc.x+200,loc.y+99,5,100);
    //white of eye
    strokeWeight(3);
    fill(255);
    ellipse(loc.x+203,loc.y+103,30,30);
    //pink of eye
    strokeWeight(0);
    fill(255,3,163);
    ellipse(loc.x+203,loc.y+103,15,15);
    //pupil of eye
    fill(0);
    ellipse(loc.x+203,loc.y+103,5,5);


    //body of alien
    strokeWeight(2);
    fill(20,242,43);
    ellipse(loc.x+200,loc.y+180,90,90);
    //smile
    strokeWeight(3);
    fill(20,242,43);
    ellipse(loc.x+200, loc.y+150, 30, 13);

    stroke(20,242,43);
    fill(20,242,43);
    ellipse(loc.x+200, loc.y+145, 33, 13);
    
    //UFO  glassbubble
    stroke(255);
    strokeWeight(3);
    fill(196,255,231,50);
    ellipse(loc.x+202,loc.y+155,170,160);
    //UFO
    strokeWeight(3);
    fill(11,4,124);
    ellipse(loc.x+200,loc.y+200,300,75);
    
    //red light
    strokeWeight(0);
    fill(255,0,0);
    ellipse(loc.x+100,loc.y+200,20,20);
    //red light
    strokeWeight(0);
    fill(255,0,0);
    ellipse(loc.x+150,loc.y+200,15,15);
    //red light
    strokeWeight(0);
    fill(255,0,0);
    ellipse(loc.x+200,loc.y+200,20,20);
    //red light
    strokeWeight(0);
    fill(255,0,0);
    ellipse(loc.x+250,loc.y+200,15,15);
    //red light
    strokeWeight(0);
    fill(255,0,0);
    ellipse(loc.x+300,loc.y+200,20,20);
    
    translate(x, y);
    rotate(radians(alienRot));
  }

  void setSz(PVector sz) {
    //this.speedX = speedX;
  }

  PVector getSz() {
    return sz;
  }

  float getSpeedX() {
    return speedX;
  }

  PVector getLoc() {
    return loc;
  }

  void setLoc(PVector inLoc) {
    loc = inLoc;
  }

}



