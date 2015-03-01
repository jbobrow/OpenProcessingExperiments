


Bolas test = new Bolas();
Bolas[] objects = new Bolas[201];
Fall rainTest = new Fall();
Fall[] rain = new Fall[100];

//object orienting programming
//oop
//With what we have learned in class

void setup(){
  smooth();
  size(800,800);
  test.prime(width/2, height/2, 50, 10);
  for(int i=0; i<200; i++){
    objects[i] = new Bolas();
    objects[i].prime(random(0, width), random(0, width), 20, 10);
  }
  rainTest.prime(width/2, height/2, 50, 10);
  for(int i=0; i<99; i++){
    rain[i] = new Fall();
    rain[i].prime(random(0, width), random(0, width), 10, 30);
  }
  
}

void draw(){
 background(0);
 test.update();
 for(int i=0; i<200; i++){
 objects[i].update();
 }
 rainTest.update();
 for(int i=0; i<99; i++){
 rain[i].update();
 }
 
}
class Bolas{

float bigness;
float xPos;
float yPos;
float cVar;

//constructor
void prime(float _xPos, float _yPos, float _bigness, float _cVar){
  cVar = _cVar;
  cVar += random(10, 200);
  xPos = _xPos;
  yPos = _yPos;
  bigness = _bigness;
  bigness += random(-5, 10);
  xPos = width/2 + random (-width/2, width/2);
  yPos = width/2 + random (-width/2, width/2);
}

void update(){
 float speed = random(-1, 1);
  xPos += speed;
  yPos += speed;
 ellipse(xPos, yPos, bigness, bigness);
}

}
class Fall{

float bigness;
float xPos;
float yPos;
float cVar;

//constructor
void prime(float _xPos, float _yPos, float _bigness, float _cVar){
  cVar = _cVar;
  cVar += random(10, 200);
  xPos = _xPos;
  yPos = _yPos;
  bigness = _bigness;
  bigness += random(0, 8);
  xPos = width/2 + random (-width/2, width/2);
  yPos = width/2 + random (-width/2, width/2);
}

void update(){
  float gravity = 1;
  float speed = 1;
  speed += gravity;
  
  xPos += speed/10;
  yPos += speed;
 ellipse(xPos, yPos, bigness, bigness);
}

}


