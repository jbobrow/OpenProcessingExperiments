
float angle;
PFont font;
String quote = "infinity";
float easing = 0.5;
float speed = 0.5;

void setup() {

  size(600, 600);
  background(255);

  //-----------------------------------FONT
  font = loadFont("HelveticaNeue-Light-18.vlw");
  textFont(font);
}

void draw() {
  fill(0, 160);
  rect(0, 0, width, height);
  
  //-----------------------------------MOUSE
  float target = dist(mouseX,mouseY,pmouseX,pmouseY);

  speed += (target - speed) * easing;
 
 
  float d = speed * 2;
  
  //-----------------------------------MOTION
  float r = 90.0;
  int a = 3; 
  int b = 6;

  translate(width/2, height/2);
  angle += 0.01;
  for (int i=0; i<360; i++) {
    float x = r* 2*sin(a*angle);
    float y = r*sin(b*angle);

    fill(255);
    text("infinity", x+d, y+d);
  }
}



