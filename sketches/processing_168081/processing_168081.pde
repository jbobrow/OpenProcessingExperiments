
//void setup() {
//size(400,400);
//}

//void draw() {
//rect(150,130,100,100);
//line(250,200,150,200);
//ellipse(200,160,20,30);
//}

void setup() {
size(400,400);
}

void draw() {
drawFace(100,100,color(255,0,0));
}

void drawFace(int x, int y) {
rect(x+50,y+20,100,100);
line(x+150,y+100,150,200);
ellipse(x+100,y+55,20,30);
}
