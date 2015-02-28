
float gray = 0.0;
int [] x = {150,161,183,169,171,150,129,131,117,139};
int [] y = {118,137,143,160,182,173,182,160,143,137};
int [] x2 = new int[5];
int [] y2 = new int[5];
void setup()
{
size(400,400);
background(255);

for (int i = 0; i < 5; i++)
{
x2[i] = (int)random(1, 50);
y2[i] = (int)random(40, 100);
}
}
void draw()
{
for (int i=0; i < 400; i++)
{
float percent = (float)i/400;
stroke(255 * percent, 100, 100);
line(0,i,400,i);
stroke(10,200);
}for (int i = 0; i < width; i += 10) {
for (int j = 0; j < height; j += 10) {
line(i, j, i, height);
line(i, j, width, j);
}
}
pushMatrix();
translate(-30,-50);
rotate(radians(30));
drawShapes(30);
popMatrix();
pushMatrix();
translate(20,-50);
rotate(radians(340));
drawShapes(80);
popMatrix();
pushMatrix();
translate(20,30);
rotate(radians(-10));
drawShapes(120);
popMatrix();
pushMatrix();
translate(20,110);
rotate(radians(-10));
drawShapes(20);
popMatrix();
pushMatrix();
translate(50,-180);
rotate(radians(30));
drawShapes(20);
popMatrix();

}
void drawShapes(float offset)
{
beginShape();
for (int i = 0; i < x.length; i++)
{
vertex(x[i]+offset, y[i]+30);
}
endShape();
}
