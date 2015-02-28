
/* @pjs preload= "ship0.png", "ship1.png", "ship2.png", "aliens0.png", "aliens1.png", aliens2.png";*/
float starsX;
float starsY;
int[] twinkleX = new int[600];
int[] twinkleY = new int[600];
color[] twinkleColor = new color[600];
float[] xs = new float[50];//shooting star info
float[] ys = new float[50];
float endX;
float endY = 500;
float distX;
float distY;
float beginX = random(0,600);
float beginY = random(0, 100);
float speed = 0.002;
float pct = 0.0;
float step = 0.002;
float radius = 30;
int timer = 0;
boolean shootStar = false;
int shipPics = 3;//info for spaceship alone
int frame = 0;
PImage [] images = new PImage[shipPics];
float shipX= random(50, 550);
float shipY= random(50, 550);
float shipSpdX = 5.0;
float shipSpdY = 5.0;
float shipRadius= 40.0;
int shipDirX = 1;
int shipDirY = -1;
int frames = 0;//info for alien attacker;
int alienPics = 3;
PImage [] imagesA = new PImage[alienPics];
float alienX = random(50, 550);
float alienY = random(50, 550);
float alienSpdX = 12.0;
float alienSpdY = 12.0;
float alienRadius = 40.0;
int alienDirX = 1;
int alienDirY = -1;
boolean abducted = false;



void setup()
{ 
  size(600,600);
  frameRate(12);  //setup for the stars
  smooth();
  noStroke();
  for(int i = int(beginX); i<xs.length; i++)
  {
    xs[i] = 0;
  }
  for(int i = int(beginY); i <xs.length; i++)
  {
    ys[i] = 0;
  }
  if( beginX <= 300)
  {
    endX = beginX + 50;
  }
  if( beginX > 300)
  {
    endX = beginX - 50;
  }
  distX = endX - beginX;
  distY = endY - beginY;
  ellipseMode(CENTER); 
  for(int s = 0; s < 600; s++)
  {
    twinkleX[s] = (int)random(width);
    twinkleY[s] = (int)random(height);
    twinkleColor[s] = color((int)random(100, 255));
  }
  frameRate(10);
  imageMode(CENTER); //setup for ship and alien
    for(int i = 0; i < images.length; i++)
  {
    String imageName = "ship" + nf(i, 1) + ".png";
    images[i] = loadImage(imageName);
  }
  for (int i = 0; i < imagesA.length; i++)
  {
    String imageName2 = "aliens" + nf(i, 1) + ".png";
    imagesA[i] = loadImage(imageName2);
  }
}

void ship()
{ 
  frame++; // for spaceship movement.
  if (frame == shipPics)
  {
    frame = 0;
  }
  image(images[frame], shipX, shipY);
  shipX += shipSpdX * shipDirX;
  if ((shipX > width - shipRadius) || (shipX < shipRadius))
  {
    shipDirX = -shipDirX;
  }
  shipY += shipSpdY * shipDirY;
  if ((shipY > height - shipRadius) || (shipY < shipRadius)) 
  {
    shipDirY = -shipDirY;
  }
}

void alien() 
{
  frames++; // for alien attackers.
  if(frames == alienPics)
  {
    frames = 0;
  }
  image(imagesA[frames], alienX, alienY);
  alienX += alienSpdX * alienDirX;
  if ((alienX > width - alienRadius) || (alienX < alienRadius)){
    alienDirX = -alienDirX;
  }
  alienY += alienSpdY * alienDirY;
  if ((alienY > height - alienRadius) || (alienY < alienRadius))
  {
    alienDirY = -alienDirY;
  }
}

void shootingStar()
{ 
  ellipseMode(CENTER);
  if( timer < 300) 
  {
    pct += step;
    timer += 1;
    if (radius > 0)
    {
      radius -= 0.02;
    }    
    for(int i = 0; i<xs.length-1; i++)
    {
      xs[i] = xs[i+1];
      ys[i] = ys[i+1];
      smooth();
      fill(i*2, 2);
      ellipse(xs[i], ys[i], radius, radius);
    }
    noFill();
    xs[xs.length-1] = beginX + (pct * distX);
    ys[ys.length-1] = beginY + (pct * distY);
  }
  if( timer == 400) 
  {
    abducted = false;
    ship();
    timer = 0;
  }
}

void attack() {
  if(dist(alienX, alienY, shipX, shipY) < shipRadius+20) 
  {
   abducted = true;
 }
} 

void draw()
{
  background(0);
  for (int t= 0; t <600;t++)
  {
    if(random(10) < t)
    {
      twinkleColor[t] = (int)random(100, 255);
    }
    fill(twinkleColor[t]);
    ellipse(twinkleX[t], twinkleY[t], 2, 2);
  }
  for (int star = 0; star < 1; star++) 
  {
    noStroke();
    starsX= random(height);
    starsY= random(width);
    fill(195, 30, 175, 100);
    ellipse(starsX, starsY, 5, 5);
    fill(255);
    ellipse(starsX, starsY, 3, 3);
  }
    if (abducted == true) {
    shootingStar();
  }
  alien();
  attack();
  if (abducted == false){
    ship();
  }
}


