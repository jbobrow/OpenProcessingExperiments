
//////////////////////////////////
// Perlin Noise Drawing
//////////////////////////////////
// copyright: Daniel Erickson 2012
float ZOOM = 0.0001;
int LEVELS = 4;
float TIMEOUT = 400;

float old_t = 0;

int N = 200;
PVector[] points;

void setup() {
    size(800, 400);
    smooth();
    strokeWeight(0.3);
    background(0);
    stroke(255, 255, 255, 30);
    points = new PVector[N];
    new_points();
}

void new_points() {
    for (int i=0; i<N; i++) {
        points[i] = new PVector(random(-40, width+40), random(-40, width+40));
    }
}

void draw() {
    float t = millis();
    
    if (t - old_t > TIMEOUT) {
        new_points();
        old_t = t;
    }
    
    for (int i=0; i<N; i++) {
        PVector old_point = points[i];
        
        PVector new_point = new PVector(old_point.x, old_point.y);
        for (int j=1; j<=LEVELS; j++) {
            new_point.add(new PVector(
                10.0*(noise(1, old_point.x*ZOOM*j*j*10, old_point.y*ZOOM*j*j*10)-0.5)/j*j,
                10.0*(noise(2, old_point.x*ZOOM*j*j*10, old_point.y*ZOOM*j*j*10)-0.5)/j*j
            ));
        }
        PVector point_difference = PVector.sub(new_point, old_point);
        PVector line_vector = new PVector(-point_difference.y, point_difference.x);
        line_vector.mult(3.0);
        line_vector.add(old_point);
        line(old_point.x, old_point.y, line_vector.x, line_vector.y);
        points[i] = new_point;
    }
}                               
