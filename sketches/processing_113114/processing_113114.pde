
PImage shutdown;
float increaseSize = 4;
float ellipseOneX = 100;
float ellipseOneY = 100;
int timer = 0;
int imageTimer = 0;
float angle = 0;


void setup()
{
   size (500, 500);
  colorMode(HSB, 360, 100, 100);
  shutdown = loadImage("shutdown.jpg");
}

void draw()
{
  imageTimer ++;
    if (imageTimer < 420)
    {
      ellipseOne();
      ellipseTwo();
      ellipseThree();
      ellipseFour();
      randomEllipse();
    }
    
    if (imageTimer == 420)
    {
       callImage();
    }
    
    if (imageTimer >= 840)
    {
        RandomRect(); 
    }
    
    if (imageTimer == 1260)
    {
      imageTimer = 0;
    }
}

void ellipseOne() 
{
      angle += 0.1;
    timer++;  
    ellipseOneX += increaseSize;
    ellipseOneY += increaseSize;
    
    if (timer == 60)
    {
      timer = -120;
      increaseSize = -increaseSize;
    }
    
    fill(random(255), 100, 100);
    pushMatrix();
    
    translate(300,300);
    rotate(angle);
    ellipse(0,0, ellipseOneX, ellipseOneY);
  
  popMatrix();
}

void ellipseTwo()
{
      angle += 0.1;
    timer++;  
    ellipseOneX += increaseSize;
    ellipseOneY += increaseSize;
    
    if (timer == 60)
    {
      timer = -120;
      increaseSize = -increaseSize;
    }
    
    fill(random(255), random(255), random(255));
    pushMatrix();
    
    translate(150,150);
    rotate(angle);
    ellipse(0,0, ellipseOneX, ellipseOneY);
  
  popMatrix();
}

void ellipseThree()
{
      angle += 0.1;
    timer++;  
    ellipseOneX += increaseSize;
    ellipseOneY += increaseSize;
    
    if (timer == 60)
    {
      timer = -120;
      increaseSize = -increaseSize;
    }
    
    fill(random(255), 100, 100);
    pushMatrix();
    
    translate(150,300);
    rotate(angle);
    noStroke();
    ellipse(0,0, ellipseOneX, ellipseOneY);
  
  popMatrix();
}

void ellipseFour()
{
      angle += 0.1;
    timer++;  
    ellipseOneX += increaseSize;
    ellipseOneY += increaseSize;
    
    if (timer == 60)
    {
      timer = -120;
      increaseSize = -increaseSize;
    }
    
    fill(random(255), 100, 100);
    pushMatrix();
    
    translate(300,150);
    rotate(angle);
    ellipse(0,0, ellipseOneX, ellipseOneY);
  
  popMatrix();
}

void randomEllipse()
{
      angle += 0.1;
    timer++;  
    ellipseOneX += increaseSize;
    ellipseOneY += increaseSize;
    
    if (timer == 60)
    {
      timer = -120;
      increaseSize = -increaseSize;
    }
    
    fill(random(255), random(255), random(255));
    pushMatrix();
    
    translate(random(50,450), random(50,450));
    rotate(angle);
    ellipse(0,0, ellipseOneX, ellipseOneY);
  
  popMatrix();
}

void callImage()
{
  imageMode(CENTER);
      image(shutdown, width /2, height /2, shutdown.width * .55, shutdown.height);
}

void RandomRect()
{
  angle += 0.1;
        float degrees = radians(45);
        rectMode(CENTER);
        {
          
         pushMatrix(); //start transforms ONLY
         translate(random(50,450), random(50,450)); //use translate first
         rotate(angle); // rotate second
         rect(0,0,100,100);
         popMatrix(); //end tranforms ONLY
        }
}




