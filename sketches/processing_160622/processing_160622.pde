
PImage photo;
PImage photo2;
float speed = 1.0;
float move;
void setup()
{
photo = loadImage("http://images8.alphacoders.com/397/397989.jpg");
photo2 = loadImage("http://img1.wikia.nocookie.net/__cb20131006090531/powerlisting/images/6/63/SPACE_NEBULA_STARS.jpg");
  size(500,500);
  background(250,0,100)
  frameRate(0)
  noStroke();
}

void draw(){
//background(250,0,100);
move=move+speed;  
image(photo,50,move,150,150);
image(photo2,300,move,150,150);
if (move > 500){
move=0;
}
  int circleSize = 5;
  int circleXpos = mouseX;
  int circleYpos = mouseY;
//  fill(mouseX,mouseY,random(0,255));
fill(255);
  ellipse(circleXpos,circleYpos,circleSize,circleSize);
}
