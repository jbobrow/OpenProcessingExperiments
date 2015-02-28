
PImage pineapple, sponge, starfish, bg;
float x,y;
 
void setup(){
  size(600,600);
  smooth(); 
  pineapple = loadImage("Pineapple.png");
  sponge = loadImage("SPONGE.png");
  starfish = loadImage("starfish.png");
  bg = loadImage("background.png");
  imageMode(CENTER);
 
}
 
void draw(){
  image(bg, width/2, height/2);
  float mx = map(mouseX,0,width,0,250);
  float ma = map(mouseX,0,width,45,1);
   
  drawShape(pineapple, ma*2, mx/2);
  drawShape(sponge, ma, mx-10);
  drawShape(starfish, 30, mx+20);
}
 
void drawShape(PImage _img, float _max, float _mx){
  pushMatrix();
  translate(width/2,height/2);
  for(float ang=0;ang<360-_max;ang+=_max){
    x = _mx * cos(radians(ang));
    y = _mx * sin(radians(ang));
    rotate(radians(ang));
    image(_img, x, y);
  }
  popMatrix();
}


