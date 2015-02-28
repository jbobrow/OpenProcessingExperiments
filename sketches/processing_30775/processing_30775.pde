
/*
* FallingSand by Christophe Guébert
*  Particle simulation with a grid-based neighbours search.
*  Collision response using a distance field
*   '0' to '9' to choose a predefined shape
*   space bar to reset the particles
*   backspace to toggle the bottom border
*   mouse click to activate the mouse repulsion
*   shift + mouse click to draw
*   control + mouse click to erase
*/

// These parameters can be changed to tune the sketch behavior
// -->
final float dt = 1/20.0;
final float dt2 = dt*dt;
final float friction = 0.25;
final float springDamping = 0.85;
final float repulsionDist = 4;
final float repulsionStiffness = 30;
final float mouseRepulsionDist = 30;
final float mouseRepulsionStiffness = 20;
final float particleRadius = 2;
final float gravity = 10;
final float collisionStiffness = 2;

final int nbParticles = 2000;
final int gridSize = 4;
final int mouseDrawSize = 4;
final int mouseEraseSize = 7;
// <--

Particle[] particles;
GridCell[] grid;
PImage collisionShape, mouseErasingShape;
boolean resetOnShapeChange = true, borders = false;
boolean drawing = false, erasing = false;
int gridW, gridH;
final float rmd2 = repulsionDist*repulsionDist;
final float mrd2 = mouseRepulsionDist*mouseRepulsionDist;
int timerNb;
float[] collisionForceField;

class Particle
{
  float x, y, vx, vy, ax, ay, fx, fy;
  Particle() {
    x = y = vx = vy = ax = ay = fx = fy = 0.0;
    x = random(0, width); y = random(0, height);
  }
  
  void newPosition() {
    x = y = vx = vy = ax = ay = fx = fy = 0.0;
    x = random(0, width); y = particleRadius;
    vy = gravity * random(1, 3); ay = gravity;
  }

  void update() {
    fy += gravity;  // Always add gravity, otherwise particles don't fall
    fx -= vx * friction; fy -= vy * friction;  // Friction (depends on the velocity)
    x += vx*dt + 0.5*ax*dt2; y += vy*dt + 0.5*ay*dt2;  // Time integration
    ax = fx; ay = fy; 
    vx += 0.5*ax*dt; vy += 0.5*ay*dt;
    
    float pr = borders ? particleRadius : 0;

    if(x < particleRadius) { 
        x = 2 * particleRadius - x; 
        vx = -vx;
    } else if(x >= width - particleRadius) { 
        x = 2 * (width - particleRadius) - x; 
        vx = -vx;
    }
    if(y < particleRadius) { 
        y = 2 * particleRadius - y; 
        vy = -vy;
    } else if(y >= height - pr) { 
      if(borders) {
        y = 2 * (height - particleRadius) - y; 
        vy = -vy;
      } else
        newPosition();
    }
    
    fx = fy = 0;
  }
}

class GridCell
{
  boolean tested;
  Vector contents;
  GridCell() { contents = new Vector(); }
}

void setup()
{
  size(400, 400, P2D);
  frameRate(300);  // highest possible
  
  particles = new Particle[nbParticles]; 
  for(int i=0; i<particles.length; i++)
    particles[i] = new Particle();
    
  gridW = ceil(width / (float)gridSize);
  gridH = ceil(height / (float)gridSize);
  grid = new GridCell[gridW * gridH];
  for(int i=0; i<grid.length; i++)
    grid[i] = new GridCell();
    
  collisionShape = createImage(width, height, RGB);
  collisionForceField = new float[width*height*2];
  
  // Preparing a "paintbrush" for erasing (bigger than for the drawing)
  int s = mouseEraseSize*2+1;
  mouseErasingShape = createImage(s, s, RGB);
  mouseErasingShape.loadPixels();
  for(int y=0; y<s; y++) {
    for(int x=0; x<s; x++) {
      float dx = 1 - (float)x/mouseEraseSize;
      float dy = 1 - (float)y/mouseEraseSize;
      float d = dx*dx+dy*dy;
      mouseErasingShape.pixels[y*s+x] = color(255*(1-d));
    }
  }
  mouseErasingShape.updatePixels();
 
  noFill();
  stroke(color(244,164,96));  // "sandy brown"
  
  timerNb = 0;
  
  chooseCollisionShape('1');
}

