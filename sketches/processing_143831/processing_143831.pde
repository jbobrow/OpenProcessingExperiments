
Catcher myCatcher;
Spider[] mySpider;

// A boolean to let us know if the game is over
boolean gameOver = false;
 
 int score = 0;
 int lives = 0; //allowed to miss 10 spiders before game over
 PFont f;
 
void setup(){
size(1000, 450);

f = createFont("Arial",14,true); // A font to write text on the screen
  frameRate(24);
  myCatcher = new Catcher();
  smooth();
   
  mySpider = new Spider[17];
  mySpider[0] = new Spider();
  mySpider[1] = new Spider();
  mySpider[2] = new Spider();
  mySpider[3] = new Spider();
  mySpider[4] = new Spider();
  mySpider[5] = new Spider();
  mySpider[6] = new Spider();
  mySpider[7] = new Spider();
  mySpider[8] = new Spider();
  mySpider[9] = new Spider();
  mySpider[10] = new Spider();
  mySpider[11] = new Spider();
  mySpider[12] = new Spider();
  mySpider[13] = new Spider();
  mySpider[14] = new Spider();
  mySpider[15] = new Spider();
  mySpider[16] = new Spider();
  }

 
void draw(){
  background(80);
    // If the game is over
  if (score >= 150) {
    textFont(f,48);
    textAlign(CENTER);
    fill(0);
    text("YOU WON!!",width/2,height/2);
  }
   
    int q;
  for (q = 0; q < 17; q++){
    mySpider[q].display();
    mySpider[q].fall();
    
  if ((abs(mouseY - mySpider[q].bodyY) < 20) && (abs(mouseX - mySpider[q].bodyX) < 20)){
      mySpider[q].caught();
   println(q + " caught");
  }
  }
    myCatcher.display();
   
    // Display number of lives left
    textFont(f,14);
    fill(0);
   // text("Spiders Missed: " + lives,10,20);
    text("Score: " + score,100,20);
}
 
class Spider{
float bodyX;
float bodyY;
float i;
float s;
float d;
float speed;
float opacity;
float bodyR;
float outlineRed;
float outlineGreen;
float bodyColor;
boolean intersect;
 
Spider (){
  bodyX = int(random(width));
  bodyY = int(random(height/2));
  i= random(23, 27);
  s= random(28, 31);
  d= random(8, 11);
  bodyR = random(30, 40);
  speed = random(1, 3);
  opacity = 200;
  outlineRed = random(80, 255);
  outlineGreen = random(0, 180);
  bodyColor = random(0, 40);
}
 
 
void display(){
    ellipseMode(CENTER);
  rectMode(CENTER);
   
  //web 
stroke(255, opacity);
line(bodyX, 0, bodyX, bodyY);
 
 //legs
  stroke(0);
  strokeWeight(2);
  //makes legs move
  i= random(23, 27);
  //most top and bottom legs
  line(bodyX, bodyY, bodyX+i, bodyY+i);
  line(bodyX, bodyY, bodyX-i, bodyY-i);
  line(bodyX, bodyY, bodyX+i, bodyY-i);
  line(bodyX, bodyY, bodyX-i, bodyY+i);
   
  //makes legs move
  s= random(28, 31);
  d= random(8, 11);
  //middle legs
  line(bodyX, bodyY, bodyX-s, bodyY-d);
  line(bodyX, bodyY, bodyX-s, bodyY+d);
  line(bodyX, bodyY, bodyX+s, bodyY+d);
  line(bodyX, bodyY, bodyX+s, bodyY-d);
   
  //body
  stroke(outlineRed, outlineGreen, 0);
  fill(bodyColor);
  ellipse(bodyX, bodyY, bodyR, bodyR);
  ellipse(bodyX, bodyY+25, 10, 10);
}
 
void fall(){
    if (bodyY > 470){
    bodyY = random(-40, -10);
    bodyX = random(width);
    opacity = 200;
  }else {
    bodyY+= speed;
  }
}
 
// If the spider is caught
void caught() {
   bodyY = 470;
   opacity = 0; 
   score++;
  // If the game is over
  if (score >= 150) {
    textFont(f,48);
    textAlign(CENTER);
    fill(0);
    text("YOU WON",width/2,height/2);
  }
}
}
 
class Catcher{
 float r;  //radius
 float x = mouseX;
 float y = mouseY;
  
 Catcher(){
  r = 20;
 }
  
void display(){
 stroke(0);
fill(150);
ellipse(mouseX, mouseY, r, r);
}
}
