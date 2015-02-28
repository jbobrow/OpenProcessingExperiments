

//checkout if curveTightness is applying to curvePoint

float[] x = new float[10];
float[] y = new float[10];

ArrayList<PVector> points = new ArrayList<PVector>();

void setup(){
  size(500,500);
  smooth();
  
  for(int i=0; i<4; i++){
    PVector p = new PVector(random(width),random(height));
    points.add(p);
  }
  
}

void draw(){
  background(0);
  stroke(255);
  strokeWeight(1);
  noFill(); 
  
  float tightness = map(mouseX,0,width,-5,5);
  curveTightness(tightness);
  
  curve(points.get(0).x,points.get(0).y,      points.get(1).x,points.get(1).y,        points.get(2).x,points.get(2).y,      points.get(3).x,points.get(3).y);
  
  for(int i=0; i<10; i++){
    x[i] = curvePoint(points.get(0).x, points.get(1).x, points.get(2).x, points.get(3).x, i/10.0);
    y[i] = curvePoint(points.get(0).y, points.get(1).y, points.get(2).y, points.get(3).y, i/10.0);
    fill(255);
    ellipse(x[i],y[i],5,5);
  }
    
}


void keyPressed(){
  points.clear();
  for(int i=0; i<4; i++){
    PVector p = new PVector(random(width),random(height));
    points.add(p);
  }
}


