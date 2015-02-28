
PendulumWave p, p2, p3;
color[] colors = new color[20];

void setup() {
    size(960, 200);

    p = new PendulumWave(0, width, .2);//x pos
    p2 = new PendulumWave(0, 200, .5);//y pos
    p3 = new PendulumWave(10, 50, .5);//scale

    for (int i = 0; i < 20; i++) {
        colors[i] = color(random(0, 255), random(0, 128), random(0, 64));
    }
}

void draw() {
    noStroke();
    fill(255, 255, 255, 20);
    rect(0, 0, width, height);
    stroke(0);

    p.run();
    p2.run();
    p3.run();

    float scale = 0;

    for (int i = 0; i < 20; i++) {
        fill(colors[i]);

        int j = i + 1;
        scale = p3.getAtStep(j, 20);
        ellipse(p.getAtStep(j, 20), p2.getAtStep(j, 20), scale, scale);
    }

}



class PendulumWave {
        
        float deg2rad = PI / 180;
        float _theta;
        float _amplitude;
        float _speed;
        float _center;
        
        PendulumWave (float min, float max, float speed) {
            _amplitude = max - min;//height of the wave
            _speed = speed * deg2rad / 2;//frequency of the wave
            _center = (max + min) / 2;
            _theta = 0;
        }

        void run() {            
            _theta += _speed;
        }

        float getAtStep(float step, float maxSteps) {
            float v = sin(_theta * step) * (_amplitude) / 2 + _center;
            return v;
        }
    }
