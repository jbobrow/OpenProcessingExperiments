
//Creates a window 1000 pixels wide by 1000 pixels high and then starts drawing white circles at the position of the mouse.When the mouse button is pressed, the circle color changes to black.
Void setup(){
size(1000,100);
smooth();
}

Void draw(){
if(mousePressed) {
fill(0);

}else{

fill(255);

}

ellipse(mouseX,mouseY,80,80);

}
