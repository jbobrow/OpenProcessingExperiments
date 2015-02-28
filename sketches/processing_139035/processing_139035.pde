
void setup() {
    // Simple House
    size(600, 600);
    background(#85B7E8);
    // house
    fill(#1A5A25);
    rect(250, 250, 300, 300);
    // roof
    triangle(250, 250, 550, 250, 400, 50);
    // door
    fill(#502C0A);
    rect(375, 450, 50, 100);
    // door knob
    ellipse(385, 515, 6, 6);
    // left windows
    fill(#F5ED57);
    rect(285, 300, 40, 40);
    rect(330, 300, 40, 40);
    rect(285, 345, 40, 40);
    rect(330, 345, 40, 40);
    // right windows
    fill(#F5ED57);
    rect(430, 300, 40, 40);
    rect(475, 300, 40, 40);
    rect(430, 345, 40, 40);
    rect(475, 345, 40, 40);
}
