
class Vector {
    float x;
    float y;

    /* constructors */
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

    /* addition */
    void add(Vector a) {
        x += a.x;
        y += a.y;
    }

    static Vector add(Vector a, Vector b) {
        Vector v = new Vector(a.x + b.x, a.y + b.y);
        return v;
    }

    /* subtration */
    void sub(Vector a) {
        x -= a.x;
        y -= a.y;
    }

    static Vector sub(Vector a, Vector b) {
        Vector v = new Vector(a.x - b.x, a.y - b.y);
        return v;
    }

    /* multiplication */
    void mult(float n) {
        x *= n;
        y *= n;
    }

    static Vector mult(Vector a, float n) {
        Vector v = new Vector(a.x * n, a.y * n);
        return v;
    }
    
    /* division */
    void div(float n) {
        x /= n;
        y /= n;
    }

    static Vector div(Vector a, float n) {
        Vector v = new Vector(a.x / n, a.y / n);
        return v;
    }
    
    /* magnitude */
    float mag() {
        return sqrt(x*x + y*y);
    }
    
    /* normalize */
    void normalize() {
        float m = mag();
        if (m != 0) div(m);
    }
}

