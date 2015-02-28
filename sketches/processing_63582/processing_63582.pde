
PImage img;
PImage img2;
PImage img3;
PImage img4;

int x=200;
int go=0;
int k=0;

void setup(){
  size(400, 400);
  fill(120, 100, 255);
  smooth();
  strokeWeight(3);
  colorMode(HSB);
  img =loadImage ("LinkRight.png");
  img2 =loadImage ("LinkLeft.png");
  img3 =loadImage ("LinkFront.png");
  img4 =loadImage ("LinkBack.png");
  }

void draw(){
}

void mousePressed(){
background(255);
  if (mouseButton==LEFT){
    Player();
  go+=20;
}

else if(mouseButton==RIGHT){
  Player2();
  go-=20;
}
}
void keyPressed(){
background(255);
  
if (key=='a'){
  Player4();
  x-=10;
  }
  
else if (key=='s'){
  Player3();
    x+=10;
  }
}

void Player(){
for(int i=150;i>0;i=i-15){
  noFill();
  stroke(200, i-70, 200);
  image(img, go, x);
}
}

void Player2(){
for(int i=150;i>0;i=i-15){
  noFill();
  stroke(200, i-70, 200);
  image(img2, go, x);
}
}

void Player3(){
for(int i=150;i>0;i=i-15){
  noFill();
  stroke(200, i-70, 200);
  image(img3, go, x);
}
}

void Player4(){
for(int i=150;i>0;i=i-15){
  noFill();
  stroke(200, i-70, 200);
  image(img4, go, x);
}
}

