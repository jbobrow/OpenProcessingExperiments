
void setup() {
    size(600,400);
    background(0);
    for (int i=0; i<1000; i++) {
        float a = random(255);
        fill(random(255), random(255), random(255), a);
        stroke(0,0,0,a);
        ellipse(random(600), random(400), random(350), random(350));
    }
}
