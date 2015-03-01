
void setup() {
size(400, 300);
framerate (1);
smooth();
strokeWeight(4);
int a;
}
void draw() {
background(204);
if (keyPressed) a = key;
text (a, 50, 50);
}
