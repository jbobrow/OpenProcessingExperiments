
int value = 0;

void setup (){
size(500, 500);
background(0, 50, 255);
fill(21, 35, 17);
triangle(0,500,500,0,500,500);
noStroke();
fill(255, 0, 0);
triangle(10,12,36,28,30,270);
ellipse(385, 400, 92, 189);
fill(225, 255, 0);
triangle(336, 280, 429, 280, 382, 333); 
ellipse(383, 280, 85, 40);
stroke(0);
noFill();
bezier(30,20,80,5,80,75,30,75);
bezier(354,275,306,240,291,272,244,285);
bezier(408,276,416,252,434,235,481,296);
}

void draw (){
if(value == 1){
 fill(0, 0, 0);
 ellipse(mouseX, mouseY, random(5, 80), random(5, 90));
 value=0;
}
println("mouse x: ");
println(mouseX);
println("mouse y: ");
println(mouseY);
}

void mouseReleased(){
 value=1;}



