
void setup() {
    size(400, 400);
}

void draw() {
    float k = abs(mouseY - 0.5 * height);
    
    stroke(0x99, 0xcc, 0x66, 0x99);
    noFill();
    
    background(0x33);
    for (int i = 0; i < 40; i++) {
        float k = pow(0.9, i);
        float z = (mouseY - 0.5 * height) * k;
        strokeWeight(20 * k);
        point(0.5 * width, 0.5 * height + z);
        for (float x = 50 * k; x < 0.5 * width; x += 50 * k) {
            point(0.5 * width - x, 0.5 * height + z);
            point(0.5 * width + x, 0.5 * height + z);
        }
    }
}
