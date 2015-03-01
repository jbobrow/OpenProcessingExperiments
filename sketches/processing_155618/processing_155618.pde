
PImage monster;
PImage monster2;
PImage monster3;
PImage monster4;
PImage monster5;
PImage monster6;
PImage fireball;
int growing=1;
int grown=0;
int eyes=0;
int changing=0;
int blowing=0;
int f=0;
int s=200/3;
void setup(){
  size(500,500);
  background(255);
  frameRate(10);
  monster=loadImage("data/monster1.png");
  monster2=loadImage("data/monster2.png");
  monster3=loadImage("data/monster3.png");
  monster4=loadImage("data/monster4.png");
  monster5=loadImage("data/monster5.png");
  monster6=loadImage("data/Monster6.png");
  fireball=loadImage("MonsterFireball.png");
}
void draw(){
  background(255);
  smooth();
  if(keyPressed&&key==ENTER){
    blowing=1;
  }
  if(blowing==1){
    f+=5;
  }
  strokeWeight(5);
  stroke(f,0,0);
  fill(0);
  ellipse(250,250,200,300);
  if(keyPressed&&keyCode==DOWN){
    grown=1;
  }
  if(keyPressed&&keyCode==UP){
    grown=0;
  }
  if(grown==1){
    growing++;
  }else{
    growing--;
  }
  if(growing==0){
    growing++;
  }
  background(255);
  if(growing==1){
  image(monster,0,0);
  }
  if(growing==2){
    image(monster2,0,0);
  }
  if(growing==3){
    image(monster3,0,0);
  }
  if(growing==4){
    image(monster4,0,0);
  }
  if(growing==5){
    image(monster5,0,0);
  }
  ellipse(250,250,200,300);
  strokeWeight(1);
  stroke(0);
  fill(255);
  ellipse(200,170,30,10);
  ellipse(300,170,30,10);
  fill(#A905FC);
  if(eyes<20&&changing==1){
    fill(255,25,25);
  }
  if(mousePressed){
    fill(255,25,25);
    changing=1;
  }else{
  if(eyes>20){
  fill(#A905FC);
  changing=0;
  eyes=0;
  }
  }
  if(changing==1){
    eyes++;
    println(eyes);
  }
  ellipse(200,170,10,5);
  ellipse(300,170,10,5);
  fill(50);
  ellipse(250,350,50,20);
  fill(255,0,0);
    if(f>255){
  rect(0,0,500,500);
  }
  frameRate(10);
}



