
//Amanda Rhee
//July 8, 2013
//Project: Happy Face
  //Reference: DMA and Summer Smith
void setup() {
size(400, 400);
}
void draw() {
  background(255);
    fill(120);
    ellipse(mouseX, mouseY, 200, 200);
    strokeWeight(6);
    arc(mouseX-40, mouseY-30, 50, 50, QUARTER_PI, PI-QUARTER_PI);
    arc(mouseX+40, mouseY-30, 50, 50, QUARTER_PI, PI-QUARTER_PI);
    arc(mouseX+10, mouseY+65, 90, 90,PI, PI+HALF_PI);
   
if(mousePressed == true){
fill(255, 255, 0);
}
if(mousePressed == true){
background(168, 234, 233);
ellipse(mouseX, mouseY, 200, 200);
fill(255);
ellipse(mouseX-40, mouseY-10,40, 60);
ellipse(mouseX+40, mouseY-10, 40, 60);
fill(0);
ellipse(mouseX-40, mouseY-10, 20, 30);
ellipse(mouseX+40, mouseY-10, 20, 30);
fill(255, 255, 0);
arc(mouseX-1, mouseY+20, 100, 100, QUARTER_PI, PI-QUARTER_PI);
println("mouseX:" + mouseX + ", mouseY:" + mouseY);
}
}
