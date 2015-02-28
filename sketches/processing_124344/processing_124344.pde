
void setup() {
    size(500, 500);
    x = 50
    y = 250
}

void draw() {
    background(255);  //set background white
    ellipse(x, (y++)%width, 20, 20);
}

