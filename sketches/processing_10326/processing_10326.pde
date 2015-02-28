
PImage target;
PImage first;
PImage gun;
PImage bullet;
PImage gameover;
float speed=2;
int direction=1;
int card= 0;
int bulletX= 1000;
int bulletY= 200;
int x= 500;

void setup() {
  size(480,320);
  smooth();
  target= loadImage("target.png");
  first= loadImage("first-screen.png");
  gun= loadImage("gun.png");
  bullet= loadImage("bullet.png");
  gameover= loadImage("gameover.png");
}

void draw() {
  background (255);
  println(card);
  if (card==0) {
    image(first,0,0);
    if (mousePressed)
      card= 2;
  }



  else if (card==2) {
    background (255);
    image(target,x,35);


    if (x>width) {
      direction= -1;
    } 
    if (x<0){
      direction= 1;
    }
    x+= (speed*direction);
    if (frameCount % 200 ==0){
      speed=random(2,10);
    }
    image(gun, mouseX - gun.width/2,200);
    image(bullet, bulletX,bulletY);
    bulletY -= 50;
    float d = dist(bulletX,bulletY, x+target.width/2, 35+target.height/2 );
    if (d<30){
      card=3;
    }
  }
    else if (card==3){
    background(255);
   image (gameover,50,0); 
   println(mouseX+"    "+ mouseY);
    
  if (mousePressed){
    int left= 316;
    int right=461;
    int top= 150;
    int bottom=300;
    
       if (mouseX > left && mouseX < right && mouseY> top && mouseY < bottom) {
        card = 2;
       }
  }
}
  }

void mousePressed(){

  bulletX = mouseX;
  bulletY=200;


}

   
 
  








