
/* 
== Artistic intent ==
I initially wanted to create a bezier drawing sketch, inspired from a brief sketch I've done somewhat earlier. 
I also saw this as good practice to figure out how classes and array lists exactly work.

The sketch itself is very simple and perhaps a little unfinished, but it's interesting to play around with the fill and count of the beziers.
Changing the count by pressing up or down changing the amount of points needed for a new bezier curve to be drawn - it also draws curves retroactively when the count is decreased.
This results in interesting sequence of drawing the beziers, same goes for the fill - as the count applies to that aswell.


== Input configuration ==
UP (up arrow) = increases the count of points needed to create a bezier curve.
DOWN (down arrow) = decreases the count of points needed to create a bezier curve, to a minimum of 1 extra per curve.

'f' or 'F' = Fill the bezier curves with a faint opacity fill.

BACKSPACE = clear canvas.
's' or 'S' = screenshot.

*/


ArrayList bList;
float s;
float o;
int count = 4;
boolean FILL= false;

void setup() {
  size(800, 800);
  bList = new ArrayList();
  background(0);
  frameRate(60);
}

void draw() {
  for (int i = 3; i<bList.size(); i+=count) {
    bez a1Point=(bez)bList.get(i);
    bez c1Point=(bez)bList.get(i-1);
    bez c2Point=(bez)bList.get(i-2);
    bez a2Point=(bez)bList.get(i-3);
    float x1 = a1Point.x;                //1st anchor point
    float y1 = a1Point.y;
    float x2 = c1Point.x;                //1st control point
    float y2 = c1Point.y;
    float x3 = c2Point.x;                //2nd control point
    float y3 = c2Point.y;
    float x4 = a2Point.x;                //2nd anchor point
    float y4 = a2Point.y;
    float s1 = a1Point.s;                //stroke point
    float s4 = a2Point.s;
    float o1 = a1Point.o;                //alpha/opacity point
    float o4 = a2Point.o;
    stroke((s1+s4)/2, (o1+o4)/2);
   if(FILL == true){
     fill(o1/4,o4/10);}
     else{
       noFill();}
    strokeWeight (1);

    bezier(x1, y1, x2, y2, x3, y3, x4, y4);
  }
  println(count);
}

void mousePressed() {
  noStroke();
  s = random(150, 255);
  o = random(150, 255);
  bez myBezier = new bez(mouseX, mouseY, s, o);
  myBezier.display();
  bList.add(myBezier);
}

void keyPressed() {
  if (key == BACKSPACE){
    background(0);
    bList.clear();
  }
  if (key == 'f'|| key == 'F') {
    FILL = !FILL ;
  }
  if (key== 's'|| key == 'S') {
    saveFrame("output/screen####.jpg");
  }
  if (key == CODED) {
    if (keyCode ==  UP) {
      count++;
    }
    if (count >1) {
      if (keyCode ==  DOWN) {
        count--;
      }
    }
  }
}

class bez {

  float x;
  float y;
  float s;
  float o;

  bez(float _x, float _y, float _s, float _o) {
    x = _x;
    y = _y;
    s= _s;
    o= _o;
  }

  void display() {
    strokeWeight(10);
    stroke(s, o-100);
    point(x, y);
    strokeWeight(4);
    stroke(s, o);
    point(x, y);
  }
}



