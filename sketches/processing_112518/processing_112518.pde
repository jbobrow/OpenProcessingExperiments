
void setup(){
size(400, 400);
}
// Click within the image to change
// the value of the rectangle
int value = 0;
void draw() {
fill(value);
rect(width/2-100,height/2-150,200,300);
}
void mousePressed() {
if(value == 0) {
value = 255;
} else {
value = 0;
}
}


