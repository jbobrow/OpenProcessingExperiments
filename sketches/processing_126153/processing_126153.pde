
class Vector {
    float x;
    float y;
    
    Vector() {
        x = 0;
        y = 0;
    }
    
    Vector(_x, _y) {
        x = _x
        y = _y
    }
    
    Vector(Vector v) {
        x = v.x
        y = v.y
    }
}

void setup() {
    size(250,250)
}

void draw() {
    Vector v = new Vector(width/2, height/2)
    fill(255, 0, 0)
    ellipse(v.x, v.y, 40, 40)
}
