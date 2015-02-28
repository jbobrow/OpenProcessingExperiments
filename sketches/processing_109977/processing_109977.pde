
size(1980, 1080);
background(0);

//grid pattern taken from Brad Borevitz 
// the spacing between points
int space = 30;
// max radius of dots
int ms = 15;
// frequency of pattern
int f = 20;

// a grid of points
for (float x = 0; x<width; x+=space) {
  for (float y = 0; y<height; y+=space) {
    // calculate the size of the point based on the sum of the sin of x and y coordinates
    // note: must take absolute value b/c value could otherwise be negative
    int s =(int) abs(ms*sin(f*x/width)+(ms*sin(f*y/height)));
    println(s);
    textSize(s+1); //s cannot be 0!!!
    fill( random(255), random(255), random(253), random(255));
    text("A", x+50, y+50);
    if (s<=30)
    text("B",x,y);
    if (s<=40)
    text("C",x-50,y-50);
    
    //println("x"+x/width);
  }
}
PFont font; // Declare the variable
font = loadFont("Eureka-90.vlw");
//fill(0);
////textSize();
//text("TEST", 100, 250); // Write "LAX" at coordinate (0,40) text("AMS", 0, 70); // Write "AMS" at coordinate (0,70) text("FRA", 0, 100); // Write "FRA" at coordinate (0,100)
//



