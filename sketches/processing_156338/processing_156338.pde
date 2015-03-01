
int l, s, n, g;
float t;

ArrayList points;

void setup() {
    size(800, 800, P3D);
    background(255);
   
    noStroke();
    
    l = 5; //Spacing between points
    n = 55; //Number of points
    g = 200; //Range of Gravity
}

void draw() { 
    background(255);
    
    camera(width/2.0, height-100, 200, width/2.0, height/2.0, 0, 0, 1, 0);
    lights();
    
    points = new ArrayList();
    t = millis()/5000;
    
    translate(width/2, height/2, 0);
    rotateX((mouseY/height))
    rotateZ(TWO_PI-((mouseX/width)*TWO_PI+PI));
    
    int x = sin(t)*100;
    int y = cos(t)*100;
    
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            int x2 = (l*i+l/2-l*n/2);
            int y2 = (l*j+l/2-l*n/2);
        
            float distance = dist(x, y, x2, y2);
            distance = distance > g ? 0 : tan(((g-distance)/g)*HALF_PI)*(-g/40);
            
            points.add(new PVector(x2, y2, distance));
        }
    }
    
    noFill();
    stroke(100);
    
    for (int i = 0; i < n-1; i++) {
        beginShape(QUAD_STRIP);
        PVector v;
        for (int j = 0; j < n-1; j++) {
            v = points.get(j+n*i);
            vertex(v.x, v.y, v.z);
            v = points.get(j+n*(i+1));
            vertex(v.x, v.y, v.z);
        }
        endShape();
    }
    
    fill(255, 0, 0);
    noStroke();
    
    pushMatrix();
    translate(x, y, -10); 
    sphere(10);
    popMatrix();
}
