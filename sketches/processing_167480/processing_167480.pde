
// Estar Guars
// Enrique Canto

float s;
float pos1;
float pos2;
float pos3;
float pos4;

void setup() 
{
	size(512, 512);
	s = 40.0;
}

void draw() 
{

	pos1 = mouseX - s;
	pos2 = mouseY - s;
	pos3 = mouseX + s;
	pos4 = mouseY + s;

	background(0);

	float ellipseSize = mouseY * .10;

	strokeWeight(3);
	stroke(255);
	line(pos1, pos2, pos3, pos4);
	line(pos3, pos2, pos1, pos4);
	line(mouseX, pos2, mouseX, pos4);
	
	fill(0, 0, map(mouseY, 0, height, 0, 255));
	ellipse(pos1, pos2, ellipseSize, ellipseSize);
	ellipse(pos3, pos2, ellipseSize, ellipseSize);
	ellipse(pos1, pos4, ellipseSize, ellipseSize);
	ellipse(pos3, pos4, ellipseSize, ellipseSize);
	ellipse(mouseX, mouseY, ellipseSize * 2, ellipseSize * 2);

}


