
// Estar Guars
// Enrique Canto
//
// El programa tarda en cargar con javascript


float s;
float pos1;
float pos2;
float pos3;
float pos4;
PVector[] location;

void setup() 
{
	size(512, 512);
	s = 40.0;
	stellar();
}

void draw() 
{
	
	pos1 = mouseX - s;
	pos2 = mouseY - s;
	pos3 = mouseX + s;
	pos4 = mouseY + s;

	background(0);

	for (PVector vector : location) {

		fill(255);
		strokeWeight(1);
		ellipse(vector.x, vector.y, vector.z, vector.z);

	}

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

void stellar()
{
	int numberOfStars = 100;
	location = new PVector[numberOfStars];
	int counter = 0;
	while(counter < numberOfStars)
	{
		for(int posx = 0; posx < width; posx++)
		{
			for(int posy = 0; posy < height; posy++)
			{
				float ellipseSize;

				if (random(2) == 1) {

					ellipseSize = random(1.0, 4.0);
					ellipse(posx, posy, ellipseSize, ellipseSize);
					location[counter] = new PVector(posx,posy,ellipseSize);
					counter++;

				}

			}
		}
	}
}


