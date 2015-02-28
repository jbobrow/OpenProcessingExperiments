
//Summer Smith  
//7-8-2013
//project:sad to happy face
    //reference DMA and Amanda Rhee
  
void setup() {  
size(400, 400); //set screen size
}
void draw() {
  background(255);
    fill(190);
    ellipse(mouseX, mouseY, 175, 175);
    strokeWeight(6);
    arc(mouseX+18, mouseY+65, 85, 85, PI, PI+HALF_PI);
    fill(190);
    arc(mouseX+40, mouseY-30, 50, 50, QUARTER_PI, PI-QUARTER_PI);
    arc(mouseX-40, mouseY-30, 50, 50, QUARTER_PI, PI-QUARTER_PI);
if(mousePressed == true){
fill(255, 255, 0); 
}
if(mousePressed == true){
background(168, 234, 233);
ellipse(mouseX, mouseY, 175, 175);
fill(255);
ellipse(mouseX-40, mouseY-20, 35, 55);
ellipse(mouseX+40, mouseY-20, 35, 55);
fill(1);
ellipse(mouseX-40, mouseY-20, 15, 25);
ellipse(mouseX+40, mouseY-20, 15, 25);
fill(255, 255, 0);
arc(mouseX-1, mouseY+20, 100, 100, QUARTER_PI, PI-QUARTER_PI);
println("mouseX: " + mouseX + " mouseY: " + mouseY);
}
}
