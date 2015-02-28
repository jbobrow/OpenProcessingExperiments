
int num = 50;                         //number of paths the color will make
Path[] path = new Path [num];

void setup() {
  size(200, 200);
  background(0);
  colorMode(RGB, 300);
  smooth();
  frameRate(15);

  for (int t = 0; t < path.length; t++) {      //seed array
    path[t] = new Path();
  }
}

void draw() {
  for (int t = 0; t < path.length; t++) {
    path[t].update();
    path[t].display();  
  } 
}

class Path {                        //starts the sketch with rectangles at random
                                    //points within the boundaries of the sketch.
  int x = int(random(width));       //also sets up colors - between yellow and red
  int y = int(random(height));
  color myColors = color(255, random(0,255), 0, 80);

  Path() {
  }

  void update() {                      //allows the path of the colors to travel
    x = x + int(random (-10, 10));     //more along the x-axis than the y-axis
    y = y + int(random (-2, 2));       
  }

  void display() {                //sets up what will be displayed in the sketch
    noStroke();
    fill(myColors);
    rect(x, y, 3, 3);
  }
}


