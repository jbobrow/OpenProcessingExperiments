
int x = 0;
int y = 0;
int balax = 400;
float balay = -10;
boolean atira = false;
float velo = 1;

void setup(){
  size(600,500);
  
}

void draw(){
  smooth();
  background(255,255,0);
  x=mouseX;
  fill(0);
  noStroke();
  triangle(x-10,400,x,380,x+10,400);

  stroke(0);
  strokeWeight(5);
  point(balax,balay);
  balay=balay-velo;
  velo=velo*1.3;
  if(balay < 0){
    atira=false;
  }
}

void mousePressed(){
  if(atira==false){
      atira = true;
      balay = 390;
      balax = x;
      velo=1;
  }
}

