
//jewel chiosi 10/17/13, 10/20/2013

Devil badGuy;

void setup() {
  size(400, 400);
  //initialize devil 
  badGuy = new Devil();
}

void draw() {
  background(0);
  badGuy.display();
  badGuy.move();
}

//define a class
//variables
class Devil {

  //variables 
  color devilDeets1;
  color devilDeets2;
  color devilDeets3;
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float size; 
  float strokeW8; 

  //constructor 
  Devil() {
    devilDeets1 = color(0, 0, 180);
    devilDeets2 = color(70, 0, 20);
    devilDeets3 = color(0);
    x= 200;
    y=200;
    xSpeed = random(-3, 3);
    ySpeed = random(-3, 3);
    size = 80;
    strokeW8 = 4;
  }

  void display() {
    //the body main of the devil is an ellipse.
    fill(devilDeets1);
    stroke(devilDeets1);
    ellipse(x, y, size/2, size);

    //horns
    stroke(devilDeets2);
    strokeWeight(strokeW8);
    line(x-13, y-35, x-16, y-47);
    line(x+13, y-35, x+16, y-47);

    //brows
    strokeWeight(strokeW8);
    stroke(devilDeets3);
    line(x-15, y-25, x, y-15);
    line(x+15, y-25, x, y-15);

    //eyes
    fill(devilDeets2);
    strokeWeight(strokeW8-1);
    ellipse(x-10, y-15, size/10, size/10);
    ellipse(x+10, y-15, size/10, size/10);

    //mouth
    stroke(devilDeets3);
    line(x-17, y-8, x+17, y-8);

    //legs
    stroke(devilDeets1);
    strokeWeight(strokeW8 + 1); 
    line(x-15, y+28, x-11, y+50);
    line(x+15, y+28, x+11, y+50);

    //arms
    stroke(devilDeets1);
    line(x-20, y, x-29, y+20);
    line(x+20, y, x+29, y+20);
  }

  void move() {
    //incrementing x and y placement...
    x = x + xSpeed;
    y = y + ySpeed;
  }
}
