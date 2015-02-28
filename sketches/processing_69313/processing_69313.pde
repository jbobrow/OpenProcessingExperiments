
// My best imitation of Robert Delaunay's Pemier Disque.
// It didn't go as well as I had hoped, becuase of the unique nature of the painting.
// I copied the concentric circle pattern in his painting.
// I also copied the abnormal color scheme- which has no real identifiable pattern.
// http://uploads0.wikipaintings.org/images/robert-delaunay/premier-disque.jpg

int i = 100;

smooth();
fill(40, 10, 0);
arc(50, 50, i, i, PI+HALF_PI, TWO_PI);   // Quadrant 1
fill(20, 0, 40);
arc(50, 50, i, i, PI, PI+HALF_PI);       // Quadrant 2
fill(65, 0, 0);
arc(50, 50, i, i, HALF_PI, PI);          // Quadrant 3
fill(75, 25, 50);
arc(50, 50, i, i, 0, HALF_PI);           // Quadrant 4

i = i - 15;

smooth();
fill(15, 50, 0);
arc(50, 50, i, i, PI+HALF_PI, TWO_PI);   // Quadrant 1
fill(0, 100, 20);
arc(50, 50, i, i, PI, PI+HALF_PI);       // Quadrant 2
fill(75, 255, 150);
arc(50, 50, i, i, HALF_PI, PI);          // Quadrant 3
fill(200, 0, 200);
arc(50, 50, i, i, 0, HALF_PI);           // Quadrant 4


i = i - 15;

smooth();
fill(50, 0, 75);
arc(50, 50, i, i, PI+HALF_PI, TWO_PI);   // Quadrant 1
fill(175, 175, 200);
arc(50, 50, i, i, PI, PI+HALF_PI);       // Quadrant 2
fill(10, 0, 10);
arc(50, 50, i, i, HALF_PI, PI);          // Quadrant 3
fill(0, 15, 110);
arc(50, 50, i, i, 0, HALF_PI);           // Quadrant 4

i = i - 15;

smooth();
fill(0, 0, 255);
arc(50, 50, i, i, PI+HALF_PI, TWO_PI);   // Quadrant 1
fill(250, 250, 0);
arc(50, 50, i, i, PI, PI+HALF_PI);       // Quadrant 2
fill(150, 0, 255);
arc(50, 50, i, i, HALF_PI, PI);          // Quadrant 3
fill(0, 0, 0);
arc(50, 50, i, i, 0, HALF_PI);           // Quadrant 4


i = i - 15;

smooth();
fill(20, 0, 20);
arc(50, 50, i, i, PI+HALF_PI, TWO_PI);   // Quadrant 1
fill(25, 25, 0);
arc(50, 50, i, i, PI, PI+HALF_PI);       // Quadrant 2
fill(0, 0, 30);
arc(50, 50, i, i, HALF_PI, PI);          // Quadrant 3
fill(55, 55, 55);
arc(50, 50, i, i, 0, HALF_PI);           // Quadrant 4

i = i - 15;

smooth();
fill(200, 200, 0);
arc(50, 50, i, i, PI+HALF_PI, TWO_PI);   // Quadrant 1
fill(0, 200, 200);
arc(50, 50, i, i, PI, PI+HALF_PI);       // Quadrant 2
fill(220, 0, 220);
arc(50, 50, i, i, HALF_PI, PI);          // Quadrant 3
fill(0, 0, 200);
arc(50, 50, i, i, 0, HALF_PI);           // Quadrant 4


i = i - 15;

smooth();
fill(0, 0, 255);
arc(50, 50, i, i, PI+HALF_PI, TWO_PI);   // Quadrant 1
fill(0, 0, 255);
arc(50, 50, i, i, PI, PI+HALF_PI);       // Quadrant 2
fill(255, 0, 0);
arc(50, 50, i, i, HALF_PI, PI);          // Quadrant 3
fill(255, 0, 0);
arc(50, 50, i, i, 0, HALF_PI);           // Quadrant 4


