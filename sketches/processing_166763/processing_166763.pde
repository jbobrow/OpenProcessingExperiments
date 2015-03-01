

// principal of recall 


boolean button = false;
PImage poopimage;
PImage poopimage2;

PFont poopfont;

void setup() {

  smooth();
  size(640, 844);
  background(255);

  poopfont = loadFont("Helvetica.vlw");
  poopimage = loadImage("helvetica.jpg");
  poopimage2 = loadImage("scala.jpg");
}

void draw() {

  smooth();

  fill(0);
  textAlign(LEFT);
  textFont(poopfont, 20);
  smooth();
  text("Can you recognize the typeface?", 110, 100);
  smooth();
  text("Click each letter to reveal.", 110, 122);

  imageMode(CENTER);

  // Helvetica 'a'

  image(poopimage, width/2-145, height/2, 200, 200);

  // FF Scala 'a'

  image(poopimage2, width/2+145, height/2, 200, 200);


  line(width/2, height/2-135, width/2, height/2+130);
  stroke(0);
}

void mouseClicked() {

  // Helvetica click 

  float d = dist(mouseX, mouseY, width/2-145, height/2);
  if (d<=200) {
    if (button == false) {
      button = true;
    } else if (button == true) {
      button = false;

      textAlign(CENTER);
      textFont(poopfont, 18);
      smooth();
      text("Helvetica", width/2-145, height/2+150);
    }
  }

  // Helvetica click 

  float d2 = dist(mouseX, mouseY, width/2+145, height/2);
  if (d2<=200) {
    if (button == false) {
      button = true;
    } else if (button == true) {
      button = false;

      textAlign(CENTER);
      textFont(poopfont, 18);
      smooth();
      text("FF Scala", width/2+145, height/2+150);
    }
  }
}








