
//////////////////////////////////
// Noise Bubbles
//////////////////////////////////
// copyright: Daniel Erickson 2012
float NOISE_SCALE = 0.1;
float TIME_SCALE = 0.0001;
PVector[][] temp_field;
PVector[][] field;
int N = 100;
float RADIUS = 6;
PVector[] positions;
PVector[] velocities;
int SCALE = 5;
int swidth;
int sheight;

void setup() {
    size(500, 500);
    smooth();
    swidth = width/SCALE;
    sheight = height/SCALE;
    background(0);
    color(255);
    
    temp_field = new PVector[swidth][sheight];
    field = new PVector[swidth][sheight];
    positions = new PVector[N];
    velocities = new PVector[N];
    for (int i=0; i<N; i++) {
        positions[i] = new PVector(random(width), random(height));
        velocities[i] = new PVector(0, 0);
    }
}

void draw() {
    float ft = (float)millis() * TIME_SCALE;
    for(int x=0; x<swidth; x++) {
        for (int y=0; y<sheight; y++) {
            temp_field[x][y] = new PVector(
              noise(x*NOISE_SCALE+ft+0, y*NOISE_SCALE+ft)-0.5,
              noise(x*NOISE_SCALE+ft+1, y*NOISE_SCALE+ft)-0.5);
        }
    }
    
    for(int x=0; x<swidth; x++) {
        for (int y=0; y<sheight; y++) {
            field[x][y] = temp_field[x][y];
            field[x][y].x += 0.5 * (temp_field[(x-1+swidth) % swidth][y].x - temp_field[(x+1) % swidth][y].x);
            field[x][y].y += 0.5 * (temp_field[x][(y+1) % swidth].y - temp_field[x][(y-1+swidth) % swidth].y);
        }
    }
    
    
    for (int i=0; i<N; i++) {
        PVector pos = positions[i];
        PVector vel = velocities[i];
        vel.add(field[(int)((pos.x+width) % width) / SCALE][(int)((pos.y+height) % height) / SCALE]);
        vel.mult(0.95);
        pos.add(vel);
        
        if (pos.x >= width || pos.x <= 0 || pos.y >= height || pos.y <= 0)
            positions[i] = new PVector(random(width), random(height));
        ellipse(pos.x, pos.y, vel.mag() * RADIUS, vel.mag() * RADIUS);
    }
    
}

