
PFont font;

void setup() {
size(400, 200);
smooth();
font = loadFont("HelveticaNeue-Medium-48.vlw");
textFont(font);
}


void draw() {
background(#A500FF);
textSize(25);
text("speed", 160,100);
if (mousePressed == true){

for (int x = -20; x < width; x += 20) {
float mx = mouseX / 2;
float offsetB = random(-mx, mx);
textSize(25);
text("speed", x - offsetB, 100);
}

}
}


