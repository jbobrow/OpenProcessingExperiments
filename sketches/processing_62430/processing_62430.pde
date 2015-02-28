
int x=200;
int go=0;
int k=0;

void setup(){
  size(400, 400);
  fill(120, 100, 255);
  smooth();
  strokeWeight(3);
  colorMode(HSB);
}


void draw(){
}

void mousePressed(){
Dabackground();
  if (mouseButton==LEFT){
    Player();
  go+=20;
}

else if(mouseButton==RIGHT){
  Player();
  go-=20;
}
}
void keyPressed(){
Dabackground();
  
if (key=='a'){
  Player();
  x-=10;
  }
  
else if (key=='s'){
  Player();
    x+=10;
  }
}

void Dabackground(){
  noStroke();
    fill(140, 50, 255);
  rect(0, 0, 50, 400);
    fill(120, 50, 255);
  rect(50, 0, 50, 400);
    fill(140, 50, 255);
  rect(100, 0, 50, 400);
    fill(120, 50, 255);
  rect(150, 0, 50, 400);
    fill(140, 50, 255);
  rect(200, 0, 50, 400);
    fill(120, 50, 255);
  rect(250, 0, 50, 400);
    fill(140, 50, 255);
  rect(300, 0, 50, 400);
    fill(120, 50, 255);
  rect(350, 0, 50, 400);
    fill(140, 50, 255);
  rect(400, 0, 50, 400);
}

void Player(){
for(int i=150;i>0;i=i-15){
  noFill();
  stroke(200, i-70, 200);
  ellipse(go, x, i, i);
}
}

