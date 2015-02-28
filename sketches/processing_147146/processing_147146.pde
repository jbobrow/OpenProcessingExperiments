
ArrayList<Circle> circles;
PVector[] moves = new PVector[9];
PVector canvasCenter;

void setup() {
  
  size(600,600);
  background(255);
  canvasCenter = new PVector(width/2, height/2);
  stroke(0);
 
  moves[0] = new PVector(0,0);
  moves[1] = new PVector(0,1);
  moves[2] = new PVector(0,-1);
  moves[3] = new PVector(1,0);
  moves[4] = new PVector(-1,0);
  moves[5] = new PVector(1,1);
  moves[6] = new PVector(1,-1);
  moves[7] = new PVector(-1,1);
  moves[8] = new PVector(-1,-1);
  
  circles = new ArrayList<Circle>();
  circles.add(new Circle(canvasCenter.x, canvasCenter.y, (float)(Math.random()*30+15)));
  
}



void mousePressed() {
  //check if current circle would overlap any others first
  Circle newCircle = new Circle();
  if ( !overlapsAnotherCircle(newCircle) ) {
    circles.add(newCircle);
  }
}

void keyPressed() {
  if ( key == 'r' || key == 'R' ) setup();
}


void draw() {
  background(255);
  fill(0);
  text("Click away from existing circles to generate a new circle.  Press [r] to reset.",10,height-20);
  //if ( debug ) text(getTotalDist(),10,25);
    
  for(Circle c : circles) {
    //don't move first circle @ center
    if ( c != circles.get(0) ) {
      c.move();
    }
  }
  
  for(Circle c : circles) {
    c.render();
  }
  
}

//given ArrayList of Circles, return the sum of the 
//distance between the centers of all circles
public float getTotalDist() {
  float dist = 0.0;
  
  for(int i = 0 ; i + 1 < circles.size() ; i++) {
    Circle a = circles.get(i);
    
    for(int j = i + 1; j < circles.size() ; j++) {
      Circle b = circles.get(j);
      dist += a.center.dist(b.center);
    }
  }
  
  return dist;
}

public boolean overlapsAnotherCircle(Circle c) {
  for(Circle other : circles) {
    float dist = c.center.dist(other.center);
    if ( c != other && c.radius + other.radius > dist ) {
      return true;
    }
  }
 return false;
} 


public class Circle {
  PVector center;
  float radius;
  
  public Circle(float x, float y, float r) {
    radius = r;
    center = new PVector(x,y);
  }
  
  //circle @ mouse click location, random radius
  public Circle() {
    this((float)mouseX, (float)mouseY, (float)(Math.random()*50+10));
  }
   
  public void render() {
    //first circle acts as "gravity" so color differently
    if ( this == circles.get(0) ) {
        fill(255,0,0);
    } else {    
      fill(180);
    }
    ellipseMode(CENTER);    
    ellipse(center.x, center.y, radius*2, radius*2);
  }
  
  public void move() {
    if ( center.dist(canvasCenter) < 0 ) return; //already @ center
    
    //attempt to move up, down, left, and right -- move in direction of 
    //least total dist between all circles' centers or stay put if no better
    //move location
    float[] moveScores = new float[moves.length];
    for(int i = 0 ; i < moves.length ; i++) {
      center.add(moves[i]); //temporarily move circle's center
      
      if ( !overlapsAnotherCircle(this) ) {
        moveScores[i] = getTotalDist();
      } else {
        moveScores[i] = -1; //don't move this way!
      }
      center.sub(moves[i]); //move center back
    }
    
    //find move with minimum total dist btwn circles and shift circle's center
    int minDistIdx = 0; //a non-move vector
    for(int i = 1 ; i < moveScores.length ; i++) {
      if ( moveScores[i] < moveScores[minDistIdx] && moveScores[i] > 0 ) {
       minDistIdx = i;
      }
    }
    
    center.add(moves[minDistIdx]);    
    
  }
   
   
}

  
