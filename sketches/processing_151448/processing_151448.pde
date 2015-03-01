
void setup()
{
size(500, 500);
background(255);
noFill();
}
void draw()
{
//background(255);
translate(width/2, height/2);
rectMode(CENTER);
rotate(mouseX);
pushMatrix();
stroke(0, 200, 100,random(15));
rect(mouseX+20, mouseY, 200,200);
translate(-100, 0);
popMatrix();
resetMatrix();
triangle(mouseX, mouseY, 20,20, 40, 40);
//get Koordinaten
println(mouseX);
println(mouseY);
}
