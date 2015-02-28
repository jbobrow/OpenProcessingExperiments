
int             MAX_NUMBER_OF_DROPS  = 300;
int             MIN_RADIUS           = 2;
int             MAX_RADIUS           = 30;
int             MIN_SPEED            = 1;
int             MAX_SPEED            = 3;
int             MIN_ALPHA_SPEED      = 2;
int             MAX_ALPHA_SPEED      = 5;
int             MAX_NUMBER_OF_SHAPES = 3;
boolean         foamMode;     // True is Foam Drawing Mode; False is Click Drawing Mode 
int             currentShape; // CIRCLE = 0, RECTANGLE = 1, TRIANGLE = 2, STAR = 3            
ArrayList<Drop> drops;

void setup() {
  size(600, 420);
  drops        = new ArrayList<Drop>();
  foamMode     = true;
  currentShape = 0; 
  
  background(0);  
}


void draw() {
  background(0);

  for (int i = 0; i < drops.size(); i++) {
    drops.get(i).update();
    drops.get(i).render(); 
  }
  
  for (int i = 0; i < drops.size(); i++)
    if (drops.get(i).finished()) 
      drops.remove(i); 
}


void keyPressed() {
  if (key == 's' || key == 'S') {
     currentShape++;
     if (currentShape >= MAX_NUMBER_OF_SHAPES) currentShape = 0;
  }
  
  if (key == 'm' || key == 'M') {
    foamMode = !foamMode;
  }
}


void mouseWheel(MouseEvent event) {
  currentShape = event.getAmount() > 0 ? currentShape + 1: currentShape - 1;
  if (currentShape >= MAX_NUMBER_OF_SHAPES)
    currentShape = 0;
  else if (currentShape < 0)
    currentShape = MAX_NUMBER_OF_SHAPES - 1;
}


void mouseMoved() {
  if (foamMode) {
    if (drops.size() <= MAX_NUMBER_OF_DROPS)
      drops.add(new Drop(currentShape, random(MIN_RADIUS, MAX_RADIUS), mouseX, mouseY, random(1, 3), random(2, 5)));
  }
}


void mousePressed() {
  if (mouseButton == LEFT) {
    if (!foamMode) {
      drops.add(new Drop(currentShape, random(2, 21), mouseX, mouseY, random(1, 3), random(2, 5)));
    }
  } else if (mouseButton == RIGHT) {
    foamMode = !foamMode;
  }
}



class Drop {
  // Note about shapes:
  // 0 => Circle, defaultShape
  // 1 => Rectangle
  // 2 => Triangle

  int   shape;
  int   px, py;
  float radius;
  float radiusSpeed, fillAlphaSpeed, strokeAlphaSpeed;
  float red, green, blue, fillAlpha, strokeAlpha;
  float cos30;
 
  public Drop(int _shape, float _radius, int _px, int _py, float _radiusSpeed, float alphaSpeed) {
    shape            = _shape;
    radius           = _radius;
    px               = _px;
    py               = _py;
    radiusSpeed      = _radiusSpeed;
    fillAlphaSpeed   = alphaSpeed;
    strokeAlphaSpeed = 0.7F * alphaSpeed;
    fillAlpha        = 255;
    strokeAlpha      = 255;
    cos30            = radians(30);

    if (radius <= 5) {
      red   = map(_py, height, 0, 0, 255);
      green = random(0, 255);
      blue  = map(_px, width, 0, 0, 255);      
    } else if (radius > 5 && radius <= 15) {
      red   = random(0, 255);
      green = map(_px, width, 0, 0, 255);
      blue  = map(_py, height, 0, 0, 255);
    } else {
      red   = map(_px, width, 0, 0, 255);
      green = map(_py, height, 0, 0, 255);
      blue  = random(0, 255);
    }
  }
  
  public boolean finished() { return strokeAlpha < 0; }

  
  public void update() {
    radius      += radiusSpeed; 
    fillAlpha   -= fillAlphaSpeed;
    strokeAlpha -= strokeAlphaSpeed; 
  }


  public void render() {
    stroke(red, green, blue, strokeAlpha);
    strokeWeight(3);
    fill(red, green, blue, fillAlpha);
    
    // I hate magic numbers, but that will have to do for now
    switch (shape) {
      // CIRCLE
      case 0:   
        ellipse(px, py, radius, radius);  
      break;
      
      // RECTANGLE
      case 1:   
        rectMode(CENTER);
        rect(px, py, radius, radius);
      break;

      // TRIANGLE
      // Note: the vertices of the equilateral triangle are calculated using some relations between
      //       the apothem position and the circle on which the triangle is inscribed.
      // Reference: http://www.vitutor.com/geometry/plane/equilateral_triangle.html
      case 2:   
        triangle(px + radius * cos30, py + radius * 0.5F,
                 px, py - radius * 0.5F,
                 px - radius * cos30, py + radius * 0.5F);
      break;

      default: println("BUG IN CLASS Drop: Drop Mode should never be reach default case"); break;
    }
  }
}
