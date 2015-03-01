
int x=100;
int dx = 1;

void setup(){
size(640,480);


}

void draw(){
background(155);

ellipse(x,160,75,75);
ellipse(x-50, 80, 45,45);
ellipse(x-80, 50, 35,35);
ellipse(x+25, 75, 55,55);
x = x + dx;

if(x + 40 > width) {
dx = -1;
}

if(x - 40 < 0) {
dx = 1;
}


println(mouseX);
println(mouseY);
}
