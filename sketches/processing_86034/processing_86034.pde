
float enemyY = 0;
float enemySpeed;
float enemy2Y = 0;
float enemy2Speed;
float enemy3Y = 0;
float enemy3Speed;
float enemy4Y = 0;
float enemy4Speed;
float enemy5Y = 0;
float enemy5Speed;
float enemy6Y = 0;
float enemy6Speed;
float enemy7Y = 0;
float enemy7Speed;
boolean enemyHit = false;
boolean enemy2Hit = false;
boolean enemy3Hit = false;
boolean enemy4Hit = false;
boolean enemy5Hit = false;
boolean enemy6Hit = false;
boolean enemy7Hit = false;
float bulletSpeed;
float bulletY;

void setup()
{
  size(400, 600);
  smooth();
  background(0);
  bulletSpeed = 0;
  bulletY = height - 10;
  enemySpeed = random(2);
  enemy2Speed = random(3);
  enemy3Speed = random(4);
  enemy4Speed = random(5);
  enemy5Speed = random(6);
  enemy6Speed = random(7);
  enemy7Speed = random(8);
}


void draw()
{
  //Ship------------------------------------------------Ship\\
  cursor(CROSS);
  background(0);
  noStroke();
  fill(random(255), random(255), random(255));
  rect(mouseX, 550, 30, 30);
  //Laser-------------------------------------------------------
  stroke(0, 255, 0);
  line(mouseX, bulletY, mouseX, 550);
  bulletY = bulletY + bulletSpeed;
  if (bulletY < 0)
  {
    bulletY = height-10;
    bulletSpeed = 0;
  }
  if (mousePressed)
  {
    bulletSpeed = -10;
  }
  //Enemy1-------------------------------------------------
  noStroke();
  fill(255, 0, 0);
  if (dist(mouseX, bulletY, 300, enemyY)< 5)
  {
    enemyHit = true;
  }
  if (enemyHit == false)
  {
    ellipse(300, enemyY, 10, 10);
    enemyY = enemyY + enemySpeed + 1;
  }

  if (enemyY > 600)
  {
    enemyY = 0;
  }
  if (enemyY >= 550 && mouseX <= 300 && mouseX >= 270)
  {
    gameover();
  }

  //Enemy2--------------------------------------------------
  noStroke();
  fill(255, 0, 0);
  if (dist(mouseX, bulletY, 200, enemy2Y)< 2.5)
  {
    enemy2Hit = true;
  }
  if (enemy2Hit == false)
  {
    ellipse(200, enemy2Y, 5, 5);
    enemy2Y = enemy2Y + enemy2Speed + 1;
  }

  if (enemy2Y > 600)
  {
    enemy2Y = 0;
  }
  if (enemy2Y >= 550 && mouseX <= 200 && mouseX >= 170)
  {
    gameover();
  }
  //Enemy3--------------------------------------------------------
  noStroke();
  fill(255, 0, 0);
  if (dist(mouseX, bulletY, 50, enemy3Y)< 10)
  {
    enemy3Hit = true;
  }
  if (enemy3Hit == false)
  {
    ellipse(50, enemy3Y, 20, 20);
    enemy3Y = enemy3Y + enemy3Speed + 3;
  }

  if (enemy3Y > 600)
  {
    enemy3Y = 0;
  }
  if (enemy3Y >= 550 && mouseX <= 50 && mouseX >= 20)
  {
    gameover();
  }
  //Enemy4--------------------------------------------------------
  noStroke();
  fill(255, 0, 0);
  if (dist(mouseX, bulletY, 100, enemy4Y)< 10)
  {
    enemy4Hit = true;
  }
  if (enemy4Hit == false)
  {
    ellipse(100, enemy4Y, 20, 20);
    enemy4Y = enemy4Y + enemy4Speed + 4;
  }

  if (enemy4Y > 600)
  {
    enemy4Y = 0;
  }
  if (enemy4Y >= 550 && mouseX <= 100 && mouseX >= 70)
  {
    gameover();
  }
  //Enemy5--------------------------------------------------------
  noStroke();
  fill(255, 0, 0);
  if (dist(mouseX, bulletY, 350, enemy5Y)< 20)
  {
    enemy5Hit = true;
  }
  if (enemy5Hit == false)
  {
    ellipse(350, enemy5Y, 40, 40);
    enemy5Y = enemy5Y + enemy5Speed + 5;
  }

  if (enemy5Y > 600)
  {
    enemy5Y = 0;
  }
  if (enemy5Y >= 550 && mouseX <= 350 && mouseX >= 320)
  {
    gameover();
  }
  //Enemy6------------------------------------------------------
  noStroke();
  fill(255, 0, 0);
  if (dist(mouseX, bulletY, 160, enemy6Y)< 10)
  {
    enemy6Hit = true;
  }
  if (enemy6Hit == false)
  {
    ellipse(160, enemy6Y, 20, 20);
    enemy6Y = enemy6Y + enemy6Speed + 6;
  }

  if (enemy6Y > 600)
  {
    enemy6Y = 0;
  }
  if (enemy6Y >= 550 && mouseX <= 160 && mouseX >= 130)
  {
    gameover();
  }
  //Enemy7----------------------------------------------------------
  noStroke();
  fill(255, 0, 0);
  if (dist(mouseX, bulletY, 260, enemy7Y)< 10)
  {
    enemy7Hit = true;
  }
  if (enemy7Hit == false)
  {
    ellipse(260, enemy7Y, 20, 20);
    enemy7Y = enemy7Y + enemy7Speed + 7;
  }
  if (enemy7Y > 600)
  {
    enemy7Y = 0;
  }
  if (enemy7Y >= 550 && mouseX <= 260 && mouseX >= 230)
  {
    gameover();
  }
}


void gameover()
{
  println("Hit");
  fill(255, 255, 255);
  textAlign(CENTER);
  textSize(36);
  text("GAME OVER.", width/2, height/2);
  noLoop();
}



