
float bulletX; 
float bulletX2;
float bulletX3;
float bulletX4;
float bulletX5;
float bulletX6;
float bulletX7;
float bulletX8;


float bulletY; 
float bulletY2;
float bulletY3;
float bulletY4;
float bulletY5;
float bulletY6;
float bulletY7;
float bulletY8;
float bulletSpeed;

boolean title=true;

int shotFired;
int score=0;
int miss=3;

PImage stickman;
PImage background1;
PImage rifle;

float stickmanX;
float stickmanY;

void setup()
{
  size(1400,600);
  background(255);
  smooth();
    
  shotFired = 0;
  bulletSpeed = 50;
  
  background1 = loadImage("beach.png");
  stickman = loadImage("stickman.png");
  rifle = loadImage("assaultrifle.png");
  
  stickmanX = width+100;
  stickmanY = random(height);
}
void draw()
{
  if (title==true)
  {
   background(255);
   textSize(36); 
   fill(0);
  text("Press enter to start",600, 200);
  text("Shoot the enemy soliders before they get passed you!",300,400); 
 
  
  }
  if(title==false)
  {
  cursor(CROSS);
  imageMode(CORNER);
  image(background1, 0, 0, width, height);
  imageMode(CENTER);
  image(stickman, stickmanX, stickmanY, 100, 100);
  stickmanX = stickmanX-15;
  
  //reset stickman
  
  if(stickmanX<0)
  {
   stickmanX=width+100;
   stickmanY=random(height);
   miss--; 
  }
  //shooting bullets condition
  if(shotFired<1)
 {
  bulletX=mouseX+170;
  bulletY=mouseY-8;
 } 
 else
 {
  bulletX=bulletX+bulletSpeed; 
 }
   if(shotFired<2)
 {
  bulletX2=mouseX+170;
  bulletY2=mouseY-8;
 } 
 else
 {
  bulletX2=bulletX2+bulletSpeed; 
 }
   if(shotFired<3)
 {
  bulletX3=mouseX+170;
  bulletY3=mouseY-8;
 } 
 else
 {
  bulletX3=bulletX3+bulletSpeed; 
 }
   if(shotFired<4)
 {
  bulletX4=mouseX+170;
  bulletY4=mouseY-8;
 } 
 else
 {
  bulletX4=bulletX4+bulletSpeed; 
 }
   if(shotFired<5)
 {
  bulletX5=mouseX+170;
  bulletY5=mouseY-8;
 } 
 else
 {
  bulletX5=bulletX5+bulletSpeed; 
 }
   if(shotFired<6)
 {
  bulletX6=mouseX+170;
  bulletY6=mouseY-8;
 } 
 else
 {
  bulletX6=bulletX6+bulletSpeed; 
 }  
   if(shotFired<7)
 {
  bulletX7=mouseX+170;
  bulletY7=mouseY-8;
 } 
 else
 {
  bulletX7=bulletX7+bulletSpeed; 
 }
   if(shotFired<8)
 {
  bulletX8=mouseX+170;
  bulletY8=mouseY-8;
 } 
 else
 {
  bulletX8=bulletX8+bulletSpeed; 
 }
 //reload
 if(shotFired==9)
 {
 shotFired=0;
 }
 
 //checking if hit
 if( (bulletX>=stickmanX-50&&bulletX<=stickmanX+50&&bulletY>=stickmanY-50&&bulletY<=stickmanY+50) ||
   (bulletX2>=stickmanX-50&&bulletX2<=stickmanX+50&&bulletY2>=stickmanY-50&&bulletY2<=stickmanY+50) ||
   (bulletX3>=stickmanX-50&&bulletX3<=stickmanX+50&&bulletY3>=stickmanY-50&&bulletY3<=stickmanY+50) ||
   (bulletX4>=stickmanX-50&&bulletX4<=stickmanX+50&&bulletY4>=stickmanY-50&&bulletY4<=stickmanY+50) ||
   (bulletX5>=stickmanX-50&&bulletX5<=stickmanX+50&&bulletY5>=stickmanY-50&&bulletY5<=stickmanY+50) ||
   (bulletX6>=stickmanX-50&&bulletX6<=stickmanX+50&&bulletY6>=stickmanY-50&&bulletY6<=stickmanY+50) ||
   (bulletX7>=stickmanX-50&&bulletX7<=stickmanX+50&&bulletY7>=stickmanY-50&&bulletY7<=stickmanY+50) ||
   (bulletX8>=stickmanX-50&&bulletX8<=stickmanX+50&&bulletY8>=stickmanY-50&&bulletY8<=stickmanY+50)) 
 {
   score++;
   stickmanX=width+50;
   stickmanY=random(height);
 }

  image( rifle,mouseX+50,mouseY);
  strokeWeight(5);
  fill(255);
  line(100,150,100,375);
  line(100,375,65,500);
  line(100,375,135,500);
  fill(0);
  fill(23,129,53);
  ellipse(100,59,100,90);
  ellipse(100,65,145,40);
  fill(245,184,87);
  ellipse(100,100,93,100);
  line(100,250,mouseX+65,mouseY+10);
  line(100,220,mouseX+5,mouseY+5);
  strokeWeight(13);
  point(83,80);
  point(117,80);
  strokeWeight(3);
  fill(245,121,44);
  ellipse(100,120,30,10);
  strokeWeight(3);
  
 //bullets
  ellipse(bulletX, bulletY,5,5);
  ellipse(bulletX2, bulletY2,5,5);
  ellipse(bulletX3, bulletY3,5,5);
  ellipse(bulletX4, bulletY4,5,5);
  ellipse(bulletX5, bulletY5,5,5);
  ellipse(bulletX6, bulletY6,5,5);
  ellipse(bulletX7, bulletY7,5,5);
  ellipse(bulletX8, bulletY8,5,5);
  fill(0);
  textSize(36);
  text("score: "+score, width/2, 30);
  }
  //Gameover
  if(miss==0)
  {
   background(255);
   text("GAME OVER!",630,300);
   noLoop();
  }
}

void mousePressed()
{
  shotFired++;
  bulletSpeed=60;
}

void keyPressed()
{
  if(keyCode==ENTER)
  {
    title=false;
    miss=3;
    score=0;
  }
}


