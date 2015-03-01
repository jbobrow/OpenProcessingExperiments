
PShape usa;
PShape state;
String [] low  = { "HI", "CT", "MA", "NY", "NJ", "CO", "NV", "CA", "DC", "UT", "AZ", "MT" };
 
String [] medium = { "WA", "OR", "ID", "WY", "ND", "SD", "NE", "KS", "NM", "AK", "MN", "IA", "WI", "IL", "OH", "TN", "FL", "GA", "NC", "VA", "MD", "DE", "PA", "RI", "NH", "VT", "ME"};

String [] high = { "TX", "OK", "MO", "AR", "LA", "MS", "AL", "KY", "IN", "MI", "WV", "SC" };
 
void setup() {
  size(950, 600);
  // The file Blank_US_Map.svg can be found at Wikimedia Commons
  usa = loadShape("http://upload.wikimedia.org/wikipedia/commons/3/32/Blank_US_Map.svg");
  smooth(); // Improves the drawing quality of the SVG
  noLoop();
}
 
void draw() {
  background(255);
  // Draw the full map
  shape(usa, 0, 0);
  // Dark Green denotes < 25%
  statesColoring(low, color(5, 63, 5));
  // Blue  denotes states between 25 and 30%
  statesColoring(medium, color(9, 14, 149));
  // Red denotes states greater than 30%
  statesColoring(high, color(253, 10, 10));
  // Save the map as image
  saveFrame("map output.png");
}
 
void statesColoring(String[] states, int c){
  for (int i = 0; i < states.length; ++i) {
    PShape state = usa.getChild(states[i]);
    // Disable the colors found in the SVG file
    state.disableStyle();
    // Set our own coloring
    fill(c);
    noStroke();
    // Draw a single state
    shape(state, 0, 0);
  }
}


