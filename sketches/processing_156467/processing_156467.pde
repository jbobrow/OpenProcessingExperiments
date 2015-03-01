
int s, n;
 
void setup() {  //setup function called initially, only once
    size(800, 800, P3D);
    background(255);  //set background white
    noStroke();
     
    s = 5; //Cube edge length
    n = 35; //Iterations
}
 
void draw() {
    //camera(width/2.0, height-100, 200, width/2.0, height/2.0, 0, 0, 1, 0)
    background(255);
        
    lights();
    translate(width/2, height/2, 0);
    
    rotateX(TWO_PI-((mouseY/height)*TWO_PI+PI))
    rotateZ(TWO_PI-((mouseX/width)*TWO_PI+PI));
     
    int x = 0;
    int y = 0;
     
    fill(255, 0, 0);
    drawMenger(0, 0, 0, 3);
}
 
void drawBox(float x, float y, float z, int r) {
    pushMatrix();
    translate(x, y, z);
    box(r);
    popMatrix();
}

void drawMenger(int xO, int yO, int zO, int n) {
    int l = pow(3, n+1);

    for (int x = -1; x <= 1; x++) {
        for (int y = -1; y <= 1; y++) {
            for (int z = -1; z <= 1; z++) {
                if (((x == -1 || x == 1) && y == 0 && z == 0) ||
                    ((y == -1 || y == 1) && x == 0 && z == 0) ||
                    ((z == -1 || z == 1) && x == 0 && y == 0) ||
                    (x == 0 && y == 0 && z == 0)) {
                    continue;
                }
                if (n == 1) {
                    drawBox(xO+x*l, yO+y*l, zO+z*l, l);
                } else drawMenger(xO+x*l, yO+y*l, zO+z*l, n-1);
            }
        }
    }
    
}

