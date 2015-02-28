
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
noFill();
stroke(255, 100, 0);
float r = random(200);

pushMatrix();
rectMode(CENTER);
rotate(radians(60));


stroke(255);
rect(mouseX, mouseY, 200,200);
fill(255,0,0,50);
rect(30, mouseY, 100,100);
rect(mouseX, 30, 100,100);
fill(0,0,random(255));
translate(-100, 0);
rotate(millis()/1000.0);
translate(100,100);
rect(mouseY, mouseX, 30,10);
popMatrix();
resetMatrix();


triangle(mouseX, mouseY, 20,20, 40, 40);
println(mouseX);
}
