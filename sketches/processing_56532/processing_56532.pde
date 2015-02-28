
PFont fontA;
int ammoLeft;
float bulletX, bulletY;

int numMissiles = 8;
int numBullets = 10;
int numCities = 4;

Missile[] missile = new Missile[numMissiles];
Bullet[] bullet = new Bullet[numBullets];
City[] city = new City[numCities];

int nextBullet;
String message = "Try and shoot the missiles down before they destroy your cities";

void setup(){
  size(600,400);
  fontA = loadFont("ArialMT-48.vlw");
  textAlign(CENTER);
  textFont(fontA, 12);
  ammoLeft = 100;
  //frameRate(10);
  for(int i = 0; i<numMissiles; i++){
    missile[i] = new Missile();
  }
  for(int i = 0; i<numBullets; i++){
    bullet[i] = new Bullet();
  }
  for(int i = 0; i<numCities; i++){
    city[i] = new City();
    city[i].x = (i*100)+100;
    if(i == 2)city[i].x = 500;
  }
  nextBullet=0;
  noLoop();
}

void cannon(float theta){
  fill(255);
  translate(width/2, height);
  rotate(theta);
  rect(-5, -5, 50, 10);
  ellipse(0,0,50,50);
  rotate(-theta);
  translate(-width/2, -height);

}

void draw() {
  background(100);
  fill(255);
  text(message, width/2,height/2, 100,200);
  int citiesRemaining = 0;
  for(int i = 0; i<numCities; i++){
    if(!city[i].exploded)citiesRemaining++;

  }
  if(citiesRemaining > 0){
    text("ammo", 100,50);
    fill(0);
    rect(50, 50, ammoLeft, 10);

    for(int i = 0; i<numCities; i++){
      city[i].drawCity();
    }

    float theta = atan2(mouseY-height, mouseX-width/2);
    cannon(theta);

    if(mousePressed){
      if(ammoLeft>0){
        bullet[nextBullet].target(mouseX, mouseY, theta);
        bullet[nextBullet].y = height;
        bullet[nextBullet].x = width/2;
        nextBullet++;
        nextBullet = nextBullet%numBullets;
        ammoLeft--;
      }
    }
    for(int i = 0; i<numMissiles; i++){
      missile[i].moveMissile();
      missile[i].drawMissile();
      if(missile[i].exploded){
        for(int j = 0; j< numCities; j++){
          if(hitTest(missile[i].destX, missile[i].destY, city[j].x, city[j].y, missile[i].crater/2)){
            city[j].exploded = true;
          }
        }
      }
    }
    for(int i = 0; i<numBullets; i++){
      bullet[i].moveBullet();
      bullet[i].drawBullet();
      if(bullet[i].explode){
        for(int j = 0; j<numMissiles; j++){
          if(hitTest(bullet[i].destX, bullet[i].destY, missile[j].x, missile[j].y, (bullet[i].crater/2))){
            missile[j].setupMissile();
          }
        }
      }
    }
  }
  else{
    message = "game over. . . "; 
    setup();
    text(message, width/2,height/2);
  }
}

boolean hitTest(float x1, float y1, float x2, float y2, int d){
  float a = x2 - x1;
  float b = y2 - y1;
  if(sqrt((a*a)+(b*b))<(d))return true;
  else return false;

}

void keyPressed(){
  message = "";
  loop();
}


class Bullet {
  float x, destX;
  float y, destY;
  float theta;
  float speed = 40;
  boolean explode;
  int crater;
  Bullet() {
    this.setupBullet();
  }
  void target(float newx, float newy, float t) {
    theta = t;
    destX = newx; 
    destY = newy;
  }
  void setupBullet() {
    x = width/2;
    y = height+100;
    theta = 0;
    explode = false;
    crater = 0;
  }
  void moveBullet() {
    x = x+(speed*cos(theta));
    y = y+(speed*sin(theta));
    if (y<destY)explode = true;
  }
  void drawBullet() {
    if (explode) {
      fill(0);
      stroke(255);
      ellipse(destX, destY, crater, crater);
      crater+=5;
      if (crater>100)
        this.setupBullet();
    }
    else {
      strokeWeight(5);
      float bx = x;
      float by = y;
      for (int i = 0; i<50; i++) {
        stroke(255, 100-i);
        point(bx, by);
        bx = bx-cos(theta);
        by = by-sin(theta);
      }
    }
    strokeWeight(1);
    stroke(255);
  }
}

class City {
  int x; 
  int y = height;
  boolean exploded;
  void drawCity() {
    if (!exploded) {
      stroke(255);
      fill(255);
      rect(x-10, y-50, 10, 50);
      rect(x, y-30, 5, 30);
      rect(x+5, y-60, 10, 60);
      rect(x+15, y-20, 10, 20);
    }
  }
}

class Missile{
  float x, destX;
  float y, destY;
  float speed;
  float theta;
  boolean exploded;
  int crater;
  Missile(){
    this.setupMissile();
  }
  void setupMissile(){
    x = random(0,width);
    y = random(-500,0);
    speed = random(3);
    destX = random(0,width);
    destY = height;
    theta = atan2(destY-y, destX-x);
    exploded = false;
    crater = 0;
  }
  void moveMissile(){
    if(y>height){
      y = height;
      exploded = true;
    }
    else{
      x = x+(speed*cos(theta));
      y = y+(speed*sin(theta));
    }
  }
  void drawMissile(){
    if(exploded){
      if(crater<150){
        ellipse(x,y,crater,crater);
        crater+=5;
      }
      else{
        setupMissile();
      }
    }
    else{
      float mx = x;
      float my = y;
      strokeWeight(3);
      for(int i = 0; i<100; i+=2){
        stroke(255, 100-i);
        point(mx,my);
        mx = mx-cos(theta);
        my = my-sin(theta);
      }
    }
  }
}




