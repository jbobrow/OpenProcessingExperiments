
int value = 0; // set the value of the colour

void setup() {

  size(900, 350); // set the size of the window
  smooth(); // make the rect and lines of the graph look smooth
  

}
    
float xoff = 0.0;

void draw() {
strokeWeight(0.6);  // thinner
background(random (255), (155), random (555), 0);//set the background colour randomly
xoff = xoff + .01;
float a =noise(xoff) *width;//add Perlin noise to the graph by referring to Processing noise reference

for (int i = 0; i < 100; i++) {
  float r = random(50);
 
  stroke(r*50);
  line(650, i, 550-r, i-r);//draw noise lines to the graph
  line(350, i, 550+r, i-r);//draw noise lines to the graph
  line(450, i, 550-r, i-r);//draw noise lines to the graph
  
}
rect(0, 3, 600,1 );//draw a rectangle to the graph 
rect(a, 5, 900,1 );//draw a rectangle to the graph

rect(a, 12, 600, 1);//draw a rectangle to the graph
rect(0, 20, 900,2 );//draw a rectangle to the graph
rect(a, 22, 600,height );//draw a rectangle to the graph
rect(0, 30, 600, 3);//draw a rectangle to the graph
rect(a, 32, 600, 3);//draw a rectangle to the graph
rect(0, 60, 600,height );//draw a rectangle to the graph
rect(a, 62, 900,height );//draw a rectangle to the graph

rect(a, 92, 600, height);//draw a rectangle to the graph
rect(0, 120, 600, 3);//draw a rectangle to the graph
rect(0, 122, 600, height);//draw a rectangle to the graph
rect(a, 150, 600, 3);//draw a rectangle to the graph

rect(a, 180, 600,height );//draw a rectangle to the graph
rect(0, 182, 500,3 );//draw a rectangle to the graph
rect(a, 212, 600, 3);//draw a rectangle to the graph
rect(0, 213, 600, height);//draw a rectangle to the graph
rect(0, 240, 300, 3);//draw a rectangle to the graph
rect(a, 243, 600, height);//draw a rectangle to the graph
rect(0, 270, 600, 3);//draw a rectangle to the graph

  
// Move the mouse across the image
// to change its value

fill(value);
  
}

void mouseMoved() {// every time the mouse moves, color becomes lighter
  value = value +10;
  if (value > 255) {//if the color bigger than white 255 then turns back to black 0
    value = 0;
  }
}







   


