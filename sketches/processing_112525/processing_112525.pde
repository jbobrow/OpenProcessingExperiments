
void setup(){
size(400,400);
 
}
 
void draw(){
background(115,26,210);
fill(#1AD2B9);
stroke(113,235,122);
strokeWeight(2);
rect(mouseX-100,mouseY-100,mouseX+100,mouseY-100);
fill(#1AD2B9);
rect(100,100,100,100);
line(100,100,mouseX-100,mouseY-100);
line(mouseX+100,mouseY-100,200,100);
line(mouseX-100,mouseY+100,100,200);
line(mouseX+100,mouseY+100,200,200);
 
println(mouseX + " " + mouseY);
 
}
