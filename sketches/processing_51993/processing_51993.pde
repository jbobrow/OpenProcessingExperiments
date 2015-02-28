
//////////////////////////////////
// Boid
//////////////////////////////////
// copyright: Daniel Erickson 2012
public int NOISE_LEVELS = 2;
public float NOISE_SCALE = 8.0;
public float TIME_SCALE = 3.0;

class Boid extends ZObject {
    PVector vel;
    Fluid fluid;
    Boid(float iradius, color icolor, Fluid fluid) {
        super(random(1), random(1), random(1), iradius, icolor);
        this.fluid = fluid;
        //vz = random(0.001);
        vel = new PVector(0, 0, 0);
    }
    
    void update(float t) {
        float ft = TIME_SCALE * t * 0.00001;
        
        vel = fluid.get_velocity(pos);
        
        pos.add(vel);
        super.update();
    }
}

