

color black = color(40);
color canvas = color(200);



void setup() {

  size(780, 500);
  background(200);
  smooth();
}


void draw() {

  strokeWeight(abs((mouseX-50)/5-pmouseX/5));
  stroke(black);
  line(mouseX, mouseY, pmouseX, pmouseY);

  noStroke();
  fill(black);
  float range = random(2, 50);
  ellipse(pmouseX+(range+5), pmouseY+(range-5), range-30, range-30);
}



void keyTyped() {

  //colors:

  if (key=='r' || key=='R') {
    black = color(255, 10, 20);
  }

  if (key=='t' || key == 'T') {
    black=color(85, 190, 85);
  }

  if (key=='y' || key == 'Y') {
    black=color(255, 210, 65);
  }
  if (key=='u' || key == 'U') {
    black=color(255, 250, 215);
  }


  if (key=='f' || key=='F') {
    black = color(255);
  }

  if (key=='h' || key == 'H') {
    black=color(255, 140, 160);
  }

  if (key=='j' || key == 'J') {
    black=color(50, 60, 100);
  }
  if (key=='k' || key == 'K') {
    black=color(90, 150, 230);
  }



  if (key=='v' || key=='V') {
    black = color(170, 175, 180);
  }

  if (key=='b' || key == 'B') {
    black=color(40);
  }

  if (key=='n' || key == 'N') {
    black=color(125, 130, 65);
  }
  if (key=='m' || key == 'M') {
    black=color(240, 120, 0);
  }


// saveFrame:

  if (key=='s' || key == 'S') {
    saveFrame("pollocker-####.jpg");
  }

// New Canvas:

  if (key=='z' || key == 'Z') {
    background(canvas);
  }


    // Learning Processing
    // Daniel Shiffman
    // http://www.learningprocessing.com

    // Example 3-4: Drawing a continuous line
  }


