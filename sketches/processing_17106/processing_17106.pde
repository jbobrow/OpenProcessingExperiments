
/* 
 * Color Blindness by Algirdas Rascius (http://mydigiverse.com).
/** 
 * Mouse-click to restart.
 */ 
 
CircleSet circles;
PImage symbols;
int currentSymbol;
float currentHue;

void setup() {  
  symbols = loadImage("symbols.png");
  
  size(800, 800);
  noStroke();
  smooth();
  colorMode(HSB, 1);
  frameRate(20);  
  initialize();
}

void initialize() {
  background(#000000);
  currentSymbol = floor(random(100));
  currentHue = random(1);
  circles = new CircleSet();  
}

void draw() {
  circles.growAll();
}


void mousePressed() {
  initialize();
}

void keyPressed() {
  initialize();
}

color getColor(int x, int y) {
  int xx = 47*(currentSymbol/10) + 1 + 46*x/width;
  int yy = 47*(currentSymbol%10) + 1 + 46*y/height;
  float hue;
  if (brightness(symbols.get(xx, yy)) >= random(1)) {
    hue = currentHue + random(0.1);  
  } else {
    hue = currentHue + 0.2 + random(0.8);
  }
  return color(hue%1, random(0.7, 1), random(0.7, 1), random(0.03, 0.3));
}



//-------------------------------------------------------------
class CircleSet {
  ArrayList circles = new ArrayList();
  ArrayList activeCircles = new ArrayList();  

  CircleSet() {
  }

  Circle addRandomCircle() {
    int x = round(random(5, width-5));
    int y = round(random(5, height-5));
    return checkFit(x, y, 2) ? new Circle(x, y) : null;     
  }

  boolean checkFit(int x, int y, int r) {
    return checkFit(x, y, r, null);
  } 

  boolean checkFit(int x, int y, float r, Circle c) {
    for (int i=0; i<circles.size(); i++) {
      Circle circle = (Circle)circles.get(i);
      if (circle !=c) {
        if (dist(x, y, circle.centerX, circle.centerY) <= r + circle.radius + 1) {
          return false;
        }
      }
    }
    return true;
  }

  void growAll() {
    ArrayList oldActive = activeCircles;
    activeCircles = new ArrayList();
    for (int i=0; i<oldActive.size(); i++) {
      Circle circle = (Circle)oldActive.get(i);
      boolean growSuccess = circle.grow();
      if (growSuccess) {
        activeCircles.add(circle);
      } else {
        addRandomCircle();
        addRandomCircle();
        addRandomCircle();        
      }
    }
    int count = 500;
    while (activeCircles.size() < 3 && (count--)>0) {
      addRandomCircle();
    }    
  } 

  //-------------------------------------------------------------
  class Circle {
    int centerX;
    int centerY;
    float radius;
    color clr;
    float growRate;
    float maxRadius;
    boolean canGrow;
    int drawOverCount;  

    Circle(int x, int y) {
      centerX = x;
      centerY = y;
      radius = 0;
      clr = getColor(x, y);
      growRate = random(0.2, 1);
      maxRadius = random(6, 13);
      canGrow = true;
      drawOverCount = 0;
      circles.add(this);
      activeCircles.add(this);
    }

    boolean grow() {
      canGrow =
        canGrow && 
        radius < maxRadius &&
        centerX > radius+20 &&
        centerX < width - radius-20 &&
        centerY > radius+20 &&
        centerY < height - radius-20 &&        
        checkFit(centerX, centerY, radius+growRate, this);
      
      if (canGrow) {
        radius += growRate;
      } else {
        drawOverCount++;
      }
        
      fill(clr);
      ellipse(centerX, centerY, 2*radius, 2*radius);
    
      return drawOverCount < 20;  
    }

  }

};






