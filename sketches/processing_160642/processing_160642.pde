
PImage dcards;
float speed = 1.0;  //rotation speed
float move;
stroke(75,100,220);   //stroke color
void setup() {  //setup function called initially, only once
 background(200,170,200);
 size(720,400);
textSize(40);
text("Cards anyone?", 380, 170); 
}

void draw() {  //draw function loops 
dcards=loadImage("http://www.freestockphotos.biz/pictures/15/15688/Illustration+of+a+play+card+back.png");

fill(200,100,150);  //rect fill color
  move=move+speed;
  //rect(move,move,80);
  if (move > 50.0) {
  move=0;
  }
 translate(width/2, height/2);  //rect position
rotate(PI/move);
rect(100, 50, 80, 50);   //rect size, shape
rect(-100, 85, 80, 50);   //rect size, shape
}
