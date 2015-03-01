
boolean rectOver = false;
color baseColor;
void setup() {
size(300, 300);
}
void draw() {
update(mouseX, mouseY);
if(rectOver){
fill(134);
}else{
fill(255);
}
rect(100,100,100,100);
}
void update(int x, int y) {
if ( overRect(100,100,100,100) ) {
rectOver = true;
} else {
rectOver = false;
}
}
boolean overRect(int x, int y, int width, int height) {
if (mouseX >= x && mouseX <= x+width &&
mouseY >= y && mouseY <= y+height) {
return true;
} else {
return false;
}
} 
