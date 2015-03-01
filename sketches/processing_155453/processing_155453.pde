
color c = color(225);
float x = mouseX;
float y = mouseY;
float speed = 5;
void setup () {
  size (800,800);
}
void draw () {
  move ();
  display ();
}
void move () {
    x = x + speed;
  if (x > width) {
    x = 5;
  }
}
void display () {
 
  rect (x,x,x,x);
  fill (20,40,60);
  rect (800-x,800-x,-x,-x);
  fill (60,80,100);
  rect (800-x,0+x,-x,x);
  fill (120,140,160);
  rect (0+x,800-x,x,-x);
  fill (180,200,220);


  rect (400+x,400-x,x,-x);
  fill (10,30,50);
  rect (400-x,400+x,-x,+x);
  fill (70,90,110);
  rect (400-x,400-x,-x,-x);
  fill (130,160,190);
  rect (400+x,400+x,x,x);
  fill (210,225,225);
  
  line (400,400,x,x);
  line (400,400,800-x,800-x);
  line (400,400,x,800-x);
  line (400,400,800-x,x);
 
}


