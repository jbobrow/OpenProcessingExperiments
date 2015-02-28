
//Mandala
//By Joe Brennan

int x, y;
PImage img;


void setup() {
  size(displayWidth, displayHeight);//size(1000,1000) is too big to fit on my laptop screen
  //  line(displayWidth/2, 0, displayWidth/2, height); //Vertical White line
  //  line(0, displayHeight/2, width, displayHeight/2);//Horizontal White line
  //  fill(255, 255, 255);
  //  rect(displayWidth, displayHeight, 50, 50, mouseX - mouseY); Why? doesnt this code work here, where should it go?
}



void draw() {
  x = mouseX;
  y = mouseY;

  rect(displayWidth, displayHeight, 50, 50, mouseX - mouseY);

  if (x < displayWidth/2 && y < displayHeight/2) { //Upper Left Quadrant
    background(227, 46, 46);
  }

  if (x < displayWidth/2 && y > displayHeight/2) { //Lower Left Quadrant
    background(173, 126, 9);
  }

  if (x > displayWidth/2 && y < displayHeight/2) { //Upper Right Quadrant
    background(104, 78, 227);
  }

  if (x > displayWidth/2 && y > displayHeight/2) { //Lower Right
    background(25, 209, 170);
  }

  fill(0);
  ellipse(displayWidth/2, displayHeight/2, 100, 100);

  if (mousePressed) {
    background(0);
    imageMode(CENTER);
    PImage img;
    img = loadImage("jandersonica.jpg");
    image(img, displayWidth/2, displayHeight/2, displayWidth, displayHeight);
  }


  strokeWeight(10);
  line(displayWidth/2, 0, displayWidth/2, height); //Vertical Black line
  line(0, displayHeight/2, width, displayHeight/2);//Horizontal Black line
  noFill();
}




