
int maxLevel = 5;

void setup() {
    size(400, 400);
    stroke(0);
    initTriangle();   
}


void initTriangle() {
    fill(255, 50);
    rect(0,0,width, height);
    drawTriangle(
        new Vec2(0, 0),
        new Vec2(width, 0),
        new Vec2(0, height),
        0
    );     
    drawTriangle(
        new Vec2(width, height),
        new Vec2(width, 0),
        new Vec2(0, height),
        0
    ); 
}

void drawTriangle(Vec2 a, Vec2 b, Vec2 c, int level) {    
    line(a.getX(), a.getY(), b.getX(), b.getY());
    line(b.getX(), b.getY(), c.getX(), c.getY());
    line(c.getX(), c.getY(), a.getX(), a.getY());
    if (level == maxLevel) {
        return;
    }
    
    float ac = random(0.1, 0.9);
    float ab = random(0.1, 0.9);
    float bc = random(0.1, 0.9);
    drawTriangle(
        new Vec2(a.getX(), a.getY()),
        new Vec2(a.getX() + (b.getX()-a.getX())*ab, a.getY() + (b.getY()-a.getY())*ab),
        new Vec2(a.getX() + (c.getX()-a.getX())*ac, a.getY() + (c.getY()-a.getY())*ac),
        level + 1
    );
    drawTriangle(
        new Vec2(b.getX(), b.getY()),
        new Vec2(a.getX() + (b.getX()-a.getX())*ab, a.getY() + (b.getY()-a.getY())*ab),
        new Vec2(b.getX() + (c.getX()-b.getX())*bc, b.getY() + (c.getY()-b.getY())*bc),
        level + 1
    );
    drawTriangle(
        new Vec2(c.getX(), c.getY()),
        new Vec2(a.getX() + (c.getX()-a.getX())*ac, a.getY() + (c.getY()-a.getY())*ac),
        new Vec2(b.getX() + (c.getX()-b.getX())*bc, b.getY() + (c.getY()-b.getY())*bc),
        level + 1
    );
}

void draw() {
  initTriangle();
}

