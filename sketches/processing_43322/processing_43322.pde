
int x, y;
float r = 550; // radius

float angle, angle2, theta;
float speed = 0.007; // amout to increase each redraw (in radians)
int rayNum = 6; // number of rays
int rayAngle = 20; // angle of each ray

void setup() {
	size(600, 600);
	smooth();
	noStroke();
	
	background(240);

	x = height/2;
	y = height/2;
	
	fill(85, 98, 112);
}

void draw() {
	background(240);
	//ellipse(x, y, 120, 120);
	
	for(int i = 0; i <= rayNum; i++) {
		angle = i * radians(360/(rayNum+1)) + theta;
		angle2 = angle + radians(rayAngle);

		float x2 = x + r * cos(angle);
		float y2 = y + r * sin(angle);
		
		float x3 = x + r * cos(angle2);
		float y3 = x + r * sin(angle2);	
		
		triangle(x, y, x2, y2, x3, y3);
	}

	theta += speed;
}

