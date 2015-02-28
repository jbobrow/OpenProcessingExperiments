
color[] spring = {#000000, #F65195, #41C01D, #faaaab, #85db24, #4aee0b, #a4eb55, #fd00eb};
color[] palette = spring;
float limiter = 0;

void setup() {
size(600, 600);
background(palette[0]);
smooth();
strokeWeight(10);
noFill();
frameRate(5);   
}

void draw() {
    while(limiter < 20) {
        stroke(palette[int(random(1, 5))]);
        float x = random(width);
        float y = random(height);
        float d = random(20, 200);
        ellipse(x, y, d, d);
        limiter += random (-1, +2);
   }
}
