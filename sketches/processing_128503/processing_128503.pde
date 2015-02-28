
/**
 Assignment Seven
 
 More complex agents at work. Now capable of adjusting themselves according to their
 surroundings. Note: I used only integers because they were faster and floats would
 act strangely after only a dozen circle had been generated.
 
 Alexandre Seite
 01/15/2014
 **/
 
Circle circles[];
int numCircles=0;
int minArray[];
//I used the second array to determine what radius each new circle should have.
void setup() {
  size(700, 700);
  background(0);
  colorMode(HSB,360,100,100,100);
  circles = new Circle[1000];
}

void draw() {
  if (numCircles<circles.length) {
    Circle c=new Circle();
//The update function here adjust the radius of the new circle according to the previous ones.
    c.update(numCircles);
    //if this if condition fails, a new circle is generated instead
    if (c.radius>=1) {
      circles[numCircles]=c;
      numCircles++;
      for (int i=0;i<numCircles;i++) {
        circles[i].paint();
      }
    }
  }
}

class Circle {
  int x, y;
  int radius;
  int hue, saturation;

  Circle() {
    x=(int)random(2, width-2);
    y=(int)random(2, height-2);
    hue=(int)random(0, 360);
    saturation=(int)random(50,75);
    //first step, generates a radius that would not leave the canvas.
    if (y<100 && x>=y && x<=width-y) {
      radius=y;
    } 
    else if (y>height-100 && x<y && x>=width-y ) {
      radius=(height-y);
    } 
    else if (x<100 && x<y && x<=width-y) {
      radius=(x);
    }
    else if (x>width-100 && x>=y && x>=width-y) {
      radius=(width-x);
    }
    else {
      radius=100;
    }
  }

  void update(int index) {
    if (index>0) {
      minArray = new int[index+1];
      minArray[0]=radius;
      /*the array stores all the potiential radius values depending
      on the distance to the edge of every other circle*/
      for (int i=0;i<index;i++) {
        int distance =(int) dist(circles[i].x, circles[i].y, x, y);
        minArray[i+1]= distance-circles[i].radius;
      }
      //here we determine what the smallest radius is
      int min=100;
      for (int i=0;i<index+1;i++) {
        min= min(min, minArray[i]);
      }
      //and assign it.
      radius=min;
    }
  }

  void paint() {
    fill(hue, saturation, 100);
    noStroke();
    ellipse(x, y, radius*2, radius*2);
  }
}

void keyReleased() {
  switch(key) {

  case 's':
    saveFrame("aseite_hw7_####.png");
    break;
  }
}



