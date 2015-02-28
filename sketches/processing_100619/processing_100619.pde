
PFont titleFont, subTitleFont, labelFont, subLabelFont;

String[] planets = {"MER", "VEN", "EAR", "MAR", "JUP", "SAT", "URA", "NEP", "PLU"};
int[] quantities = {550, 8150, 10000, 1070, 3180000, 952000, 145000, 171000, 21};
String[] planetNames = {"Mercury", "Venus", "Earth", "Mars", "Jupiter",
                     "Saturn", "Uranus", "Neptune", "Pluto"};
 int[] planetValues = {0.055, 0.815, 1.000, 0.107, 318, 95.2, 14.5, 17.1, 0.0021};                    
/* @pjs font='turkmen_courier_normal.ttf;'*/
void setup() {
  size(940, 570);
  titleFont = loadFont("turkmen_courier_normal.ttf", 32);
  subTitleFont = loadFont("turkmen_courier_normal.ttf", 24);
  labelFont = loadFont("GillSans-16.vlw");
  subLabelFont = loadFont("GillSans-14.vlw");
  smooth();
  rectMode(CENTER);
}

void draw() {
  background(#1a1a1a);
  noStroke();
  
  // bar chart based on summary data
  int bb = 75;   // Bottom border
  int lb = (width-((75*9)+(10*9)))/2;  // Left side border
  
  for(int i = 0; i < planets.length; i++) {
    int w = 75;    // Width of bars
    int s = 10;    // Space between bars
    int[] t  = new int[planets.length]; // Tall (for bars)
    t[i] = quantities[i] /10000;
    int[] x = new int[planets.length];
    x[i] = int(lb + (i + .5) * (w + s));
    int[] y = new int[planets.length];
    y[i] = height - bb - t[i]/2;
    
    if((mouseX > (x[i] - w/2)) && (mouseX < (x[i] + w/2)) &&
       (mouseY > (y[i] - t[i]/2)) && (mouseY < (y[i] + w/2))) {
       fill(#c7d42f);
       textFont(subLabelFont);
       textAlign(CENTER);
       // Info on rollover...
       text(planetNames[i] + ": " + planetValues[i], x[i], y[i] - t[i]/2 - 10);
    } else {
    fill(#CCCCCC);
    }
    rect(x[i], y[i], w, t[i]);
    textAlign(CENTER);
    textFont(labelFont);
    fill(#CCCCCC);
    text(planets[i], x[i], height - bb/2);
  }
  
//  stroke(#CCCCCC);
//  textFont(labelFont);
//  textAlign(RIGHT, CENTER);
//  for(int i = 0; i < 7; i++) {
//    int y = height - bb - i * 40;
//    line(lb - 5, y, lb - 8, y);
//    text(i, lb - 15, y);
//  }
  
  textAlign(CENTER);
  textFont(titleFont);
  text("Mass", width/2, 75);
  textAlign(CENTER);
  textFont(subTitleFont);
  text("(Earth Masses)", width/2, 125);
}