void updateGrid()
{
  for(int i=0; i<grid.length; i++) {
    // resetting the grid
    grid[i].contents.clear();
    grid[i].tested = false;
  }

  for(int i=0; i<particles.length; i++) {
    // filling the grid with the indexes of the particles
    Particle p = particles[i];
    int index = floor(p.y)/gridSize*gridW + floor(p.x)/gridSize;
    if(index >= 0 && index < grid.length) // Testing just to be sure, but may be removed for speed
      grid[index].contents.add(p);
  }
}

void computeSprings()
{  
  // for each cell of the grid
  for(int y=0; y<gridH; y++) {
    for(int x=0; x<gridW; x++) {
      GridCell gc = grid[y*gridW+x];
      gc.tested = true;
      // each particle in that cell
      for(int i=0; i<gc.contents.size(); i++) {
        Particle pA = (Particle)gc.contents.get(i);
        // others particles in that cell
        for(int j=i+1; j<gc.contents.size(); j++) {
          // not putting that code in a separate function as it is called a lot
          Particle pB = (Particle)gc.contents.get(j);
          float dx = pB.x-pA.x; float dy = pB.y-pA.y;
          float d = dx*dx+dy*dy;
          if(d > rmd2 || d == 0) continue;
          d = sqrt(d);
          float f = repulsionStiffness * (d - repulsionDist) / d;
          pA.fx+=f*dx;  pA.fy+=f*dy; pB.fx-=f*dx;  pB.fy-=f*dy;
          pA.fx-=pA.vx*springDamping; pA.fy-=pA.vy*springDamping;
          pB.fx-=pB.vx*springDamping; pB.fy-=pB.vy*springDamping;
        }
        
        // neighbooring cells
        for(int y2=y; y2<=min(y+1, gridH-1); y2++) {
          for(int x2=max(0, x-1); x2<=min(x+1, gridW-1); x2++) {
            GridCell gc2 = grid[y2*gridW+x2];
            if(gc2.tested) continue;
            // each particle in that cell
            for(int j=0; j<gc2.contents.size(); j++) {
              // same code as up there, moving it in a function makes me lose 10 fps
              Particle pB = (Particle)gc2.contents.get(j);
              float dx = pB.x-pA.x; float dy = pB.y-pA.y;
              float d = dx*dx+dy*dy;
              if(d > rmd2 || d == 0) continue;
              d = sqrt(d);
              float f = repulsionStiffness * (d - repulsionDist) / d;
              pA.fx+=f*dx;  pA.fy+=f*dy; pB.fx-=f*dx;  pB.fy-=f*dy;
              pA.fx-=pA.vx*springDamping; pA.fy-=pA.vy*springDamping;
              pB.fx-=pB.vx*springDamping; pB.fy-=pB.vy*springDamping;
            }
          }
        }
      }
    }
  }
}

void computeCollision()
{  
  // We add a force to each particle corresponding to the distance based collision map  
  for(int i=0; i<particles.length; i++) {
    Particle p = particles[i];
    int index = (floor(p.y) * width + floor(p.x)) * 2;
    if(index >= 0 && index < width*height*2) {
      p.fx += collisionForceField[index];
      p.fy += collisionForceField[index+1];
    }
  }
}

void mouseRepulsion()
{  // Using the grid even for that !
  int xmin = max(0, floor((mouseX - mouseRepulsionDist) / gridSize));
  int xmax = min(gridW, ceil((mouseX + mouseRepulsionDist) / gridSize));
  int ymin = max(0, floor((mouseY - mouseRepulsionDist) / gridSize));
  int ymax = min(gridH, ceil((mouseY + mouseRepulsionDist) / gridSize));
  
  for(int x=xmin; x<xmax; x++) {
    for(int y=ymin; y<ymax; y++) {
      GridCell gc = grid[y*gridW+x];
      for(int i=0; i<gc.contents.size(); i++) {
        Particle p = (Particle)gc.contents.get(i);
        float dx = mouseX-p.x; float dy = mouseY-p.y;
        float d = dx*dx+dy*dy;
        if(d < mrd2) {
          d = sqrt(d);
          float f = mouseRepulsionStiffness * (d - mouseRepulsionDist) / d;
          p.fx += f*dx; p.fy += f*dy;
        }
      }
    }
  }
}

