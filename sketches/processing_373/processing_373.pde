
/* Bruno Kruse City Landscape */
// An introductory to processing by drawing a city landscape to the screen

// INITIAL SETUP
size(300,100);

// BACKGROUND
/* To draw the background I will be using a loop to draw horizontal lines
 which change RGB values to create the illusion of a gradient. */
int x1 = 0;
int y1 = 0;
int x2 = 300;
int y2 = 0;

int R1 = 19;
int G1 = 19;
int B1 = 81;

// The initial dark blue color
stroke(R1,G1,B1);
// This loops draws 100 horizontal lines
for (int x=0; x<=100; x++){
  stroke(R1,G1,B1);
  line(x1,y1,x2,y2);
  y1++;
  y2++;
  G1++;

}

// Variables for the star loop
int x = 0;
float randomX;
float randomY;

// DRAW SOME STARS

stroke(255);
strokeWeight(2);

// Creates a loop to draw 50 stars to the background
for (int i=0;i<50;i++){
  randomX = random(0,300);
  randomY = random(0,100);
  point(randomX,randomY);
}
// MOON!!
stroke(200,200,200);
fill(200,200,200);
ellipseMode(CENTER);
smooth();
ellipse(40,20,15,15);

// Initialization for the buildings
// Each building is hand coded. Perhaps in the future I can create a procedurally generated skyline.
stroke(0);
strokeWeight(2);
smooth();

// black buildings
fill(0);

//building 1
rect(0,70,20,60);

//building 2
rect(20,80,25,60);

//building 3
rect(45,50,30,50);
rect(50,45,20,10);
triangle(55,45,65,45,60,30);

//building 4
rect(80,80,10,20);
rect(85,60,10,40);

//building 5
rect(95,30, 30, 70);
rect(100,25,20,5);

//building 6
rect(125, 60, 40, 40);

//building 7
rect(165,40,25,60);
triangle(170,40,175,40, 172,30);
triangle(182,40,187,40, 185,30);

//building 8
rect(190,80,10,20);
rect(195,20,20,80);
rect(215,30,10,70);
rect(225,40,5,60);

//building 9
rect(230,90,70,10);
rect(235,85,10,10);
rect(250,75,40,30);
rect(260,20,20,80);
rect(265,10,10,10);
triangle(268,10,272,10,270,0);

