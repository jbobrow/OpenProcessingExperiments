
Walker[] walkers;


void setup() {
     size(800, 800);
     walkers = new Walker[1000];
     for (int i = 0; i < walkers.length; i = i + 1) {
          walkers[i] = new Walker();
     }
}

void draw() {
     for (int i = 0; i < walkers.length; i = i + 1) {
          walkers[i].move();
          walkers[i].render();
     }
} 

class Walker {
     float x, y, colour;

     //constructor
     Walker() {
          x = width/2;
          y = height/2;
          colour = random(0,255);
     }

     void move() {
          int choice = (int)random(0, 5) + 1;
          if (choice == 1)
               x = x + 1;
          if (choice == 2)
               x = x - 1;
          if (choice == 3)
               y = y + 1;
          if (choice == 4)
               y = y - 1;
     }
     
     void render() {
          stroke(colour);
          fill(colour);
          ellipse(x, y, 10, 10);
     }
}



