
//Sam Legros, Exercise 7, Question 1

// To this sketch, I added the Soot coding, as well as a body and
// limb to create a stick character. I noticed that the arm's
// basic movement resembles a basic waving-like form. That being
// said, I decided to add a welcoming text whenever the mouse would
// move the arm in such a manner that replicated a "wave". I also
// changed the strokeWeight to make the stick character more 'stick'-
// like. I believe my changes to this sketch brings life to the
// simple concept. From a single arm, to a person with a 'voice'.

Soot guy; // Face added

float x, y;
float angle1 = 0.0;
float angle2 = 0.0;
float segLength = 100;

void setup() {
  size(640, 360);
  strokeWeight(3);
  stroke(255, 160);

  guy = new Soot(150, 120, 80);

  x = width * 0.3;
  y = height * 0.5;
}

void draw() {
  background(0);

  line(150, 180, 150, 500); // Body
  line(110, 180, 80, 260); // Left arm

  guy.display();

  angle1 = (mouseX/float(width) - 0.5) * -PI;
  angle2 = (mouseY/float(height) - 0.5) * PI;

  pushMatrix();
  segment(x, y, angle1); 
  segment(segLength, 0, angle2);
  popMatrix();

  if (mouseY < height/2 && mouseX > width/2) { // Welcoming text
    fill(255);
    ellipse(150, 148, 20, 10);
    ellipse(500, 90, 200, 70);
    triangle(500, 70, 500, 110, 380, 120);
    textSize(30);
    fill(128);
    text("Hello there!", 420, 100);
  }
}

void segment(float x, float y, float a) {
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
}

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

class Soot {   
  float x;
  float y; 
  float size;  
  Eyeball left;
  Eyeball right; 

  Soot(float x_, float y_, float size_) {
    x = x_; 
    y = y_;
    size = size_; 

    float eyeSize = size * 0.4;
    left = new Eyeball(x-eyeSize/2, y, eyeSize, eyeSize*0.3); 
    right = new Eyeball(x+eyeSize/2, y, eyeSize, eyeSize*0.3);
  } 

  void display() {
    fill(0); 
    ellipse(x, y, size, size);
    left.display();
    right.display(); 
    left.track();
    right.track();
  }
}

///////////////////////////////////////////////////////////////////////

class Eyeball {

  float x;
  float y;   
  float pupilX; 
  float pupilY; 
  float eyeSize; 
  float pupilSize; 
  float pupilLimit; 

  Eyeball( float x_, float y_, float eyeSize_, float pupilSize_ ) {
    eyeSize = eyeSize_; 
    pupilSize = pupilSize_; 
    x = x_;
    y = y_; 
    pupilX = x_; 
    pupilY = y_; 
    pupilLimit = eyeSize/3 - pupilSize/2;
  } 

  void display() { 
    fill(255);
    ellipse(x, y, eyeSize, eyeSize); 
    fill(0);
    ellipse(pupilX, pupilY, pupilSize, pupilSize);
  }

  void track() {
    pupilX = constrain(mouseX, x-pupilLimit, x+pupilLimit); 
    pupilY = constrain(mouseY, y-pupilLimit, y+pupilLimit);
  }
}



