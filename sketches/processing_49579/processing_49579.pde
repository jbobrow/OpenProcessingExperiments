
//////////////////////////////////
// Perlin Bubble Boid
//////////////////////////////////
// copyright: Daniel Erickson 2012
public int NOISE_LEVELS = 2;
public float NOISE_SCALE = 8.0;
public float TIME_SCALE = 3.0;
public float SPEED = 5;

class Boid extends ZObject {
    PVector vel;
    Boid(float iradius, color icolor) {
        super(random(1), random(1), random(1), iradius, icolor);
        //vz = random(0.001);
        vel = new PVector(0, 0, 0);
    }
    
    void update(float t) {
        float ft = TIME_SCALE * t * 0.00001;
        
        vel.x = SPEED * 0.0001 * cos(2*PI*(noise(pos.x*NOISE_SCALE+ft+0, pos.y*NOISE_SCALE+ft, pos.z*NOISE_SCALE+ft)-0.5));
        vel.y = SPEED * 0.0001 * -sin(2*PI*(noise(pos.x*NOISE_SCALE+ft+1, pos.y*NOISE_SCALE+ft, pos.z*NOISE_SCALE+ft)-0.5));
        vel.z = SPEED * 0.0001 * sin(2*PI*(noise(pos.x*NOISE_SCALE+ft+2, pos.y*NOISE_SCALE+ft, pos.z*NOISE_SCALE+ft)-0.5));
        
        
        pos.add(vel);
        super.update();
    }
}

