
// projection mapping for 4 control points
Vertex a = new Vertex(100, 500, "a");
Vertex b = new Vertex(100, 300, "b");
Vertex c = new Vertex(300, 300, "c");
Vertex d = new Vertex(300, 500, "d");
//
// b ------- c
// | ....... |
// | ....... |
// a ------- d
//
Vertex e = new Vertex(0, 0, "e"); // extends a-b
Vertex f = new Vertex(0, 0, "f"); // extends a-d
Vertex g = new Vertex(0, 0, "g"); // doubles a-c
Vertex h = new Vertex(0, 0, "h"); // intersects f-g
Vertex i = new Vertex(0, 0, "i"); // intersects e-g
Vertex j = new Vertex(0, 0, "j"); // helper

float abe, eig, fhg;

Vertex[] drawnVertices;
Vertex[] dragableVertices;

public void setup() {
    size(600, 600);

    dragableVertices = new Vertex[4];
    dragableVertices[0] = a;
    dragableVertices[1] = b;
    dragableVertices[2] = c;
    dragableVertices[3] = d;

    drawnVertices = new Vertex[9];
    drawnVertices[0] = a;
    drawnVertices[1] = b;
    drawnVertices[2] = c;
    drawnVertices[3] = d;
    drawnVertices[4] = e;
    drawnVertices[5] = f;
    drawnVertices[6] = g;
    drawnVertices[7] = h;
    drawnVertices[8] = i;

    for (Vertex p : drawnVertices) {
        p.fillCol = color(128, 128, 256);
        p.strokeCol = color(0);
    }

    for (Vertex p : dragableVertices) {
        p.fillCol = color(256, 128, 128);
        p.strokeCol = color(0);
    }

    smooth();
}

public void draw() {
    background(color(128));

    for (Vertex p : dragableVertices) {
        p.dragUpdate(mouseX, mouseY);
    }

    calculatePoints();

    for (Vertex p : drawnVertices) {
        p.draw(this);
    }
    
    text("|ae| / |ab| = |af| / |ad| = " + abe, 2, 12);
    text("|fg| / |fh| = " + fhg, 2, 24);
    text("|eg| / |ei| = " + eig, 2, 36);
}

private void calculatePoints() {
    g.set(d).sub(b).add(c);
    e.atIntersection(a, b, g, c);
    f.atIntersection(a, d, g, c);
    h.set(b).sub(a).add(f);
    i.set(d).sub(a).add(e);
    g.atIntersection(e, i, f, h);
    h.atIntersection(b, c, g, f);
    i.atIntersection(d, c, g, e);
    abe = getRatio(a, b, e);
    eig = getRatio(e, i, g);
    fhg = getRatio(f, h, g);
}

private float getRatio(Vertex a, Vertex b, Vertex c) {
    return j.set(b).sub(a).len() / j.set(c).sub(a).len();
}

public void mousePressed() {
        for (Vertex p : dragableVertices) {
                p.dragStart(mouseX, mouseY);
        }
}

public void mouseReleased() {
        for (Vertex p : dragableVertices) {
                p.dragEnd(mouseX, mouseY);
        }
}

public void mouseExited() {
        for (Vertex p : dragableVertices) {
                p.dragEnd(mouseX, mouseY);
        }
}

class Vertex {
        float x;
        float y;
        float d;
        String name;
        int fillCol;
        int strokeCol;

        public Vertex(float x, float y, String name) {
                this.x = x;
                this.y = y;
                this.name = name;
                this.d = 16;
        }

        boolean isDrag;

        public void dragUpdate(int mouseX, int mouseY) {
                if (isDrag) {
                        this.x = mouseX;
                        this.y = mouseY;
                }
        }

        public void dragEnd(int mouseX, int mouseY) {
                isDrag = false;
        }

        public void dragStart(int mouseX, int mouseY) {
                isDrag = isInside(mouseX, mouseY);
        }

        public void draw(PApplet p5) {
                p5.fill(fillCol);
                p5.stroke(strokeCol);
                p5.ellipse(x, y, d, d);
                p5.fill(strokeCol);
                p5.text(name, x - 3, y + 5);
        }

        public boolean isInside(float x, float y) {
                return sqrt((this.x - x) * (this.x - x) + (this.y - y) * (this.y - y)) < d / 2;
        }

        public Vertex set(Vertex p) {
                this.x = p.x;
                this.y = p.y;
                return this;
        }

        public Vertex add(Vertex p) {
                this.x += p.x;
                this.y += p.y;
                return this;
        }

        public Vertex sub(Vertex p) {
                this.x -= p.x;
                this.y -= p.y;
                return this;
        }

        public Vertex mul(float f) {
                this.x *= f;
                this.y *= f;
                return this;
        }

        public float len() {
                return sqrt(this.x * this.x + this.y * this.y);
        }

        public Vertex normalize() {
                return mul(1.f / len());
        }

        public void atIntersection(Vertex start1, Vertex end1, Vertex start2, Vertex end2) {
                // http://en.wikipedia.org/wiki/Line-line_intersection
                float l1 = (start1.x * end1.y - start1.y * end1.x);
                float l2 = (start2.x * end2.y - start2.y * end2.x);
                float q = 1.f / ((start1.x - end1.x) * (start2.y - end2.y) - (start1.y - end1.y) * (start2.x - end2.x));
                this.x = (l1 * (start2.x - end2.x) - (start1.x - end1.x) * l2) * q;
                this.y = (l1 * (start2.y - end2.y) - (start1.y - end1.y) * l2) * q;
        }
}
