
SpaceShip myShip;


void setup() {
  size(600, 600);
  myShip = new SpaceShip();
}


void draw() {
  frameRate(120);
  background(5);
  myShip.display(); //draw spaceship on screen
  myShip.move();
}



class SpaceShip {
  int size;
  float speed;
  int x, y; 
  float hue = 0;
  float dir = 1;
  int pulseSize = 0;


  //constructor

  SpaceShip() {
    x = width/2;
    y = height/2;
    speed = 10;
    size = 50;
  }

  //draw spaceship

  void display() { 
    colorMode(HSB, 100);
    stroke(250);

    translate(x, y);



    fill(100*hue, 50, 80, 80);
    ellipse(0, 0, size, size);

    fill(100*hue-10, 50, 80, 80);
    ellipse(0, -size, size, size);

    fill(100*hue-20, 50, 80, 80);
    ellipse(-size, -size, size, size);

    fill(100*hue-30, 50, 80, 80);
    ellipse(-size, 0, size, size);

    fill(100*hue-40, 50, 80, 80);
    ellipse(-size/2, -size/2, 80*hue, 80*hue);
    
    //color pulse!

    if (pulseSize>0) {
      noFill();
      stroke(100*hue, 50, 80, 80);
      strokeWeight(2);
      ellipse(-size/2, -size/2, pulseSize, pulseSize);
      
      strokeWeight(6);
      ellipse(-size/2, -size/2, 3*pulseSize/4, 3*pulseSize/4);
      
      rectMode(CENTER);
      rect(-size/2, -size/2, pulseSize/4, pulseSize/4);
      
    }


    if (hue>1.0) {//regulate color pulse
      dir = -1;
    }

    if (hue<0.0) {
      dir = 1;
    }
    hue+=.01*dir;
  }



  //navigation for spaceship

  void move() { 

    if (keyPressed) {       

      if (key == CODED) {
        if (keyCode == UP) {
          y-=speed;
        } 
        else if (keyCode == DOWN) {
          y+=speed;
        }

        else if (keyCode == LEFT) {
          x-=speed;
        }
        else if (keyCode == RIGHT) {
          x+=speed;
        }
        else if (keyCode == SHIFT) {
          pulseSize = 1;
        }
      }
    }

    // increment pulse
    if (pulseSize>0) {
      pulseSize+=20;
    }
    if (pulseSize>1000) {
      pulseSize=0;
    }
  }

  //shoot pulse
  // void shoot() {
  //    int pulseS;
  //   pulseS = 0;


  //    ellipse(x, y, pulseS, pulseS);



  //    if (key == CODED)
}



