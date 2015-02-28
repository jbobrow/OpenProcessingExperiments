
//jewel chiosi 10/17/13, 10/20/2013, 10/25/2013

//new move(): non-interactive: devil runs right, in zig-zagging pattern on y axis
//new fire(): interactive: devil spits fireballs towars right hand side, if __ key pressed 

Devil badGuy;

void setup() {
  size(800, 600);
  //initialize devil 
  badGuy = new Devil();
}

void draw() {
  background(0);
  badGuy.display();
  badGuy.move();
  badGuy.fire();
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

  color fire1;
  color fire2;
  color fire3;
  float fireX;
  float fireY;
  boolean fire;
  float fireSpeed;

  //constructor 
  Devil() {

    devilDeets1 = color(180, 0, 0);
    devilDeets2 = color(70, 0, 20);
    devilDeets3 = color(0);
    x= -40;
    y= random(height-size, size);
    xSpeed = .5;
    ySpeed = 3.5;
    size = 80;
    strokeW8 = 4;


    fire1 = color(255, 53, 3);
    fire2 = color(255, 116, 3);
    fire3 = color(255, 211, 31);
    boolean fire = false;
    fireSpeed = 5;
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
    //x movement
    x = x + xSpeed;

    //y movement (zig zag)
    y = y + ySpeed;

    if (y >= height+size*3) {
      ySpeed = ySpeed*-1;
    }

    if (y <= -size*3) {
      ySpeed = ySpeed*-1;
    }
  }

  void fire() {  

    if (!fire) {
      if (keyPressed) {
        if (key == ' ') {

          //openmouth
          noStroke();
          fill(devilDeets3);
          rect(x-17, y-8, size/2.35, size/2.35);


          //draw fire
          noStroke();
          fill(fire3);
          ellipse(fireX, fireY+8, size/4, size/4);

          fill(fire2);
          ellipse(fireX+10, fireY+8, size/4, size/4);

          fill(fire1);
          ellipse(fireX+20, fireY+8, size/4, size/4);

          //set fire
          fireX = x;
          fireY = y;
          fireX = fireX + fireSpeed; 
       }
      }
    }
  }
}
