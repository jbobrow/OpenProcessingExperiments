
void setup() {
size(500,600);
background(255);
for(int i=60;i<600;i=i+30)
{
stroke(0,200,140,50);
line(0,i,510,i);
}
stroke(200,45,45,50);
line(65,0,65,600);
}


void draw() {
stroke(0);
strokeWeight(1);
smooth();
if (mousePressed && (mouseButton == LEFT))
{
line(pmouseX, pmouseY, mouseX, mouseY);
}
else if (mousePressed && (mouseButton == RIGHT))
{
}
}