void mouseDrawing()
{
  if(mouseX == pmouseX && mouseY == pmouseY)  // Only when moving the mouse
    return;
  
  int xmin = max(1, min(mouseX, pmouseX) - mouseDrawSize);
  int xmax = min(width-1, max(mouseX, pmouseX) + mouseDrawSize);
  int ymin = max(1, min(mouseY, pmouseY) - mouseDrawSize);
  int ymax = min(height-1, max(mouseY, pmouseY) + mouseDrawSize);  
  
  collisionShape.loadPixels();
  float v1x=mouseX-pmouseX, v1y=mouseY-pmouseY;
  for(int y=ymin; y<ymax; y++) {
    for(int x=xmin; x<xmax; x++) { 
      float v2x=x-pmouseX, v2y=y-pmouseY;
      float r = (v1x*v2x+v1y*v2y)/(v1x*v1x+v1y*v1y);
      r = constrain(r, 0, 1);
      float px=pmouseX+v1x*r, py=pmouseY+v1y*r;
      float d=dist(x, y, px, py);
      int c = collisionShape.pixels[y*width+x] & 0xFF;
      collisionShape.pixels[y*width+x] = 
        color(max(c, 255 * (1-smoothstep(d, 0, mouseDrawSize))));
    }
  }
  collisionShape.updatePixels();
  
  blur(xmin, xmax, ymin, ymax);
  updateDistanceField(xmin, xmax, ymin, ymax);
}

// Used to create a nice paintbrush shape
float smoothstep(float x, float a, float b)
{
  if (x < a)  return 0;
  if (x >= b) return 1;
  x = (x - a)/(b - a);
  return (x*x * (3 - 2*x));
}

void mouseErasing()
{
  if(mouseX == pmouseX && mouseY == pmouseY)  // Only when moving the mouse
    return;
    
  collisionShape.blend(mouseErasingShape,
                       0, 0, 
                       mouseErasingShape.width, mouseErasingShape.height,
                       mouseX-mouseEraseSize, mouseY-mouseEraseSize,
                       mouseErasingShape.width, mouseErasingShape.height,
                       SUBTRACT); 
  
  int xmin = max(1, mouseX - mouseEraseSize - 1);
  int xmax = min(width-1, mouseX + mouseEraseSize + 1);
  int ymin = max(1, mouseY - mouseEraseSize - 1);
  int ymax = min(height-1, mouseY + mouseEraseSize + 1);  
                       
  blur(xmin, xmax, ymin, ymax);
  updateDistanceField(xmin, xmax, ymin, ymax);
}

void chooseCollisionShape(char c)
{
  collisionShape = loadImage(""+(int)c+".png");
  if(collisionShape == null)  // Hack if there is no image : create an empty one and continue
    collisionShape = createImage(400, 400, RGB);

  collisionShape.resize(width, height);
  collisionShape.loadPixels();
  for(int i=0; i<particles.length; i++) {
    Particle p = particles[i];
    if(resetOnShapeChange) { p.x = random(0, width); p.y = random(0, height); }
    if((collisionShape.pixels[floor(p.y)*width+floor(p.x)]&0xFF) != 0) {
      // If the particle is inside the letter boundaries
      // Take a random direction and move the particle
      float a = random(0, 2*PI);
      float rx = cos(a)*5; float ry = sin(a)*5;
      for(int j=0; j<5 && (collisionShape.pixels[floor(p.y)*width+floor(p.x)]&0xFF) != 0; j++) {
        p.x = constrain(p.x+rx, 0, width-1); p.y = constrain(p.y+ry, 0, height-1);
      }
      // If it doesn't work, move it to a complete random position
      for(int j=0; j<5 && (collisionShape.pixels[floor(p.y)*width+floor(p.x)]&0xFF) != 0; j++) {
        p.x = random(0, width); p.y = random(0, height);
      }
    }
  }

  // Computing the collision distance field
  updateDistanceField(1, width-1, 1, height-1);
}

