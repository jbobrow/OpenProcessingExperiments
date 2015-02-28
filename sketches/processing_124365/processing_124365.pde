
void setup() {
    size(500, 500);
    x = 250
    y = 250
}

void draw() {
    background(225);  //set background white
    ellipse((x++)%width,y%height, 20, 20);
}
