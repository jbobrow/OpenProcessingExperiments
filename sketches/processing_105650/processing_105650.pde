
void setup() {

    size(220,220);
    smooth();

}

float x;
float x2 = 110;
float y2
float easing = 0.01;
float easing2 = 0.5;

void draw()  {
    background(200);
    float targetX = mouseX;
    float targety = mouseY;

    x += (targetX - x) * easing;
    ellipse(x,40,12,12);
    println(targetX + " : " + x);

    if (x2 > targetX) {    
        x2 -= easing2;
    }

    if (x2 < targetX) {
        x2 += easing2;
    }
        ellipse(x2,80,12,12);
    }
