
//globaler
boolean record = false;

Bomb bomb;

void setup() {
  frameRate(60);
  size(960, 540);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  bomb = new Bomb();
}

void draw(){
  background(0, 0, 0);

  bomb.display();
  
  if (record == true){
    record();
  }
}

//funktioner
void record(){
  saveFrame("2/output-####.gif");
}

void mousePressed(){
  
  bomb.explode();
  
}

void keyPressed(){
  if (record == false){
  //record = true;
  }else{
     record = false; 
  }
}
class Bomb { //sätter ihop explosion och shards så att så lite kod som möjligt behöver skrivas i "main".
  Explosion[] explosions;
  int numExplosions = 100;
  int currentExplosion = 0;
  
  Bomb(){
    explosions = new Explosion[numExplosions];
  for(int i = 0; i < numExplosions; i++){
    explosions[i] = new Explosion();
  }
  }
  
  void explode(){
    currentExplosion++;
  if(currentExplosion >= numExplosions){
     currentExplosion = 0; 
  }
  explosions[currentExplosion].start();
  }
  
  void display(){
    for(int i = 0; i < numExplosions; i++){
    explosions[i].display();
  }
  }
}

class Explosion {
  Shard[] shards;
  int numShards = 100;
  
  Explosion(){
  shards = new Shard[numShards];
  for(int i = 0; i < numShards; i++){
    shards[i] = new Shard();
  }
  }
  
  void start(){
     for(int i = 0; i < numShards; i++){
    shards[i].start();
  } 
  }
  
  void display(){
   for(int i = 0; i < numShards; i++){
    shards[i].display();
  } 
  }
}

class Shard {
  //det mesta här borde förklara sig själv

  boolean on = false;
  float rotation;
  float rotSpeed;// = 0.2;
  float speed;// = 2;
  float direction;
  float x;
  float y;
  int tid;
  int tidPassed;

  void start() { 
    if (on == false) {
      tid = millis();
      on = true;
      x = mouseX;
      y = mouseY;
      rotSpeed = random(0.1, 0.3);
      speed = random(1.5, 3.5);
      rotation = random(0, TWO_PI);
      direction = random(0, TWO_PI);
    }
  }

  void display() {
    if (on == true) {

      tidPassed = millis() - tid; //det här sjoket fejdar ut bitarna efter en liten stund
      int alpha = int(map(tidPassed, 1500, 2500, 80, 0));
      stroke(0, 0, 100, alpha);

      pushMatrix();
      translate(x, y);    
      rotate(direction);
      pushMatrix();
      rotate(rotation);
      line(-5, 0, 5, 0);
      popMatrix();
      popMatrix();
      update();

      if (millis() - tid >= 2500) { //stänger av efter x millisekunder
        on = false;
      }
    }
  }

  void update() {
    rotation += rotSpeed;
    x += sin(direction)*speed;
    y += cos(direction)*speed;
  }
}



