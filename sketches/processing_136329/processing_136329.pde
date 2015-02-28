
int x1;
int x2;
int x3;
int y1;
int y2;
int y3;

void setup() {
 size(600,600);
 
 x1 = width/8;
 y2 = height/4;
 x2 = x1;
 y2 = y1;
x3 = x1;
y3 = y1;
}

void draw(){
x2 = constrain( (x2-20+(round(random(40)))), -20, width+50);
y2 = constrain( (y2-20+(round(random(40)))), -20, width+50);
smooth();

fill(round(random(150)),100,100);
triangle(x1, y1, x2, y2, x3, y3);

x3=x2;
y3=y2;
}


