
float px, py, px2, py2;
float angle, angle2;
float radius = 100;
float frequency = 2;
float frequency2 = 2;
float x, x2;

PFont myFont;

void setup(){
  size(900, 400);
  background (127, 40, 40);
  myFont = createFont("YOU'RE A DUMMY", 12);
  textFont(myFont);
}

void draw(){
  background (255, 56, 43);
   myFont = createFont("YOU'RE A DUMMY", 1);
  textFont(myFont);
  noStroke(40);
  fill(40, 50, 255);
  ellipse(width/70, 200, radius*2, radius*2);
  px = width/70 + cos(radians(angle))*(radius);
  py = 200 + sin(radians(angle))*(radius);
  rectMode(CENTER);
  fill(0);
  rect (px, py, 5, 5);
  stroke(40);
  line(width/500, 300, px, py);
  stroke(30, 255, 200);
  angle2 = 0;
 

  for (int i = 0; i< width; i++){
    px2 = width/30 + cos(radians(angle2))*(radius);
    py2 = 300 + sin(radians(angle2))*(radius);
    point(width/8+radius+i, py2);
    angle2 -= frequency2;
  }

 
  noStroke();
  ellipse(width/8+radius+x, py, 30, 30);
  angle -= frequency;
  x+=1;


  if (x>= width-50) {
    x = 0;
    angle = 1;
  }


  stroke(255);
  line(px, py, width/30+radius+x, py);

  text("y = sin x", 35, 185);
  text("px = " + px, 105, 185);
  text("py = " + py, 215, 185);
  
}
