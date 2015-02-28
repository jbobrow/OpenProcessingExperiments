
PImage pink, brown, black, lime;
float x,y;
 
void setup(){
  size(600,600);
   
  pink = loadImage("pink.gif");
  brown = loadImage("brown.gif");
  black = loadImage("black.jpg");
  lime = loadImage("lime.jpg");
 
}
 
void draw(){
  background(#98161a);
  float mx = map(mouseX,0,width,0,800);
  float ma = map(mouseX,0,width,40,1);
   
  drawShape(pink, ma, mx);
  drawShape(brown, ma/2, mx+10);
  drawShape(black, 30, mx+20);
  drawShape(lime, 40, mx+40);
}
 
void drawShape(PImage img, float ma, float mx){
  pushMatrix();
  translate(width/2,height/2);
  for(float ang=0;ang<360-ma;ang+=ma){
    x = mx * cos(radians(ang));
    y = mx * sin(radians(ang));
    //rotate(radians(ang));
    image(img, x, y);
  }
  popMatrix();
}

