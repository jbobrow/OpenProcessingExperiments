

PFont font;
String input = "Time";
float angle = 0;
PImage turn;
PImage time;
void setup() 
{ 
  size(500,400);
    time = loadImage("clock.gif");
  turn = loadImage("time.gif");
  textAlign(CENTER,CENTER);
}

void draw() {
  image(turn,0,0);
  translate(width/2,height/2);
  rotate(radians(angle));

  image(time,0,0);

  angle += 2;
}






