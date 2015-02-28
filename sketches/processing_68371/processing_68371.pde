
PImage maze1;
PImage gameover;
PImage fishboy;
PImage boneonly;
PImage food;
PImage love;
PImage startimage;
float  d = 30;






Fallball myball;

int numballs = 10;
Fallball [] ball = new Fallball [numballs];

float x = 250;
float y = 350;
float speedVar = 2;
float fallRate = random (10);

boolean start=false;


void setup() {
  size(640, 480);
  smooth();
  maze1=loadImage("seamaze1.jpg");
  gameover=loadImage("fishbone.jpg");
  fishboy=loadImage("fishboy.png");
  boneonly=loadImage("fish bone.png");
  food=loadImage("chong1.png");
  love=loadImage("love.jpg");
  startimage=loadImage("start.jpg");

  for (int i = 0; i < ball.length; i++) {
    ball [i] = new Fallball();
    myball = new Fallball ();
  }
}



void draw() {

  background(255);
  
  
 
  image(maze1, 0, 0);

  //  rect(50, 50, 200, 50);
  //  fill(255);
  //  stroke(0);
 

  image(fishboy, mouseX-d/2, mouseY-d/2, d, d);
  //    imageMode(CENTER);

  
  for (int i = 0; i < ball.length; i++) {

    ball[i].fall ();
    //       if (mouseY-fallRate<=d/2+5 && r>=mouseX-d/2  && r<=mouseX+d/2){
    //  d=d+1;}

    if (dist(mouseX, mouseY, ball[i].r, ball[i].fallRate) <= d/2+5) {
      d+=0.5;
    }
    fill (0);
  }
  
  
  if (mouseY+d/2>=432||
    mouseY-d/2<=374&&mouseY+d/2>=286&&mouseX-d/2<=580||
    mouseY-d/2<=230&&mouseY+d/2>=143&&mouseX+d/2>=57
    ||mouseY-d/2<=85) {
    image(gameover, 0, 0);
    image(boneonly, mouseX-d/2, mouseY-d/2, d+15, d-8);}


    if (mouseX>=590 && mouseY>=96&&mouseY<=130) {
      image(love, 0, 0);
    }
  



  
  if(start==false){
   image(startimage,0,0);
  }

}






class Fallball {

  float r = random (640);
  float fallRate = random (-height);

  void fall () {
    fallRate = fallRate + 2;
    fill(10, 200, 180);
    image(food, r, fallRate, 30, 20);

    if (fallRate > height) {
      r = random(600);
      fallRate = random(-200);
    }

    if (frameCount == 600) {
      fallRate = fallRate + 2;
    }
    if (frameCount == 2000) {
      fallRate = fallRate+ 3;
    }

    if (frameCount == 10000) {
      fallRate = fallRate+ 3;
    }
  }
  


}



void mousePressed(){

start=true;

}


