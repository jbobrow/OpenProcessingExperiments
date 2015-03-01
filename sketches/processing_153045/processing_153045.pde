
int x=100;
int dx = 1;

void setup(){
size(640,480);


}

void draw(){
background(155);
println(mouseX);
println(mouseY);
ellipse(x,160,75,75);
x = x + dx;

if(x + 40 > width) {
dx = -1;
}

if(x - 40 < 0) {
dx = 1;
}




}

