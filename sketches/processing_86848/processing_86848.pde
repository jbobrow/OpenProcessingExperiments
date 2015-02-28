
Dial[] dials = new Dial[20];
int num = 0;
int maxnum = 0;
int LMX = 0;
int LMY = 0;

void setup(){
  size(1024, 720);
  background(255);
  smooth();
  strokeWeight(0.2);
}

void draw(){

  
  fill(255, 98);
  rect(0, 0, width, height);
  PVector temp = new PVector(mouseX, mouseY);
  //noStroke();
  
  float Tdiam = abs(((mouseX - LMX) + (mouseY - LMY) / 2));
  LMX = mouseX;
  LMY = mouseY;
  
  if((mousePressed)&&(mouseButton ==LEFT)){
    dials[num] = new Dial(temp, Tdiam, 0, 0, random(4));
    num +=1;
    num %= 20;
    maxnum +=1;
    if(maxnum>20){
      maxnum = 20;
    }
  }

  for (int i = 0; i< maxnum; i++){
    i %= 20;
    dials[i].display();
  }
  fill(125);
  text("2012: Chris O'Connor", 820, 710);
  
}

class Dial{
  
  PVector pos;
  float diam;
  int init = 0;
  float val;
  float speed;
  
  Dial(PVector _pos, float _diam, int _init, float _val, float _speed){
    
    pos = _pos;
    diam = _diam;
    init = _init;
    val = _val;
    speed = _speed;
  }
  
  
  void display(){
  

  
  if (init ==0){
    
    val += 0.5;
    noFill();
    stroke(20);
    strokeWeight(0.1);
    
    arc(pos.x, pos.y, diam, diam, 0, (val * PI/2));
    arc(pos.x, pos.y, diam-10, diam-10, 0, (val * PI/2));  
    if(val > (PI*2)){
      init = 1;
    }
    pos.y += speed;
    
  }  else{
      float shake = random(100);
      shake = (shake-50)*0.005;
      pos.x += shake;
      shake = random(100);
      shake = (shake-50)*0.005;
      pos.y += shake;
      pos.y += speed;
      speed += 0.3;
      
      noStroke();
      fill((diam*2.55), 80);
      arc(pos.x, pos.y, diam, diam, 0, PI*2); 
      fill((diam*1.27), 80);
      arc(pos.x, pos.y, diam-10, diam-10, 0, PI*2);  
      
  }
  } 
    
}


