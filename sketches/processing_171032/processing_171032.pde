

int shipSpeed = 6;
int ship2Speed = 6;
float ship1x;
float ship2x;
float ship1y;
float ship2y;
int score;
int ballSize = 20;
boolean fire1 = false;
boolean fire2 = false;

boolean s1up, s2up, s1down, s2down;

//Initialise gameOver variable
//int gameOver = 0;

//int startGame;
//int getRandomX()


 int score1;
 int score2;
//{
//  return int(random(600));
//}

//int[] ballx = { 
//  getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX()
//  };
//int[] bally = { 
//  0, 0, 0, 0, 0
//};

void setup()
{


  size (749, 749);
  smooth ();
  ship1x = 15;
  ship2x = width-15; 
  ship1y = height/2;
  ship2y = height/2;
  rectMode(CENTER);
}

void draw()
{

  //Game Style
  shipMovement();
  fill(254, 254, 254, 75);
  rect(1, 1, height*2, width*2);

  triangle(20, ship1y-15, 20, ship1y+15, 40, ship1y);
  triangle(width-20, ship2y -15, width-20, ship2y+15, width -40, ship2y);
  
  if (ship1y <= 0) {
    shipSpeed = 0;
    ship1y = 1;
  } else {
    shipSpeed = 6;
  }

  if (ship2y <= 0) {
    ship2Speed = 0;
    ship2y = 1;
  } else {
    ship2Speed = 6;
  }

  //upper boarder

  if (ship1y >= height) {
    shipSpeed = 0;
    ship1y = height-1;
  } else {
    shipSpeed = 6;
  }

  if (ship2y >= height) {
    ship2Speed = 0;
    ship2y = height-1;
  } else {
    ship2Speed = 6;
  }


fill(255);
stroke (0);
//triangle(mouseX-8, 480, mouseX+8, 480, mouseX, 565);
fill(0);
text(score1, 20, 20);
text(score2, width - 20, 20);
if (fire1)
{
  cannon1(ship1y);
  fire1 = false;
}

if (fire2)
{
  cannon2(ship2y);
  fire2 = false;
}


//ballFalling();
//gameFinish();
}

//Play the game


//void mousePressed()
//{
//  fire = true;
//}

//void ballFalling()
//{ 
//  stroke(39, 154, 240);
//  fill (39, 154, 240);
//
//  for (int i=0; i<5; i++)
//  {
//    ellipse(ballx[i], bally[i]++, ballSize, ballSize);
//  }
//}

void cannon1(float shotX)
{
  boolean strike = false;
  for (int i = 0; i < 5; i++)
  {
    if ((ship1y >= (ship2y -15)) && (ship1y <= (ship2y +15))) {
      strike = true;
      line(40,ship1y, width, ship1y);
      line(40,ship1y, width, ship1y+random(-4,4));
       line(40,ship1y, width, ship1y+random(-4,4));
        line(40,ship1y, width, ship1y+random(-4,4));
         line(40,ship1y, width, ship1y+random(-4,4));
          line(40,ship1y, width, ship1y+random(-4,4));
           line(40,ship1y, width, ship1y+random(-4,4));
            line(40,ship1y, width, ship1y+random(-4,4));
            line(40,ship1y, width, ship1y+random(-5,5));line(40,ship1y, width, ship1y+random(-5,5));line(40,ship1y, width, ship1y+random(-5,5));line(40,ship1y, width, ship1y+random(-5,5));line(40,ship1y, width, ship1y+random(-5,5));line(40,ship1y, width, ship1y+random(-5,5));line(40,ship1y, width, ship1y+random(-5,5));line(40,ship1y, width, ship1y+random(-5,5));line(40,ship1y, width, ship1y+random(-5,5));line(40,ship1y, width, ship1y+random(-5,5));line(40,ship1y, width, ship1y+random(-5,5));
            line(40,ship1y, width, ship1y+random(-5,5));line(40,ship1y, width, ship1y+random(-5,5));line(40,ship1y, width, ship1y+random(-5,5));line(40,ship1y, width, ship1y+random(-5,5));line(40,ship1y, width, ship1y+random(-5,5));line(40,ship1y, width, ship1y+random(-5,5));line(40,ship1y, width, ship1y+random(-5,5));
            
      //ellipse(ballx[i], bally[i], 
      //ballSize+25, ballSize+25);
      //ballx[i] = getRandomX();
      //bally[i] = 0;



      // update score
      score1++;
    }
  }

  if (strike == false)
  {
    line(40,ship1y, width, ship1y);
  }
}


void cannon2(float shotX)
{
  boolean strike = false;
  for (int i = 0; i < 5; i++)
  {
    if ((ship2y >= (ship1y -15)) && (ship2y <= (ship1y +15))) {
      strike = true;
      line(15,ship2y, width-40, ship2y);
      line(15,ship2y+random(-5,5), width-40, ship2y);
      line(15,ship2y+random(-5,5), width-40, ship2y);
      line(15,ship2y+random(-5,5), width-40, ship2y);
      line(15,ship2y+random(-5,5), width-40, ship2y);
      line(15,ship2y+random(-5,5), width-40, ship2y);
      line(15,ship2y+random(-5,5), width-40, ship2y);line(15,ship2y+random(-5,5), width-40, ship2y);line(15,ship2y+random(-5,5), width-40, ship2y);
      line(15,ship2y+random(-5,5), width-40, ship2y);
      line(15,ship2y+random(-5,5), width-40, ship2y);line(15,ship2y+random(-5,5), width-40, ship2y);line(15,ship2y+random(-5,5), width-40, ship2y);
      line(15,ship2y+random(-5,5), width-40, ship2y);
      line(15,ship2y+random(-5,5), width-40, ship2y);line(15,ship2y+random(-5,5), width-40, ship2y);line(15,ship2y+random(-5,5), width-40, ship2y);
      //ellipse(ballx[i], bally[i], 
      //ballSize+25, ballSize+25);
      //ballx[i] = getRandomX();
      //bally[i] = 0;



      // update score
      score2++;
    }
  }

  if (strike == false)
  {
    line(0,ship2y, width-40, ship2y);
  }
}







//GameOver

//void gameFinish()
//{
//  for (int i=0; i< 5; i++)
//  {
//    if (bally[i]==530)
//    {
//
//
//      fill(color(255, 0, 0));
//      fill(255, 0, 0);
//      textAlign(CENTER);
//      text("GAME OVER", width/2, height/2);
//      text("Well done! Your score was : "+ score, width/2, height/2 + 50);
//
//      noLoop();
//    }
//  }
//}
void shipMovement() {
  if (s1up) ship1y -= shipSpeed;
  if (s1down) ship1y += shipSpeed;
  if (s2up) ship2y -= ship2Speed;
  if (s2down) ship2y += ship2Speed;
}

void keyPressed () {
  //left ship
  if (key == 'a') {
    s1up = true;
    s1down = false;
  }
  if (key == 'z') {
    s1up = false;
    s1down = true;
  }

  //right ship
  if (key == 'k') {
    s2up = true;
    s2down = false;
  }
  if (key =='m') {
    s2up = false;
    s2down = true;
  }
   if (key =='x') {
fire1 = true;
  }
  
   if (key =='l') {
  fire2 = true;
  }
  
  
  
  
  
}

void keyReleased() {
  if (key == 'a') {
    s1up = false;
  }
  if (key == 'z') {
    s1down = false;
  }
  if (key == 'k') {
    s2up = false;
  }
  if (key =='m') {
    s2down = false;
  }
}
