
float g = 0.005;

TeeterTotter teeterTotter;

void setup() {
    size(1000, 800);
    rectMode(CENTER);

    teeterTotter = new TeeterTotter(width / 2, height / 2, 500, new Box(0, 20, 20, 0.5));
}

void draw() {
    background(0);
    stroke(92, 110, 110);
    strokeWeight(5);
    line(0, (height / 2) + ((teeterTotter.l * sin(PI / 8)) / 2) + 5, width, (height / 2) + ((teeterTotter.l * sin(PI / 8)) / 2) + 5);
    teeterTotter.update();
    teeterTotter.display();
}

class TeeterTotter {
    TeeterTotter(float x_, float y_, float l_, Box b_) {
        location = new PVector(x_, y_);
        l = l_;
        box = b_;
        alpha = omega = theta = 0;
    }
    void update() {
        shadows.add(new BoxShadow(box.x, box.w, box.h, location.x, location.y, theta));
        for(int i = shadows.size() - 1; i >= 0; i--) {
            if(shadows.get(i).dead()) {
                shadows.remove(i);
            }
            else {
                shadows.get(i).update();
            }
        }
        box.update(l);
        // torque
        float t = box.weight() * abs(box.x) * sin(QUARTER_PI + theta);
        // moment of inertia
        float i = box.moi();
        if(i != 0) {
            // acceleration
            alpha = t / i;
        }
        else {
            alpha = 0;
        }
        // velocity
        omega += alpha;
        // angle
        theta += omega;

        if(theta >= PI / 8) {
            theta = PI / 8;
            omega *= -0.75;
        }
        if(theta <= -1 * (PI / 8)) {
            theta = -1 * (PI / 8);
            omega *= -0.75;
        }
    }
    void display() {
        for(int i = 0; i < shadows.size(); i++) {
            shadows.get(i).display();
        }
        pushMatrix();
        translate(location.x, location.y);
        fill(49, 47, 69);
        noStroke();
        triangle(0, 0, -1 * l / 16, ((l * sin(PI / 8)) / 2) + 2.5, l / 16, ((l * sin(PI / 8)) / 2) + 2.5);
        rotate(theta);
        stroke(117, 35, 61);
        strokeWeight(5);
        noFill();
        line(-1 * (l / 2), 0, l / 2, 0);
        box.display();
        popMatrix();
    }
    float l, theta, omega, alpha;
    PVector location;
    Box box;
    ArrayList<BoxShadow> shadows = new ArrayList<BoxShadow>();
};

class Box {
    Box(float x_, float w_, float h_, float m_) {
        x = x_;
        w = w_;
        h = h_;
        m = m_;
    }
    float weight() {
        return m * g;
    }
    float moi() {
        return (x < 0 ? -1 : 1) * m * abs(x) * abs(x);
    }
    void update(float l) {
        x = constrain(x, -1 * (l / 2) + (w / 2), (l / 2) - (w / 2));
    }
    void display() {
        noStroke();
        fill(96, 58, 81);
        rect(x, 0 - (h / 2) - 2.5, w, h);
    }
    float x, v, a, w, h, m;
};

class BoxShadow {
    BoxShadow(float x_, float w_, float h_, float tx_, float ty_, float r_) {
        x = x_;
        w = w_;
        h = h_;
        tx = tx_;
        ty = ty_;
        r = r_;
        o = 255;
    }
    boolean dead() {
        return o <= 0;
    }
    void update() {
        o -= 1;
    }
    void display() {
        pushMatrix();
        translate(tx, ty);
        rotate(r);
        noStroke();
        fill(96, 58, 81, min(o, 25));
        rect(x, 0 - (h / 2) - 2.5, w, h);
        popMatrix();
    }
    float x, w, h, tx, ty, r, o;
};

void keyPressed() {
    if(key == CODED) {
        if(keyCode == LEFT) {
            teeterTotter.box.x -= 2;
        }
        else if(keyCode == RIGHT) {
            teeterTotter.box.x += 2;
        } 
    }
}
