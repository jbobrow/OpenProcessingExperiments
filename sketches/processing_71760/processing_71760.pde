
void setup() {
size(600, 400);
}

void draw() {
background(127);
line(width/3, 0, width/3, height);
line(2*width/3, 0, 2*width/3, height);

if (mouseX< width/3){

rect(0, 0, width/3, height);
}else if(mouseX < width * 2 / 3){

rect(width/3, 0, width/3, height);
}else {
rect(2*width/3, 0, width/3, height);
}
}
