
// Candice Ferreira. Problem set 2 Question 5
//cute face eyes move

Face f = new Face();
//declare an object


void setup () {
  size (600, 600);
  background(0);
  f = new Face ();
  noStroke();
}

void draw() {
  background(0);
  f.displayFace();
  f.eyes();
}





//_______________face__________

class Face {
  float x = width/2;
  float y = height/2;

  float b = 380;
  float f = 250;
  float g = 60;
  float h = 80;
  float i = 20;

  void displayFace () {



    fill(200, 0, 200);
    ellipse (x, y, b, b);
    //mouth
    fill(0);
    ellipse( x, b, h, h);


    
  }

  void eyes() {
    //left eye
    if (mousePressed) g = map(mouseX, 0, width, 40, 200);
    fill(0);
    ellipse (x+3*i, f, g, g);
    //right eye
    fill(0);
    ellipse (x-3*i,f, g, g);
    //left pupil
    fill(0, 0, 255);
    ellipse (x-3*i, f, i, i);
    //right pupil
    fill (0, 0, 255);
    ellipse (x+3*i, f, i, i);
  }
}


