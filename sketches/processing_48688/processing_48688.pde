
int x=0;
int speed=5;
int j=0;
int ammox=1;
float x1=random(500);
float y1=random(500);
int ammo=11;
int bulletx=0;
int bullety=0;
int bulleet=0;
int score=0;
int wave=0;
int total=1;
int health=1;
int number=1;
void setup(){
  size(500,500);
  background(0);
  smooth();
}
void draw(){
  setup();
  ammox=ammo*10;
  while(ammox>ammo+10){
    rect(ammox,height-20,2,20);
    ammox=ammox-10;
  }
  if(bulleet!=0){
    bullet();
  }
  fill(255);
  j=0;
  while(j<50){
    ellipse(random(width),random(height),5,5);
    j=j+1;
  }
  fill(75,229,25);
  text(score,width-50,height-10);
  ship();
  enemy();
  if(ammo<1){
    fill(0);
    rect(0,0,width,height);
    fill(0,255,0);
    score=score*wave;
    text("game over",200,200);
    text(score,250,250);
    noLoop();
  }
  
}
void ship(){
  noStroke();
  fill(33,108,180);
  rect(x,height-70,50,50);
  rect(x-10,height-90,10,50);
  rect(x+50,height-90,10,50);
  fill(255,0,0);
  rect(x,height-20,50,1);
}
void enemy(){
    fill(0,255,0);
    rect(x1,50,10,10);
    fill(255,0,0);
    rect(x1,60,10,1);
    if(x1<bulletx+10&&x1>bulletx-11&&bullety<61&&bullety>49){
      health=health-1;
      ammo=ammo+1;
      score=score+1;
      if(x1<width-150){
        x1=x1+random(100,200);
      }
      x1=x1-100;
    }
    if(health<0){
      x1=random(50,width-50);
      if(total<5){
        total=total+1;
      }
      ammo=ammo+1;
      wave=wave+1;
      health=total;
    }
}
void keyPressed(){
  if(key=='a'){
    x=x-speed;
  }
  if(key=='s'){
    x=x+speed;
  }
  if(key=='k'){
    bullet();
  }
}
void bullet(){
  if(bulleet<5){
    bulletx=x-5;
    bullety=height-70;
    bulleet=5;
    ammo=ammo-1;
  }
  if(bulleet!=0){
    fill(255,0,0);
    rect(bulletx,bullety,5,10);
    bullety=bullety-10;
  }
  if(bullety<0){
    bulleet=0;
  }
}               
