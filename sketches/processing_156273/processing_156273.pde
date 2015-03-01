
int l, s, n, g;

void setup() {  //setup function called initially, only once
    size(800, 800, P3D);
    background(255);  //set background white
   
    noStroke();
    
    l = 10; //Spacing between spheres
    s = 5; //Sphere diameter
    n = 35; //Number of spheres per row
    g = 200; //Range of Gravity
}

void draw() { 
    camera(width/2.0, height-100, 200, width/2.0, height/2.0, 0, 0, 1, 0)
    background(255);
       
    lights();
    translate(width/2, height/2, 0);
    rotateX((mouseY/height))
    rotateZ(TWO_PI-((mouseX/width)*TWO_PI+PI));
    
    int x = sin(frameCount/50)*100;
    int y = cos(frameCount/50)*100;
    
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            int x2 = (l*i+l/2-l*n/2);
            int y2 = (l*j+l/2-l*n/2);
        
            float distance = dist(x, y, x2, y2);
            
            distance = distance > g? 0 : tan(((g-distance)/g)*HALF_PI)*(-g/4);
            
            drawBox(x2, y2, distance/10, s);
        }
    }
    
    fill(255, 0, 0);
    drawSphere(x, y, 0, 10);
}

void drawBox(float x, float y, float z, int r) {
    color c = 200+2*z;
    c = c < 0 ? 0 : c;

    fill(c);
    pushMatrix();
    translate(x, y, z); 
    box(r*2);
    popMatrix();
}

void drawSphere(float x, float y, float z, int r) {
    pushMatrix();
    translate(x, y, z); 
    sphere(r);
    popMatrix();
}
