
void setup() {
    size(800, 640, P2D);
    background(0);
    ps = new PShape();
    ps = createShape();
    ps.beginShape();
    ps.fill(137, 85, 56);
    ps.vertex(500, 350);
    ps.vertex(450, 400);
    ps.vertex(350, 420);
    ps.vertex(330, 360);
    ps.vertex(350, 370);
    ps.vertex(425, 360);
    ps.vertex(425, 270);
    ps.vertex(415, 270);
    ps.vertex(415, 362);
    ps.vertex(500, 350);
    ps.endShape();
    
}

PShape ps, mouse;
int x = 200, y = 300;

void draw(){
    fill(254, 235, 169);
    rect(50, 50, 700, 500); 
    fill(255);
    rect(50, 50, 700, 20);
    fill(0);
    text("http://www.p3l4int3rn3t.com.br", 60, 65);
    fill(253, 216, 87);
    ellipse(300, 270, 100, 100);
    fill(0, 162, 232);
    rect(50, 300, 700, 330);
    fill(255, 204, 221);
    ellipse(450, 280, 20, 20);
    
    fill(0);
    line(446, 275, 446, 280);
    line(454, 275, 454, 280);
    ellipse(450, 285, 10, 5);
    fill(34, 177, 76);
    rect(437, 290, 26, 40);
    fill(255, 127, 39);
    rect(440, 330, 10, 40);
    rect(450, 330, 10, 40);
    fill(255, 204, 221);
    rect(431, 290, 7, 33);
    rect(461, 290, 7, 33);
    shape(ps);
    fill(240, 231, 183);
    triangle(415, 270, 320, 360, 415, 360);
    
}


