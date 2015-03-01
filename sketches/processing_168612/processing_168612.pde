
void setup()
{
size(500,500);
background(0);
noFill();
stroke(255);
}

void draw()
{
pushMatrix();
float my_angle = map(mouseX, 100, width, 0, 35*PI);
translate(width/2, height/2);
rotate(my_angle);
triangle(10,500, 150, 100,40,20);
popMatrix();

}

