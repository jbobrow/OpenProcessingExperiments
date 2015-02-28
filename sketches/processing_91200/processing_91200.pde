
color[] cool = {#363333, #007C7C, #00C8C8, #FFFFFF, #FFD300};
color [] palette = cool;


void setup(){
    size(600, 600);
    backround(palette[0]);
    noStroke();
    fill(palette[2]);
}

void draw() {
circle(width/2, height/2, 300);
}

//fefine function
void circle(float x, float y, float d) {
    ellipse(x, y, d, d);
}
