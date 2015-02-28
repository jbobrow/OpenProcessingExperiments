
int x1;
int x2;
int x3;
int y1;
int y2;
int y3;

void setup() {
size(500,500);

x1 = width/2;
y1 = 250;
y2 = height/2;
x2 = x1;
y2 = y1;
x3 = x2 + 300;
y3 = y2 - 300;
println(x1);
println(y1);
}

void draw(){
for (int i=0; i<1000; i+=1) {
x2 = constrain( (x2-20+(round(random(40)))), -80, width+30);
y2 = constrain( (y2-20+(round(random(40)))), -80, width+30);
smooth();

//draws a triangle
fill(random(255), 50, 60);
triangle(x1, y1, x2, y2, x3, y3);

// the triangles are joined here

x3=x2;
y3=y2;
}
//noLoop();

}

