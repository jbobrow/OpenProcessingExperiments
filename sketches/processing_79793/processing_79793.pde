


void setup() {
size(200, 200);

}
int a = 0;
int b = 0;
int c = 0;
int d = 0;
int diameter = 5;
int diameter2 = 5;
void draw() {
  ellipse(200,200,diameter,diameter);
diameter = diameter + 1;
ellipse(0,0,diameter2,diameter2);
diameter2 = diameter2 + 1;
noLoop();
stroke(173,12,135);
line(a++, 10, 190, 190);
stroke(12,231,237);
line(b++,190,190,10);
stroke(60,237,12);
line(c++,c++,190,100);
stroke(250,13,28);
line(190,100,d++,190);
}

void mousePressed(){
a++;
redraw();
b++;
redraw();
c++;
redraw();
d++;
redraw();
}



