
ﬂoat circleDiameter = 50;
int redBalance = 220;
void setup(){
size(500, 500);
}
void draw(){
background(100);
ﬁll(redBalance, 100, 100);
ellipse(mouseX, mouseY, circleDiameter, circleDiameter);
}
