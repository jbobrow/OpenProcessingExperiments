
ArrayList<Node> nodes = new ArrayList<Node>();
boolean M_PRESS = false;
int CLOSE_ENOUGH = 10;
boolean SIMPLIFY = false;

void setup() {
    size(600, 600);
    //    setGradient(0, 0, width, height, 
    //            color(10, 200, 255),
    //            color(5, 150, 200), 2);
    background(10, 200, 255, 20);
    seed();
}

void seed() {
    nodes = new ArrayList<Node>();

//    for (int i = 0; i < 88; i++) {
//        nodes.add(new Node(random(0, width), random(0, height)));
//    }

    //nodes.add(mouseNode);
}
Node mouseNode = new Node(0, 0);

void draw() {
    fill(23, 42, 40, 50);
    noStroke();
    rect(0, 0, width, height);

    int i = nodes.size() - 1;
    
    while (i >= 0) {
        Node n = nodes.get(i);
        n.frame();
        if (!n.alive) {
            nodes.remove(n);
            i--;
        }
        i--;
    }

    
    mouseNode.x = mouseX;
    mouseNode.y = mouseY;
    
    if (M_PRESS) {
        for (Node n : nodes) {
            n.x += (mouseX - n.x) / (100 + pow(n.getDistance(mouseNode), 2));
            n.y += (mouseY - n.y) / (100 + pow(n.getDistance(mouseNode), 2));
        }
    }
}

void mousePressed() {
    //M_PRESS = true;
    nodes.add(new Node(mouseX, mouseY));
}

void mouseReleased() {
    M_PRESS = false;
}

void keyPressed() {
    SIMPLIFY = !SIMPLIFY;
}
class Lin {
    Node a, b;
    Lin() {
    }

    Lin(Node _a, Node _b) {
        a = _a;
        b = _b;
    }

    void draw() {
        strokeWeight(2);
        stroke(10, 222, 
                map(getDistance(), 0, 100, 0, 255),
                map(getDistance(), 0, 80, 255, 0));
        line(a.pos('x'), a.pos('y'), b.pos('x'), b.pos('y'));
    }

    Node other(Node n) {
        if (a == n) return b;
        return a;
    }

    float getDistance() {
        return pow(pow(a.x - b.x, 2) + pow(a.y -  b.y, 2), 0.5);
    }
}

class Node {
    float x, y;
    float mass = random(10, 20);
    float ix = 0, iy = 0;
    ArrayList<Lin> connections = new ArrayList<Lin>();
    boolean alive = true;

    Node() {
    }

    Node(float _x, float _y) {
        x = _x;
        y = _y;
    }

    void draw() {
        fill(23, 200, 255, 20);
        ellipse(x, y, 5, 5);
    }

    void frame() {
        connect();
        float_frame();
//        if (mass > 1000) {
//            mass = 1000;
//        }
        draw();
    }

    void float_frame() {
        
        for (Lin l : connections) {
            Node o = l.other(this);
            float ox = o.x;
            float oy = o.y;
            if (ox < x) { 
                ix += ((ox - this.x) + random(50, 100)) / (10 * mass * connections.size());
            } 
            else { 
                ix += ((ox - this.x) - random(50, 100)) / (10 * mass * connections.size());
            } 
            if (oy < y) { 
                iy += ((oy - this.y) + random(50, 100)) / (10 * mass * connections.size());
            } 
            else {
                iy += ((oy - this.y) - random(50, 100)) / (10 * mass * connections.size());
            }
            float oix = o.ix;
            float oiy = o.iy;
            
            if (SIMPLIFY)
            if (abs(x - ox) < CLOSE_ENOUGH 
                    && abs(y - oy) < CLOSE_ENOUGH
                    && this.alive) {
                o.alive = false;
                this.mass += o.mass / 2;
            }
        }

        ix += random(-1., 1.) / mass;
        iy += random(-1., 1.) / mass;

        x += ix;
        y += iy;

        if (x > width || x < 0) { 
            ix = ix * -1;
        }
        if (y > height || y < 0) { 
            iy = iy * -1;
        }
        
        ix /= 2; iy /= 2;
    }

    void connect() {
        connections = new ArrayList<Lin>();
        for (Node n : nodes) {
            float d = getDistance(n);
            if (d > 0) {
                connections.add(new Lin(this, n));
            }
        }
        for (Lin l : connections) {
            l.draw();
        }
    }

    float getDistance(Node n) {
        float distance = pow(
        pow(this.x - n.x, 2)
            + pow(this.y - n.y, 2)
            , 0.5);
        if (distance > ((width + height) / 2) / 5) {
            return -1;
        } 
        else {
            return distance;
        }
    }

    float pos(char xy) {
        if (xy == 'x') { 
            return this.x;
        }
        else { 
            return this.y;
        }
    }
}

void setGradient(int x, int y, float w, float h, 
        color c1, color c2, int axis ) {
  noFill();

  if (axis == 2) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == 1) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
