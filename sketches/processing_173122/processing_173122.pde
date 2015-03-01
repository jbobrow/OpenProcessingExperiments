

boolean title=true;
int shotFired;
int score=0;
int miss=3;
PImage enemytank;
PImage background1;
PImage tank, tank1;
PImage fire;
float enemytankX;
float enemytankY;
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
 
void setup()
{
  size(1400,600);
  background(255);
  smooth();
     
  shotFired = 0;
  bulletSpeed = 50;
   
  background1 = loadImage("background.jpg");
  enemytank = loadImage("enemytank.png");
  tank = loadImage("tank.png");
  tank1 = loadImage ("maukelertank.png");
  fire = loadImage ("fireball.png");
   
  enemytankX = width+100;
  enemytankY = random(height);
}
void draw()
{
  if (title==true)
  {
   background(255);
   textSize(36);
   fill(0);
  text("Press SPACE to start",500, 300);
  
  
   
  }
  if(title==false)
  {
  noCursor();
  imageMode(CORNER);
  image(background1, 0, 0, width, height);
  imageMode(CENTER);
  image(enemytank, enemytankX, enemytankY, 100, 100);
  
  enemytankX = enemytankX-15;
  
  
  //reset enemytank
   
  if(enemytankX<0)
  {
   enemytankX=width+100;
   enemytankY=random(height);
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
   if( (bulletX>=enemytankX-50&&bulletX<=enemytankX+50&&bulletY>=enemytankY-50&&bulletY<=enemytankY+50) ||
   (bulletX2>=enemytankX-50&&bulletX2<=enemytankX+50&&bulletY2>=enemytankY-50&&bulletY2<=enemytankY+50) ||
   (bulletX3>=enemytankX-50&&bulletX3<=enemytankX+50&&bulletY3>=enemytankY-50&&bulletY3<=enemytankY+50) ||
   (bulletX4>=enemytankX-50&&bulletX4<=enemytankX+50&&bulletY4>=enemytankY-50&&bulletY4<=enemytankY+50) ||
   (bulletX5>=enemytankX-50&&bulletX5<=enemytankX+50&&bulletY5>=enemytankY-50&&bulletY5<=enemytankY+50) ||
   (bulletX6>=enemytankX-50&&bulletX6<=enemytankX+50&&bulletY6>=enemytankY-50&&bulletY6<=enemytankY+50) ||
   (bulletX7>=enemytankX-50&&bulletX7<=enemytankX+50&&bulletY7>=enemytankY-50&&bulletY7<=enemytankY+50) ||
   (bulletX8>=enemytankX-50&&bulletX8<=enemytankX+50&&bulletY8>=enemytankY-50&&bulletY8<=enemytankY+50))
 {
   score++;
   enemytankX=width+50;
   enemytankY=random(height);
 }
  image( tank,mouseX+50,mouseY);
  
 //bullets
  image (fire, bulletX, bulletY,25,25);
  image (fire, bulletX2, bulletY2,25,25);
  image (fire, bulletX3, bulletY3,25,25);
  image (fire, bulletX4, bulletY4,25,25);
  image (fire, bulletX5, bulletY5,25,25);
  image (fire, bulletX6, bulletY6,25,25);
  image (fire, bulletX7, bulletY7,25,25);
  image (fire, bulletX8, bulletY8,25,25);
  fill(#F5E8E8);
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
  if(keyCode==' ')
  {
    title=false;
    miss=3;
    score=0;
  }
}




