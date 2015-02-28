
int x;
x = 50;
float y = int(random(400));
int s = 310;
int r = 360;
float n = random(20)+310;
float m = int(random(10));
println("m = " + m);
float die = int(random(5)+1);
println("die = " + die);
color gold = #dfe14f;

void setup(){
    size(400, 400);
    smooth();
}

void draw(){
    background(#7b4390);
    fill(gold);
    noStroke();
    ellipse(x, y, 85, 85);
    y ++;
    fill(gold);
    noStroke();
    triangle(s, 20, s, 80, r, 50);
    s -=2
    r--
    s = constrain (s, 5, width);
    r = constrain (r, 55, width);
    ellipse(n, 300, 45, 80);
    n +=.5;
}
