
void setup (){
 size(500,500);
 
 frameRate(20); // set the framerate of the sketch to 20
}


void draw() {
 background(9,159,126);
 fill(mouseX, mouseY ,0, 255);
 ellipse(mouseX,mouseY,mouseX,300);
 
 
 println(frameRate); 
}

