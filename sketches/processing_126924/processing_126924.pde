
PFont mozi;
PImage img;

int angle;

void setup(){
  img = loadImage("apple_white.png");
  mozi = loadFont("Aharoni-Bold-96.vlw");
 
  size(450, 450, P3D);
  angle = 0;
  fill(255);
}

void draw(){
  //haikei
  background(10,10,10);
  
  //mozi
  textFont(mozi, 64);
  text("Apple", 160, 425);
  
  //gazou
  imageMode(CENTER);
  
  //kaitensokudo
  angle += 1;
  if(angle > 360) angle = 0;
  if(angle < -360) angle = 0;
  
  //gazou
  tint(random(100,200));
  translate(225, 55,-50);
  rotateY(radians(-angle*2));
  image(img, -125,0);
  rotateY(radians(angle*2));
  translate(-225,-55,50);
  
  //hakonoiro
  fill(random(200,255),50,50);
  
  //hakono3Dsettei
  for(int x = 0; x <= 800; x += 20){
   for(int y = 0; y <= 200; y += 20){
  translate(490, 1 );
  rotateY(radians(angle));
  box(50, 50, 50);
   }
  }
 }
  
  //kurikkudekonntoro-ru
 void mouseMoved(){
   fill(255);
   angle = mouseX*4/5;
 }
 


