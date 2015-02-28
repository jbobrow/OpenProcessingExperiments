
PImage trampoline;
PImage egg;
PImage brokenegg;

float eggX;
float eggY;
float eggDX = 0;
float eggDY = 1;
float eggS = 40;
float ey = 0;
float eggTimer = 0;

float enemyX = 100;
float enemyY = 100;
float enemySpeed = 5;
float enemyHealth = 100;


void setup()
{
  size(400, 800);
  noStroke();
  imageMode(CENTER);
  
  eggY = 1;
  eggX = width/2;
  
  egg = requestImage("rugby471_Tango_Style_Egg_Vector_Clipart.png");
  trampoline = requestImage("trampolin.png");
  brokenegg = requestImage("egg_Vector_Clipart.png");
  
  frameRate(30);
  
}

void draw()
{
  background(0);
  imageMode(CENTER);
  
  enemyX += enemySpeed;
  if (enemyX > width - 50)
  {
    enemySpeed = -enemySpeed;
  }
  if (enemyX < 50)
  {
    enemySpeed = -enemySpeed;
  }
  
  if (egg.width > 0)
  {
    image(egg, eggX, eggY, 100, 100);
  }
  if (trampoline.width > 0)
  {
    image(trampoline, mouseX, 700, 100, 50);
  }
  
  rectMode(CENTER);
  rect(enemyX, enemyY, 100, 100);
  
  if (eggDY < 0 && dist(eggX, eggY, enemyX, enemyY) < 100)
  {
    enemyHealth -= 1;
    println(enemyHealth);
    eggTimer = 6;
    
    if (brokenegg.width > 0)
    {
      image(brokenegg, eggX, eggY, 100, 100);
    }
    fill(255); // flash white
  }
  else
  {
    fill(255, 0, 0); // otherwise red
  }
  

  
  eggTimer += 1 / 30.0;
  
  if (eggTimer > 5 || eggY > height)
  {
    eggX = enemyX;
    eggY = enemyY;
    eggDY = 1.5;
    eggDX = 0;
    eggTimer = 0;
  }
  
  eggX += eggDX;
  eggY += 10 * eggDY;
   
  if (eggX >= width)
  {
    eggDX = eggDX * -1;
  }
   
  if (eggX <= 0)
  {
    eggDX = eggDX * -1;
  }
  
  if (dist(eggX, eggY, mouseX, 700) < 50)
  {
    eggDY = -eggDY;
    eggY = 650;
    eggDX = ((eggX + 50) - (mouseX + 50)) / 10;
  }
    

}



