


PImage sniper;
PImage st, st2, st3; 
PImage BG;

float angle1, angle2;
float aspeed1;
float y1;
float x, x2;
float scaleV;
float t;
float sniperX, sniperY;
int x_scaler;


void setup() {
  size(500, 500);
  smooth();
  imageMode(CENTER);


  sniper = loadImage( "sniper.png");
  st = loadImage( "st.png" );
  st2 = loadImage( "st2.png" );
  BG = loadImage ( "BG.jpg");

  aspeed1 = 0.08;
  t = 0.0;
  x_scaler = 1;
}

void draw() {
  background(255);
  smooth();
  

  //background 
  image(BG, 250, 250);

  // scaling shooting target
  pushMatrix();
  translate(266, 121);
  scale(scaleV);
  scaleV = map(sin(angle2), -1, 1, 0, 0.4);
  angle2 += 0.05;
  image(st2, x2, 0);
  if (scaleV < 0.001) {
    x2 = random(width);
  
  } 
  popMatrix();



  //up-down shooting target
  float y1 = 47 + sin(angle1) * 215;
  image(st, x, y1, 108, 166);
  if (y1 > 261) {
    st = loadImage( "st_red.png" );
  }  
  else {
    st = loadImage( "st.png" );
  }

  if (y1 <-165) {
    x = random (0, width-108);
  }
  angle1 += aspeed1;

  strokeWeight(2);
  stroke(255, 0, 0);
  line(x, 0, x, y1-83);




  //sniper
  
  if ( millis() - t >= 1000) {
    t = millis();
    x_scaler*= -1;

  }
  if ( x_scaler > 0){
    sniperX = 0;
  } else{ sniperX = -140;
  }
  translate(180, 400);
  scale(x_scaler, 1.0);
  image(sniper, sniperX, 0);
  
} 



