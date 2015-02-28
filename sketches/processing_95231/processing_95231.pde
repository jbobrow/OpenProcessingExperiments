
int x;
int y;

void setup() {
  size(600, 600);
  frameRate(180);
  background(255);
  smooth();
}

void draw() {


  strokeWeight(2);
  smooth();
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
  noFill();

  triangle(width/4, height/8, width/8, 3*height/8, 3*width/8, 3*height/8);
  rectMode(CORNER);
  rect(width/8, 5*height/8, width/4, height/4);

  ellipse(3*width/4, 3*height/4, width/4, height/4);

  rect(5*width/8, height/8, width/4, height/4);
  ellipse(3*width/4, height/4, width/4, height/4);
  triangle(3*width/4, height/8, 5*width/8, 3*height/8, 7*width/8, 3*height/8);

  if (mousePressed) {
    background(255);

    x = mouseX;
    y = mouseY;


    if (x<width/2 && y<height/2) {

      noStroke();
      fill(random(255), random(255), random(255), random(100, 255));
      triangle(width/2, random(y, height/2), random(x, width/2), random(height/2, height-y), random(width/2, width-x), random(height/2, height-y));

      strokeWeight(2);
      noFill();
      stroke(0);
      rectMode(CENTER);
      rect(width/2, height/2, 2*(width/2-x), 2*(height/2-y));
    }

    else if (x>width/2 && y<height/2) {
      //remove stroke
      noStroke();
      fill(random(255), random(255), random(255), random(100, 255));
      ellipse(width/2, height/2, random(2*(x-width/2)), random(2*(height/2-y)));
      fill(random(255), random(255), random(255), random(100, 255));

      rectMode(CENTER);
      rect(width/2, height/2, random(2*(x-width/2)), random(2*(height/2-y)));
      fill(random(255), random(255), random(255), random(100, 255));
      triangle(width/2, random(y, height/2), random(width-x, width/2), random(height/2, height-y), random(width/2, x), random(height/2, height-y));
      fill(random(255), random(255), random(255), random(100, 255));


      noFill();
      //reset stroke
      stroke(0);
      rectMode(CENTER);
      rect(width/2, height/2, 2*(x-width/2), 2*(height/2-y));
    }

    else if (x<width/2 && y>height/2) {
      //remove stroke
      noStroke();
      fill(random(255), random(255), random(255), random(100, 255));
      rectMode(CENTER);
      rect(width/2, height/2, random(2*(width/2-x)), random(2*(y-height/2)));

      noFill();
      //reset stroke
      stroke(0);
      rectMode(CENTER);
      rect(width/2, height/2, 2*(width/2-x), 2*(y-height/2));
    }

    else if (x>width/2 && y>height/2) {
      //remove stroke
      noStroke();
      fill(random(255), random(255), random(255), random(100, 255));
      ellipse(width/2, height/2, random(2*(x-width/2)), random(2*(y-height/2)));

      noFill();
      //reset stroke
      stroke(0);
      rectMode(CENTER);
      rect(width/2, height/2, 2*(x-width/2), 2*(y-height/2));
    }
    else {
    }
  }
}

void mouseReleased() {
  setup();
}



