
int l, s, n, rT;

void setup() {
    size(800, 800, P3D);
    background(20);
    
    smooth();
    noStroke();
    
    l = 20; //Spacing between spheres
    s = 20; //Sphere diameter
    n = 15; //Number of spheres per row
    rT = 2500; //Speed of rotation
}

void draw() {
    background(20);
     
    float t = (millis()/rT)%TWO_PI; //Current angle in rad
    
    if (mousePressed) {
        pointLight(255, 255, 255, mouseX, mouseY, width/2);
    } else {
        lights();
        directionalLight(255, 0, 0, 1, 1, 0);
    }

    //Translate to center of canvas
    translate(width/2, height/2, 0);
 
    //Rotation
    rotateX(t);
    rotateY(t);
    rotateZ(t);

    for (int x = 0; x < n; x++) {
        for (int y = 0; y < n; y++) {
            for (int z = 0; z < n; z++) {
                drawSphere(x, y, z);
            }
        }
    }
}

void drawSphere(float x, float y, float z) {
    x2 = -l*n/2+l*x+l/2;
    y2 = -l*n/2+l*y+l/2;
    z2 = -l*n/2+l*z+l/2;

    //Color in spheres if mouse is not pressed
    if (mousePressed) {
        fill(127);
    } else {
        fill(color((x/n)*255, (y/n)*255, (z/n)*255));
    }

    pushMatrix();
    translate(x2, y2, z2);  
    box(s);
    popMatrix();
}
