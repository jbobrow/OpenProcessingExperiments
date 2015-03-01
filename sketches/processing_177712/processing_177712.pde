
int counter;

void draw () {
 counter ++;
 noStroke ();
 fill (random(200), 100, 144, 183);
 
if(mousePressed = = true) {
ellipse (mouseX, mouseY, 30, 30);
}
else {
ellipse (width/2, height/2, 80*sin(counter), 80*sin(counter));
}
