
ArrayList<Point> points = new ArrayList<Point>();
float bg;

void setup() {
    size(500, 500);
    noStroke();
    colorMode(RGB, height, height, height, height);
    bg = height;
}

void draw() {
    background(bg);
    for (int i = (int)random(2); i > 0 && frameCount%5 == 0; i--) {
        points.add(new Point());
    }
    for (int p = points.size()-1; p > 0; p--) {
        Point actualP = points.get(p);
        actualP.display();
        if (actualP.getY() < -5) {
            points.remove(p);
        }
    }
}

class Point {
    float x, y, moveY;
    color c;
    public Point() {
        x = random(width);
        y = height;
        moveY = random(0.3, 0.8);
        c = color(random(height/4, height), random(height/4, height), random(height/2, height), height);
    }

    void display() {
        move();
        fill(c, y%height);
        ellipse(x, y, 20*moveY, 20*moveY);
    }

    void move() {
         y -= moveY;
         x += random(-0.2, 0.2);
    }

    float getY() {
        return y;
    }
}
