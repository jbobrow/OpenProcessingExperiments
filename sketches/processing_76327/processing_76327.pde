
PFont font;
PImage car1;
PImage car2;
PImage car3;
PImage photo;
float moveX;
float speedX;
float moveY;
int give = 50;
float enemyX = 100;
float enemyY = 200;
float enemyX2 = 200;
float enemyY2 = 210;
float enemyX3 = 300;
float enemyY3 = 310;
int time = 15;
int timeLast = 0;
int score = 0;
float speedX2;
float speedY2;
float speedY;

void setup(){
  size(500, 400);
  timeLast=second();
  photo = loadImage("web.jpg");
  car1 = loadImage ("ghost.png");
  car2 = loadImage ("ghost.png");
  car3 = loadImage ("ghost.png");
  moveX = 0;
  speedX = 5;
  speedX2 = -5;
  speedY = 5;
  speedY2 = -5;
  moveY = 0;
}
void draw(){
  background(photo);
 if (time>0){
 car();
 }
  if (key=='d') {
  moveX += speedX;}
  if (key=='s'){
  moveY += speedY;}
  if (key=='w'){
  moveY += speedY2;}
  if (key=='a'){
  moveX += speedX2;}
  fill(255);
  rect(moveX, moveY, 20, 20);
  if (moveX<enemyX+give && moveX>enemyX-give) {
  if (moveY<enemyY+give && moveY>enemyY-give) {
        enemyX = random(400,50);
        enemyY = random(50,400);
        score +=1;    
    }
  }   
  
  if (moveX<enemyX2+give && moveX>enemyX2-give) {
  if (moveY<enemyY2+give && moveY>enemyY2-give) {
        enemyX2 = random(400,50);
        enemyY2 = random(50,400);
        score +=1;    
    }
  }   
  
  if (moveX<enemyX3+give && moveX>enemyX3-give) {
  if (moveY<enemyY3+give && moveY>enemyY3-give) {
        enemyX3 = 300;
        enemyY3 = random(50,400);
        score +=1;    
    }
  }  
    fill(255);
    text("SCORE: "+score, 320, 20);
    text("TIMER: "+time, 420, 20); 
 }
 
 void car (){  
    image(car1, enemyX, enemyY, give, give);
    image(car2, enemyX2, enemyY2, give, give);
    image(car3, enemyX3, enemyY3, give, give);
    
    if (second()!=timeLast){
    timeLast=second();
    time-=1;
    }
    fill(255);
    text("SCORE: "+score, 320, 20);
    text("TIMER: "+time, 420, 20);

}

