


class Point {
  int x;
  int y;
  public Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

int recording = 0;
boolean playing = false;
int playCounter = 0;
int playDiff = 1;

ArrayList[] points;

color fillColor = color(0);

void setup() {
  size(800, 800);

  points = new ArrayList[10];  
  for (int i = 0; i < 10; i++) {
    points[i] = new ArrayList();
  }
}

void draw() {
  background(89);

  if ( !playing ) {
    for (int i = 0; i < 10; i++) {
      if ( points[i].size() > 0 ) {
        beginShape();
        noFill();
        stroke(0);
        for (int j = 0; j < points[i].size(); j++) {
          Point p = (Point)points[i].get(j);
          vertex(p.x, p.y);
        }
        endShape();
      }
    }
    
  } else {

    //stroke(0);
    //strokeWeight(2);
    noStroke();
    fill(fillColor);
    beginShape();
    for (int i = 0; i < 10; i++) {
      if ( points[i].size() > 0 ) {
        Point p = (Point)points[i].get(playCounter);
        vertex(p.x, p.y);
      }
    }
    endShape(CLOSE);

    int minCount = points[0].size();
    for (int i = 0; i < 10; i++) {
      if ( points[i].size() > 0 && points[i].size() < minCount ) {
        minCount = points[i].size();
      }
    }
    println("mc="+minCount); // + " " + points1.size() + " " + points2.size() +" "+points3.size() +" "+ points4.size());

    playCounter = playCounter + playDiff;
    if ( playCounter == 0 ) playDiff = 1;
    if ( playCounter == minCount-1 ) playDiff = -1;
  }
}

void mouseDragged() {
  println(recording);
  ArrayList pointArray = points[recording];
  pointArray.add(new Point(mouseX, mouseY));
}

void keyPressed() {
  if ( key >= '1' && key <= '9' ) {
    recording = key - '1';
  } 
  else if ( key == ' ' ) {
    playing = true;
    playCounter = 0;
  } 
  else if ( key == 'c' ) {
    playing = false;
    for (int i = 0; i < 10; i++) {
      points[i] = new ArrayList();
    }
    playCounter = 0;
    playDiff = 1;
  } else if ( key == 'r' ) {
    fillColor = color(255,0,0);
  } else if ( key == 'o' ) {
    fillColor = color(255,150,0);
  } else if ( key == 'y' ) {
    fillColor = color(255,255,0);
  } else if ( key == 'g' ) {
    fillColor = color(0,255,0);
  } else if ( key == 'b' ) {
    fillColor = color(0,0,255);
  } else if ( key == 'i' ) {
    fillColor = color(255,0,100);
  } else if ( key == 'v' ) {
    fillColor = color(255,0,255);
  } 
}

