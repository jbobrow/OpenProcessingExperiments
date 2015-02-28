
// Brian Sorahan
// Recursive Productions

// Sketch that illustrates the idea that a circle is like a regular polygon
// with an infinite number of sides.

int edges;
int edges_limit;  //
RegularPolygon polly;

void setup()  {
  size(300,300);
  edges_limit = 100;
  edges = 3;
}

void draw()  {
  background(200);
  translate(width/2,height/2);
  
  edges++;
  
  polly = new RegularPolygon(edges, 100);
  polly.display();
  
  delay(200);
  
  if(edges == edges_limit)  {
    noLoop();
  }  
}


// Save an image
void mousePressed()  {
  if(key == 115)  {
    saveFrame("Polygon2Circle.jpg");
  }
}

