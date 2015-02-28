
int posX;
int posY;
int asteroidX;
int asteroidY;
int negPosX;
int negPosY;
int negPosY2;
int speed;
float shipSizeX;
float shipSizeY;
float skySizeX;
float skySizeY;
float sunSize;
int asteroidSpeed;

void setup() {
  
  size (201, 700);
  smooth ();
  
  posX = 100;
  posY = 650;
  asteroidX = 50;
  asteroidY = 100;
  negPosX = 100;
  negPosY = 650;
  negPosY2 = -250;
  speed = 2;
  shipSizeX = 45;
  shipSizeY = 90;
  skySizeX = 600;
  skySizeY = 600;
  sunSize = 20; 
  asteroidSpeed = 1;
}

void draw() {
  background (0, 0, 0);
  noStroke ();
  
  // Nested for() loops can be used to
// generate two-dimensional patterns

for (int y = 0; y<=height; y += 25) {
  for (int x = 0; x <=width; x += 25){
    float r = random(2);
    fill (255, 255, 255);
    ellipse (x, y, r, r);
  }
}
  
  if (mousePressed == true) {
    posY -= speed;
    negPosY += speed-1;
    negPosY2 += speed-1;
    shipSizeX -= .1;
    shipSizeY -= .2;
    skySizeX -= 1;
    skySizeY -= 1;
    sunSize += .5;
    asteroidX += asteroidSpeed;    
  } else {
    fill(255);
  }

  fill (5, 0, 50, 100);
  ellipse (width/2, negPosY-200, skySizeX, skySizeY);
  //filter (BLUR, 10);

  fill (8, 0, 80, 100);
  ellipse (width/2, negPosY-175, skySizeX, skySizeY);
  //filter (BLUR, 8);

  fill (4, 99, 211);
  ellipse (width/2, negPosY-150, skySizeX, skySizeY);
  //filter (BLUR, 4);
  
  //sun
  
  if (keyPressed) {
    if (key == 'm' || key == 'M') {
      fill(200, 200, 200);
    }
  } else {
    fill(250, 255, 0);
  }
     ellipse (width/2, negPosY2, sunSize, sunSize);
  
  //filter (BLUR, 4);

  //Grass Blades
  for (int i = 0; i < 200; i = i+2) {
  rect (i, negPosY+10, 1, 5);
  
  //Grass
  fill (68, 188, 32);
  rect (0, negPosY+15, 201, 50);
  }
 
  fill (255, 255, 255);
  ellipse(posX, posY, shipSizeX, shipSizeY);

  fill (165, 165, 165);
  ellipse(asteroidX-100, asteroidY-100, 40, 40);
  asteroidX += asteroidSpeed;
  if ((asteroidX+20) > width*2 || (asteroidX-20) < -200)
    asteroidSpeed *= -1;
  
  fill (200, 200, 200);
  ellipse(asteroidX+100, asteroidY-50, 40, 40);
  asteroidX += asteroidSpeed;
  if ((asteroidX+20) > width*2 || (asteroidX-20) < -200)
    asteroidSpeed *= -1;
  
  
  fill (225, 225, 225);
  ellipse(asteroidX, asteroidY, 40, 40);
  asteroidX += asteroidSpeed;
  if ((asteroidX+20) > width*2 || (asteroidX-20) < -200)
    asteroidSpeed *= -1;
  }

