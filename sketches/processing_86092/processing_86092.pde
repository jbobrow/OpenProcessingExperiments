
float bulletX;
float bulletX2;
float bulletX3;
float bulletX4;
float bulletX5;
float bulletX6;
float bulletX7;
float bulletX8;
float bulletX9;
float bulletX10;

float bulletY;
float bulletY2;
float bulletY3;
float bulletY4;
float bulletY5;
float bulletY6;
float bulletY7;
float bulletY8;
float bulletY9;
float bulletY10;
float bulletSpeed;

float parachuteX;
float parachuteY;

int shotFired;
int score=0;
int miss=3;


PImage background1;
PImage parachute;



void setup()
{
  size(1200, 600);
  background(255);
  smooth();

  shotFired = 0;
  bulletSpeed = 100;

  background1 = loadImage("11.png");
  parachute = loadImage("parachute.png");

  parachuteX = random(width);
  parachuteY = -50;
}
void draw()
{
  cursor(CROSS);

  imageMode(CORNER);
  image(background1, 0, 0, width, height);
  imageMode(CENTER);

  image(parachute, parachuteX, parachuteY, 50, 50);
  parachuteY = parachuteY + 2;

  //reset paratrooper
  if (parachuteY > height)
  {
    parachuteY=-50;
    parachuteX=random(width);
    miss--;
  }

  //shooting bullets condition
  if (shotFired < 1)
  {
    bulletX = mouseX;
    bulletY = mouseY;
  }
  else
  {
    bulletY = bulletY + bulletSpeed;
  }
  if (shotFired<2)
  {
    bulletX2 = mouseX;
    bulletY2 = mouseY;
  }
  else
  {
    bulletY2 = bulletY2 + bulletSpeed;
  }
  if (shotFired<3)
  {
    bulletX3 = mouseX;
    bulletY3 = mouseY;
  }
  else
  {
    bulletY3 = bulletY3 + bulletSpeed;
  }
  if (shotFired<4)
  {
    bulletX4 = mouseX;
    bulletY4 = mouseY;
  }
  else
  {
    bulletY4 = bulletY4 + bulletSpeed;
  }
  if (shotFired<5)
  {
    bulletX5 = mouseX;
    bulletY5 = mouseY;
  }
  else
  {
    bulletY5 = bulletY5 + bulletSpeed;
  }
  if (shotFired<6)
  {
    bulletX6 = mouseX;
    bulletY6 = mouseY;
  }
  else
  {
    bulletY6 = bulletY6 + bulletSpeed;
  }
  if (shotFired<7)
  {
    bulletX7 = mouseX;
    bulletY7 = mouseY;
  }
  else
  {
    bulletY7 = bulletY7 + bulletSpeed;
  }
  if (shotFired<8)
  {
    bulletX8 = mouseX;
    bulletY8 = mouseY;
  }
  else
  {
    bulletY8 = bulletY8 + bulletSpeed;
  }
  if (shotFired<9)
  {
    bulletX9 = mouseX;
    bulletY9 = mouseY;
  }
  else
  {
    bulletY9 = bulletY9 + bulletSpeed;
  }
  if (shotFired<10)
  {
    bulletX10 = mouseX;
    bulletY10 = mouseY;
  }
  else
  {
    bulletY10 = bulletY10 + bulletSpeed;
  }

  //reload
  if (shotFired == 11)
  {
    shotFired=0;
  }

  //checking if hit
  if ( (bulletX>=parachuteX-25&&bulletX<=parachuteX+25&&bulletY>=parachuteY-25&&bulletY<=parachuteY+25) ||
    (bulletX2>=parachuteX-25&&bulletX2<=parachuteX+25&&bulletY2>=parachuteY-25&&bulletY2<=parachuteY+25) ||
    (bulletX3>=parachuteX-25&&bulletX3<=parachuteX+25&&bulletY3>=parachuteY-25&&bulletY3<=parachuteY+25) ||
    (bulletX4>=parachuteX-25&&bulletX4<=parachuteX+25&&bulletY4>=parachuteY-25&&bulletY4<=parachuteY+25) ||
    (bulletX5>=parachuteX-25&&bulletX5<=parachuteX+25&&bulletY5>=parachuteY-25&&bulletY5<=parachuteY+25) ||
    (bulletX6>=parachuteX-25&&bulletX6<=parachuteX+25&&bulletY6>=parachuteY-25&&bulletY6<=parachuteY+25) ||
    (bulletX7>=parachuteX-25&&bulletX7<=parachuteX+25&&bulletY7>=parachuteY-25&&bulletY7<=parachuteY+25) ||
    (bulletX8>=parachuteX-25&&bulletX8<=parachuteX+25&&bulletY8>=parachuteY-25&&bulletY8<=parachuteY+25) ||
    (bulletX9>=parachuteX-25&&bulletX9<=parachuteX+25&&bulletY9>=parachuteY-25&&bulletY9<=parachuteY+25) ||
    (bulletX10>=parachuteX-25&&bulletX10<=parachuteX+25&&bulletY10>=parachuteY-25&&bulletY10<=parachuteY+25))
  {
    score++;
    parachuteY=-50;
    parachuteX=random(width);
  }


  //turret
  stroke(0);
  strokeWeight(15);
  line(width/2, 600, mouseX, mouseY);
  noStroke();
  fill(75);
  ellipse(width/2, 600, 100, 100);

  //bullets
  fill(255, 0, 0);
  ellipse(bulletX, bulletY, 10, 10);
  ellipse(bulletX2, bulletY2, 10, 10);
  ellipse(bulletX3, bulletY3, 10, 10);
  ellipse(bulletX4, bulletY4, 10, 10);
  ellipse(bulletX5, bulletY5, 10, 10);
  ellipse(bulletX6, bulletY6, 10, 10);
  ellipse(bulletX7, bulletY7, 10, 10);
  ellipse(bulletX8, bulletY8, 10, 10);
  ellipse(bulletX9, bulletY9, 10, 10);
  ellipse(bulletX10, bulletY10, 10, 10);
  fill(255, 0, 0);
  textSize(24);
  text("score:  " + score, 20, 20);

//gameover
  if (miss == 0)
  {
    background(255);
    text("GAME OVER", width/2, height/2);
    noLoop();
  }
}


void mousePressed()
{
  shotFired++;
  bulletSpeed = -9;
}



