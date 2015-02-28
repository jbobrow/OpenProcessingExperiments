
// Emergent Voronoi 
// based on an algorithm presented by Coates 
// Alasdair Turner 2010 
 
PVector [] nodes; 
PVector [] particles; 
color [] colors;
PVector [][] field; 
 
void setup() 
{ 
  size(400,400); 
  colorMode(HSB);
  smooth(); 
  nodes = new PVector [10]; 
  colors = new color [4000];
  particles = new PVector [4000]; 
  field = new PVector [width][height]; 
  reset(); 
  frameRate(24); 
} 
 
void draw() 
{ 
  background(255); 
  noStroke(); 
  fill(128); 
  for (int i = 0; i < nodes.length; i++) { 
    ellipse(nodes[i].x,nodes[i].y,20,20); 
  } 
  for (int i = 0; i < particles.length; i++) { 
    int x = round(particles[i].x); 
    int y = round(particles[i].y); 
    if (x > 0 && x < width && y > 0 && y < height) { 
      fill(colors[i]);
      particles[i].add(field[x][y]);
      ellipse(particles[i].x,particles[i].y,4,4); 
    } 
  } 
} 
 
void mousePressed() 
{ 
  reset(); 
} 
 
void reset() 
{ 
  background(0); 
  for (int i = 0; i < nodes.length; i++) { 
    nodes[i] = new PVector(random(0,width),random(0,height)); 
  } 
  for (int i = 0; i < particles.length; i++) { 
    colors[i] = color(random(255),random(204),204);
    particles[i] = new PVector(random(0,width),random(0,height)); 
  } 
  // Although this is perhaps against the spirit of  
  // an "emergent" voronoi pattern, I precalculate a  
  // vector field to move the particles 
  // If I had a massively parallel computer, I would  
  // be stricter, and let each particle determine its 
  // own distance from the nearest node.  But I don't! 
  for (int x = 0; x < width; x++) { 
    for (int y = 0; y < height; y++) { 
      int nearest_node = -1; 
      float nearest_dist = 0.0f; 
      int nnearest_node = -1; 
      float nnearest_dist = 0.0f; 
      field[x][y] = new PVector(); 
      for (int i = 0; i < nodes.length; i++) { 
        float d = dist(x,y,nodes[i].x,nodes[i].y); 
        if (nearest_node == -1 || d < nearest_dist) { 
          nnearest_node = nearest_node; 
          nnearest_dist = nearest_dist; 
          nearest_node = i; 
          nearest_dist = d; 
        } 
        else if (nnearest_node == -1 || d < nnearest_dist) { 
          nnearest_node = i; 
          nnearest_dist = d; 
        } 
      } 
      field[x][y] = new PVector(x-nodes[nearest_node].x,y-nodes[nearest_node].y); 
      field[x][y].mult(0.1*(nnearest_dist-nearest_dist)/(nnearest_dist+nearest_dist)); 
    } 
  } 
} 


