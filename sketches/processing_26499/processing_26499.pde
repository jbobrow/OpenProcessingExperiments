
void setup() {
size(383, 500);

}

void draw() {
PImage vader = loadImage("vader.jpg");  
PImage luke = loadImage("luke.jpg");


background(luke);

tint(0, 200, 200);
image(luke, 0, 0);

tint(200, 200, mouseX, mouseY);
image(vader, 0, 0);
}

