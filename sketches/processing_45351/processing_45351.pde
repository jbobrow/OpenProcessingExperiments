


// ArrayList

Poin[] points = new Poin[1000];

int counter = 0;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  if (mousePressed) {
    points[counter] = new Poin(mouseX, mouseY);
    counter++;
  } 
  else {
    
    beginShape();
    stroke(0);
    fill(255,0,0);
    for (int i = 0; i < counter; i++) {
      //fill(0);
      //rectMode(CENTER);
      //rect(points[i].x, points[i].y, 4, 4);
      vertex(points[i].x,points[i].y);
    }
    endShape(CLOSE);
    
    
    for (int i = 0; i < counter; i++) {
      points[i].x += random(-1, 1);
      points[i].y += random(-1, 1);
    }
  }
}


class Poin {
  float x;
  float y;

  Poin(float x_, float y_) {
    x = x_;
    y = y_;
  }
}

