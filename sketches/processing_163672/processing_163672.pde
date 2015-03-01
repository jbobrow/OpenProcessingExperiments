
int y = 0;
void setup() {
size(300, 300);
fill(255,0,0,10);

}
void draw() {
line(0, y, 300, y);
y = y + 21;
ellipse(0,y,300,y);
ellipse(150,y,300,y);
ellipse(300,y,300,y);
}


