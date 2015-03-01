
int counter;
int x = 20;
int y = 20;
int dx = 5;
int dy = 3;
int u = 200;
int v = 200;
int du = 3;
int dv = 5;


void setup() {  //setup function called initially, only once
    size(400,400);
}

void draw() {  //draw function loops 
    fill(200,0,0)
    ellipse(x,y,20,20);
    x = x + dx;
    y = y + dy;
    if (x > 400) {
        dx = -5;
    } 
    if (x < 0) {
        dx = 5;
    }
    if (y > 400) {
        dy = -3;
    }
    if (y < 0) {
        dy = 3;
    }
    
    ellipse(u,v,25,25);
    u = u + du;
    v = v + dv;
    if (u > 400) {
        du = -3;
    } 
    if (u < 0) {
        du = 3;
    }
    if (v > 400) {
        dv = -5;
    }
    if (v < 0) {
        dv = 5;
    }
    
}
