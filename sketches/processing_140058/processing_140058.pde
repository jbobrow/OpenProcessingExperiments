
boolean chase = true;
int numFoes = 50;
int numGoods = 3;
int roundLimit = 100;
int roundIndex = 0;
int fireSpeed = 15; //the smaller the number the faster
int foeSpeed = 2;
int goodSpeed = 2;
int goodRange = 200;
int playerSpeed = 3;
boolean playing = false;

Ship[] foes = new Ship[numFoes];
Ship[] goods = new Ship[numGoods];
Rounds[] rounds = new Rounds[roundLimit];
int x = 250;
int y = 250;
boolean a = false;
boolean w = false;
boolean s = false;
boolean d = false;

void setup(){
  size(600,600);
  
  for(int i = 0; i < numFoes; i++){
    foes[i] = new Ship();
    foes[i].good = false;
    foes[i].x = random(0, width);
    foes[i].y = random(0, height);
    foes[i].angle = random(0,PI);
    foes[i].paint = #FF0000;
    foes[i].speed = foeSpeed;
  }
  
  for(int i = 0; i < numGoods; i++){
    goods[i] = new Ship();
    goods[i].good = true;
    goods[i].x = random(0, width);
    goods[i].y = random(0, height);
    goods[i].angle = random(0,PI);
    goods[i].paint = #00FFFF;
    goods[i].speed = goodSpeed;
  }
  
  
}

void draw(){
  background(0);
  
  for(int i = 0; i < numFoes; i++){
    if (foes[i].active) foes[i].update();
  }
  for(int i = 0; i < numGoods; i++){
    if (goods[i].active) goods[i].update();
  }
    for(int i = 0; i < roundIndex; i++){
    if (rounds[i].active) rounds[i].update();
  }
  
  if(a) x-=playerSpeed;
  if(w) y-=playerSpeed;
  if(d) x+=playerSpeed;
  if(s) y+=playerSpeed;
  
  fill(0, 255, 255);
  if(playing) {
     fill(0, 255, 0);
     ellipse(x,y,15,15);
  }
}

class Ship
{
  float dia = 15;
  float x;
  float y;
  color paint;
  float speed;
  float angle;
  boolean active = true;
  boolean good;
  
  Ship(){
  }
  
  void update(){
    x += cos(angle)*speed;
    y += sin(angle)*speed;
    
    if (x > width) x = 0;
    if (x < 0) x = width;
    if (y > height) y = 0;
    if (y < 0) y = height;
    
    fill(paint);
    ellipse(x,y,dia,dia);
    
    if(good){
      for (int i = 0; i < numFoes; i++){
        if(foes[i].active && dist(x,y, foes[i].x, foes[i].y) < goodRange){
          if (millis()%fireSpeed == 1){
            fire(x,y,foes[i].x,foes[i].y);
          }
          if(chase && y > foes[i].y) angle = atan((x-foes[i].x)/(foes[i].y-y)) - PI/2;
          if(chase && y <= foes[i].y) angle = atan((x-foes[i].x)/(foes[i].y-y)) + PI/2;
          return;
        }
      }
      
      
    } else {
      for(int i = 0; i < roundIndex; i++){
        if(rounds[i].active && dist(x,y,rounds[i].x,rounds[i].y) < dia/2){
          active = false;
          rounds[i].active = false;
          fill(255);
          ellipse(x,y,20,20);
        }
        if(rounds[i].active && dist(x,y,rounds[i].x,rounds[i].y) < dia*3){
          angle *= -1;
        }
      }
    }
  }
}

class Rounds
{
  float dia = 5;
  float x;
  float y;
  color paint;
  float speed = 5;
  float angle;
  boolean active = true;
  
  
  Rounds(){
  }
  
  void update(){
    x += cos(angle)*speed;
    y += sin(angle)*speed;
    
    if (x > width || x < 0 || y < 0 || y > height){
      active = false;
    }
    
    fill(paint);
    ellipse(x,y,dia,dia);
    
    
  }
}

void fire(float x, float y, float tx, float ty){
  if(roundIndex == 99){
    for(int i = 0; i < roundIndex; i++){
      if(!rounds[i].active){
        rounds[i].x = x;
        rounds[i].y = y;
        if(y > ty) rounds[i].angle = atan((x-tx)/(ty-y)) - PI/2;
        if(y <= ty) rounds[i].angle = atan((x-tx)/(ty-y)) + PI/2;
        rounds[i].paint = #0000FF;
        rounds[i].active = true;
        return;
      }
    }
    return;
  }
  rounds[roundIndex] = new Rounds();
  rounds[roundIndex].x = x;
  rounds[roundIndex].y = y;
  if(y > ty) rounds[roundIndex].angle = atan((x-tx)/(ty-y)) - PI/2;
  if(y <= ty) rounds[roundIndex].angle = atan((x-tx)/(ty-y)) + PI/2;
  rounds[roundIndex].paint = #0000FF;
  
  roundIndex++;
}

void mousePressed(){
  if(playing) fire(x,y,mouseX,mouseY);
}

void keyPressed(){
  if(key == 'p') playing = true;
  if(key == 'a') a = true;
  if(key == 'w') w = true;
  if(key == 's') s = true;
  if(key == 'd') d = true;
}

void keyReleased(){
  if(key == 'a') a = false;
  if(key == 'w') w = false;
  if(key == 's') s = false;
  if(key == 'd') d = false;
}
