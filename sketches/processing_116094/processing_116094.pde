
Particle[] particleArray = new Particle[1000];

void setup() {
  size(1200, 700);
  for (int i = 0; i < 1000; i++) {
    //particleArray[i] = new Particle ((int)random(width),(int)random(height));
    particleArray[i] = new Particle ((int)random(width), (int)random(height));  
    //particleArray[i] = new Particle (width/2, height/2);
}
}

void draw() {
  background(0);

  for (int i = 0; i < 1000; i++) {
    particleArray[i].particleMove();
    particleArray[i].particleDisplay();
    particleArray[i].particleBright();
  }
}

class Particle {   
  int x;             
  int y;

  Particle(int tempX, int tempY) {       //constructor 
    x = tempX;
    y = tempY;
  }

  void particleDisplay() {   //function to that displays initial location of particle objects
    //noStroke();
    stroke(75,150,175, 125);
    fill(75, 150, 175, 125);
    //ellipse(x, y, 5, 7);
    line(x,y,y,x);  
}
  void particleMove() {      //function that moves particle objects
    int choice = int(random(4));

    if (choice == 0) {         //particle objects move according random number generated before
      x = x + 1;
    } 
    else if (choice == 1) {
      x = x - 1;
    } 
    else if (choice == 2) {
      y = y + 1;
    } 
    else {
      y = y - 1;
    }
  }
  //add functionality: when mouse moves through particle objects, they are thrown out of the way with natural physics
  void particleBright() {
    if (keyPressed) {
      println("key is being pressed!");
    }
  }
}