void updateDistanceField(int xmin, int xmax, int ymin, int ymax)
{
  // For each point, we compute a direction to get out of the collision shapes
  // Very similar to an edge detection algorithm for images
  float[] v = new float[9];
  for(int y=ymin; y<ymax; y++) {
    v[1] = collisionShape.pixels[(y-1)*width+xmin-1] & 0xFF;
    v[4] = collisionShape.pixels[y*width+xmin-1] & 0xFF;
    v[7] = collisionShape.pixels[(y+1)*width+xmin-1] & 0xFF;
    v[2] = collisionShape.pixels[(y-1)*width+xmin] & 0xFF;
    v[5] = collisionShape.pixels[y*width+xmin] & 0xFF;
    v[8] = collisionShape.pixels[(y+1)*width+xmin] & 0xFF;
    for(int x=xmin; x<xmax; x++) {
      v[0] = v[1]; v[1] = v[2]; v[2] = collisionShape.pixels[(y-1)*width+x+1] & 0xFF;
      v[3] = v[4]; v[4] = v[5]; v[5] = collisionShape.pixels[y*width+x+1] & 0xFF;
      v[6] = v[7]; v[7] = v[8]; v[8] = collisionShape.pixels[(y+1)*width+x+1] & 0xFF;
      
      int index = (y*width+x)*2;
      if(v[4] == 0) {
        collisionForceField[index] = 0;
        collisionForceField[index+1] = 0;
      } else {
        float fx = v[0] + v[3] + v[6] - (v[2] + v[5] + v[8]);
        fx = fx * collisionStiffness;
        float fy = v[0] + v[1] + v[2] - (v[6] + v[7] + v[8]);
        fy = fy * collisionStiffness;
        
        collisionForceField[index] = fx;
        collisionForceField[index+1] = fy;
      }
    }
  }
}

void blur(int xmin, int xmax, int ymin, int ymax)
{ // A simple box-blur filter on the current image
  collisionShape.loadPixels();
  float[] v = new float[9];
  for(int y=ymin; y<ymax; y++) {
    v[1] = collisionShape.pixels[(y-1)*width+xmin-1] & 0xFF;
    v[4] = collisionShape.pixels[y*width+xmin-1] & 0xFF;
    v[7] = collisionShape.pixels[(y+1)*width+xmin-1] & 0xFF;
    v[2] = collisionShape.pixels[(y-1)*width+xmin] & 0xFF;
    v[5] = collisionShape.pixels[y*width+xmin] & 0xFF;
    v[8] = collisionShape.pixels[(y+1)*width+xmin] & 0xFF;
    for(int x=xmin; x<xmax; x++) {
      v[0] = v[1]; v[1] = v[2]; v[2] = collisionShape.pixels[(y-1)*width+x+1] & 0xFF;
      v[3] = v[4]; v[4] = v[5]; v[5] = collisionShape.pixels[y*width+x+1] & 0xFF;
      v[6] = v[7]; v[7] = v[8]; v[8] = collisionShape.pixels[(y+1)*width+x+1] & 0xFF;
      
      float sum = 0;
      for(int i=0; i<9; i++)
        sum += v[i];
        
      collisionShape.pixels[y*width+x] = color(sum / 9);
    }
  }
  collisionShape.updatePixels();
}

void draw()
{ 
  background(color(0));
  for(int i=0; i<particles.length; i++)
    particles[i].fx = particles[i].fy = 0;

  updateGrid();
  if(mousePressed) {
    if(drawing)
      mouseDrawing();
    else if(erasing)
      mouseErasing();
    else
      mouseRepulsion();
  }
  computeCollision();
  computeSprings();
  
  if(collisionShape != null)
    image(collisionShape, 0, 0);
    
  for(int i=0; i<particles.length; i++)
    particles[i].update();

  for(int i=0; i<particles.length; i++)
    point(particles[i].x, particles[i].y);
    
  timerNb++;
  if(timerNb >+ 30)
  {
    timerNb = 0;
    println("Framerate : " + nf(frameRate, 0, 2));
  }
}

void keyPressed()
{
  if(key == ENTER)
    resetOnShapeChange = !resetOnShapeChange;
    
  if(key == BACKSPACE)
    borders = !borders;
    
  if(key == CODED) { 
    if(keyCode == SHIFT)
      drawing = true;
    else if(keyCode == CONTROL)
      erasing = true;
  }
  
  if(key == ' ') {
    for(int i=0; i<particles.length; i++)
      particles[i] = new Particle();
  }
  
  if(key >= '0' && key <= '9')
    chooseCollisionShape(key);
}

void keyReleased()
{
  if(key == CODED) { 
    if(keyCode == SHIFT)
      drawing = false;
    else if(keyCode == CONTROL)
      erasing = false;
  }
}


