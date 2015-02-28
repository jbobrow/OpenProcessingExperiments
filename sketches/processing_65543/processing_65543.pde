
PImage black;
PImage white;
PImage walle;
PImage ship1;
PImage ship2;
int v;

void setup() {
  size(600, 300);
  smooth();
  black = loadImage("black.png");
  white = loadImage("white.png");
  walle = loadImage("wallE.png");
  ship1 = loadImage("ship1.png");
  ship2 = loadImage("ship2.png");
  
  v = 0;
  
  frameRate(1);
  //imageMode(CENTER);
}
 
void draw() {
  background(255);
  
  float frame = v%15;
  
  //black
  float blackX = frame*30;
  image(black,blackX,140,100,133);
  
  //white
  float whiteX = -200+frame*30;
  float whiteY = random(160,180);
  image(white,whiteX,whiteY,75,100);
  
  //ship1
  float ship1X = -200+frame*140;
  float ship1Y = -150+frame*80;
  float ship1Scale = .6+frame/5;
  float ship1Rotation = -PI/2*frame/15;
  pushMatrix();
  translate(ship1X,ship1Y);
  rotate(ship1Rotation);
  image(ship1,0,0,200*ship1Scale,150*ship1Scale);
  popMatrix();
  
  //ship2
  float ship2X = 600-frame*30;
  float ship2Y = random(-20,60);
  image(ship2,ship2X,ship2Y,100,60);
  
  //wallE
  if (frame <=6 )
  {
    float walleX = 400-frame*20;
    float walleY = 100+frame*10;
    float walleWidth = map(frame,0,9,80,120);
    image(walle,walleX,walleY,walleWidth,140);
  }else{
    float walleX = 280+(frame-6)*80;
    float walleY = 160-(frame-6)*30;
    float walleRotation = PI*2*(frame-6)/15;
    
    pushMatrix();
    translate(walleX,walleY);
    rotate(walleRotation);
    image(walle,0,0,120,140);
    popMatrix();
  }
  
  
  v++;
  
  println(frame);
}

