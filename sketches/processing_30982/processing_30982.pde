
void setup() { 
size(500,500);
background(color(255, 255, 255));

}

void draw() {
background(mouseX,mouseY,mouseX);
textSize(15);
fill(0, 0, 0);
text("Click and hold the mouse then move the mouse around", 25, 250);
  if(mousePressed==true){
background(mouseX,mouseY,mouseY);
 fill(12, 200, 30);
 ellipse(250, 100, 200, 125);
 line(200, 155, 200, 325);
 line(300, 155, 300, 325);
 line(200, 325, 300, 325);
 line(200, 250, 75, 125);
 line(300, 250, 380, 125);
 line(225, 325, 225, 420);
 line(275, 325, 275, 420);
 fill(255,0,255);
 rect(190, 75, 30, 15);
 rect(275, 75, 30, 15);
 rect(210, 130, 80, 15);
 textSize(25);
 text("People of Earth. I come in peace.", 70, 450);
  
}
}
