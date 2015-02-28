
//////////////////////////////////
// Perlin Painting
//////////////////////////////////
// copyright: Daniel Erickson 2012
float SCALE = 1;
float ZOOM = 0.0001*SCALE;
int LEVELS = 4;
float STROKE_WIDTH = 4.0;
float STROKE_DISTANCE = 0.3;
float LINE_LENGTH = 40/SCALE;
float ALPHA = 60;

int N = 400;
PVector[] points;
float[] point_lengths;

void setup() {
    size(800, 800);
    smooth();
    strokeWeight(0.05);
    background(255);
    stroke(255, 255, 255, ALPHA);
    points = new PVector[N];
    point_lengths = new float[N];
    new_points();
}

void new_points() {
    for (int i=0; i<N; i++) {
        points[i] = new PVector(random(-40, width+40), random(-40, width+40));
        point_lengths[i] = 0.0;
    }
}

float stroke_n = 0.0;
void draw() {
    for (int i=0; i<N; i++) {
        PVector old_point;
        if (point_lengths[i] > STROKE_WIDTH) {
            old_point = new PVector(random(-40, width+40), random(-40, width+40));
            point_lengths[i] = 0.0;
        } else {
            old_point = points[i];
        }
        
        PVector new_point = new PVector(old_point.x, old_point.y);
        PVector new_color = new PVector(0.0, 0.0, 0.0);
        for (int j=1; j<=LEVELS; j++) {
            float multiple = j*10*ZOOM;
            new_point.add(new PVector(
                9.0*(noise(1, old_point.x*multiple+1, old_point.y*multiple+1)-0.5)/(j),
                9.0*(noise(2, old_point.x*multiple+1, old_point.y*multiple+1)-0.5)/(j)
            ));
            new_color.x += noise(1, old_point.x*multiple+1, old_point.y*multiple+1)/(LEVELS*1.4);
            //new_color.y += noise(2, old_point.x*multiple+1, old_point.y*multiple+1)/(LEVELS*1.4);
        }
        new_color.y = 0.3;
        new_color.z = 1 - ((new_color.x + new_color.y)/2);
        //new_color.mult(new_color.mag());
        //new_color.z = 1 - new_color.y;
        PVector point_difference = PVector.sub(new_point, old_point);
        PVector start_vector = new PVector(-point_difference.y, point_difference.x);
        PVector end_vector = new PVector(point_difference.y, -point_difference.x);
        point_lengths[i] += start_vector.mag();
        stroke(new_color.x*255.0, new_color.y*255.0, new_color.z*255.0, ALPHA);
        start_vector.mult(LINE_LENGTH);
        start_vector.add(old_point);
        end_vector.mult(LINE_LENGTH);
        end_vector.add(old_point);
        line(start_vector.x, start_vector.y, end_vector.x, end_vector.y);
        points[i] = new_point;
    }
}

