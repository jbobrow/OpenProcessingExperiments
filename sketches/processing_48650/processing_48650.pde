
int size_x = 450;
int size_y = 450;

boolean debug = false;

ArrayList flowers = new ArrayList();

void setup() {
  size(size_x, size_y);
  background(255);
  colorMode(RGB); 
    
  flowers.clear();
  
  fill(255,255,255);
  rect(0, 0, size_x, size_y);
}

void mousePressed() {
  if (mouseButton == RIGHT) {
     setup(); 
  }
  
  if (mouseButton == LEFT) {
    addFlower(mouseX, mouseY);
  }
}

void draw() {  //draw function loops 

  //randomly add flower
  if (random(1) > 0.98) addFlower(random(size_x), random(size_y));

  //Clear screen
  fill(255,255,255);
  rect(0, 0, size_x, size_y);

  //Draw flowers
  fill(255,200,255,50);
  stroke(126);
  
  for (int i=0; i<flowers.size(); i++) {
      AnimatedFlower flower = (AnimatedFlower)flowers.get(i);
      flower.draw();
  }
  
  for (int i=flowers.size()-1; i>=0; i--) {
    AnimatedFlower flower = (AnimatedFlower)flowers.get(i);
    if (flower.isDead()) flowers.remove(flower);
  }
}


public void addFlower(int x, int y) {
  AnimatedFlower flower = new AnimatedFlower(x, y);
  flowers.add(flower);
}


class Point {

  public int x;
  public int y;

  Point(int x_, int y_) {
    this.x=x_;
    this.y=y_;
  }
  
  public String toString() {
    return x+"/"+y;
  }
}

class AnimatedFlower {

 private final int size_radius = random(10, 30);
 private final int petals = round(random(5, 10));
 private final double size_petal = random(2, 4);
 private final int MAX_AGE = random(260, 360);

 private final int DECAY_AGE = MAX_AGE * 2;

 private final double start = random(TWO_PI);

 private int age = 0;
 
 private Point center;
 
 AnimatedFlower(int x, int y) {
   center = new Point(x, y);
 }
 
  public void draw() {
    age++;
    
    ArrayList points = getConnectors(start, petals);
  
    float alpha_factor = 1-((age-MAX_AGE) / (DECAY_AGE-MAX_AGE));
    stroke(0, 255*alpha_factor);
  
    ellipse(center.x, center.y, size_radius*2, size_radius*2);
    
    for (int i=0; i<points.size(); i++) {
      Point point = (Point)points.get(i);
      Point endPoint = (Point)points.get((i+1)%points.size());
      if (debug) ellipse(point.x, point.y, 10, 10);
      
      double factor =  size_petal * completion();
      int c1x = point.x + (point.x - center.x)*factor;
      int c1y = point.y + (point.y - center.y)*factor;
      int c2x = endPoint.x + (endPoint.x - center.x)*factor;
      int c2y = endPoint.y + (endPoint.y - center.y)*factor;
      
      if (debug) {
        ellipse(c1x, c1y, 10, 10);
        ellipse(c2x, c2y, 10, 10);
      }
      
      bezier(point.x, point.y, c1x, c1y, c2x, c2y, endPoint.x, endPoint.y);
        
    }
  }
  
  
  private ArrayList getConnectors(double start, int petals) {
    ArrayList results = new ArrayList();
  
    double t = start;
    for (int i=0; i<petals; i++) {
        int x = center.x + size_radius * cos(t);
        int y = center.y + size_radius * sin(t);
        Point point = new Point(x, y);
        results.add(point);
        
        t += (TWO_PI / petals);
     }
     
     return results;  
  }
  
  private float completion() {
    float completion = (age / MAX_AGE);
    return max(0.0f, min(1.0f, completion));
  }
  
  
  public boolean isDead() {
    return age > DECAY_AGE;
  }

}
                                                                                
