
// creating a clss in character project
Izzy izzy;
Izzy izzy2;
Izzy izzy3;

void setup() {
  size(800,800);
  smooth();

  izzy = new Izzy(10, 150);
  izzy2 = new Izzy(400, 150);
  izzy3 = new Izzy(600, 150);

}

void draw() {
  izzy.display();


  izzy2.display();


  izzy3.display();
}


class Izzy {
  
  //variables
  int k = 355;
  int g = 205;
  int s = 255;
  int c = (0);
  int l = (0);
  int r = (0);
  int z = 223;
  int t = 255;
  
  
  float x;
  float y;
  //comstructor: gives initail values to variables when program is first drawn

  Izzy(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }
}


void display() {
  background(237, 198, 124);
  randomSeed(0);
  for (int x = 1; x <width + 10; x += 200){
    izzy(x,80);
  }
}

void izzy (int x, int y) {
    //moves izzy
    pushMatrix();
    translate(x, y);
    //body
    fill(random(z, t), random(z, t), random(z, t));
    rect(200, 150, 200, 300, 20);

    //left eye
    fill(240, 189, 213);
    ellipse(250, 200, 40, 40);
    //left puple
    fill(5, 5, 5);
    ellipse(s, g, 20, 20);
    if (mousePressed == true) {
      s = 250;
      g = 200;
    }
    else if (mousePressed == false) {
      s = 255;
      g = 205;
    }


    //right eye
    fill(240, 189, 213);
    ellipse(350, 200, 40, 40);


    //right puple
    fill(5, 5, 5);
    ellipse(k, g, 20, 20);
    if (mousePressed == true) {
      k = 350;
      g = 200;
    }
    else if (mousePressed == false) {
      k = 355;
      g = 205;
    }
    //mouth
    fill(c, l, r);
    ellipse(300, 300, 70, 70);
    if (mousePressed == true) {
      c =44;
      l =71;
      r =240;
    }
    else if (mousePressed == false) {
      c = (0);
      l = (0);
      r = (0);
    }

    //leftfoot
    fill(0);
    noStroke();
    arc(240, 460, 50, 50, PI, TWO_PI);
    //right foot
    arc(350, 460, 50, 50, PI, TWO_PI);
    //left arm
    rect(190, 290, 20, 60);
    ellipse(200, 286, 20, 20);
    //right arm
    rect(390, 290, 20, 60);
    ellipse(400, 286, 20, 20);
    popMatrix();
  }



