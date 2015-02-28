


PImage sniper;
PImage st; 
PImage grass;
float grassX;
float grassSpeed;

void setup() {
  size(500, 500);
  smooth();
  frameRate(2);

  sniper = loadImage( "sniper.png");
  st = loadImage( "st.png" );
  grass = loadImage ( "grass2.jpg");
  grassX = -199;
  grassSpeed =10;
}

void draw() {
  background(200);


  image(grass, grassX, -200);
  grassX = grassX+grassSpeed;
  
  //barkground_mountain
  if (grassX > 0 || grassX <-200) {
    grassSpeed = grassSpeed*-1;
  }
  
  
  
  //shooting target
  float x = random(width);
  float y = random(0, 300);
  float dx = map(x, 0, width, 36, 288);
  float dy = map(y, 0, height, 54, 433); 
  image(st, x, y, 108, 166);


  //sniper
  float sniperY = random(253, 270);
  image(sniper, 0, sniperY);
} 



