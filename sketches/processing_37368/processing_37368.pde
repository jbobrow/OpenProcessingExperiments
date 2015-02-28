


void setup() {
  size(300, 300);
  background(0);
}

void draw() {

  for (int x=50;x<width;x+=50) { //spacing on x-axis
    for (int y=50;y<height;y+=50) { //spacing on y-axis
      //set up for the ellipses
      noFill();
      stroke(255);
      strokeWeight(4);
      smooth();
      ellipse(x, y, 80, 80);
      //setup for thelines
      stroke(255, 0, 0);
      strokeWeight(.5);
      line(x, y, 0, width);//lines coming from bottom left
      line(x, y, 0, 0);//lines coming from top left
      line(x, y, width, height);//lines coming from bottom right
      line(x, y, height, 0);//lines coming from top right
    }
  }
}


