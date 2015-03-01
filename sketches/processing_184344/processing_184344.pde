


int x;
int y; 
int fall;
float fallpos;
float back;
float back2;
int left, right, bottom;
int ellipsecolour;
float r, g, b; 
float r1, g1, b1;
float r2, g2, b2;




void setup() {
	
size(700, 700);

}

void draw() {

	noCursor();

	back = map(y, 0, 700, 80, 0);
	
	fill(#C2EBFF, back);
	rectMode(CORNER);
  rect(0, 0, 700, 700);

x = mouseX;
y = mouseY; 

left = mouseX  - 50;
right = mouseX + 50; 
bottom = mouseY;



fall = fall + 8;

if (fall > 690) {
	fall = 0;
	
}

if (fallpos > left && fallpos < right && fall > bottom && fall < bottom + 10) {

	r2 = r;
	g2 = g;
	b2 = b;

	fall = 0;
}

if (fall < 2) {
	fallpos = random(10, 690);
	ellipsecolour = 0;	
	r = random(0, 255);
	g = random(0, 255);
	b = random(0, 255);

	r1 = r;
	g1 = g;
	b1 = b;


}

// PUCK rectangle 

stroke(r2, g2, b2);
fill(r2, g2, b2);
rectMode(CENTER);
	rect(x, y, 100, 10);

// falling rectangle 

	stroke(r1, g1, b1);
	fill(r1, g1, b1);
	rect(fallpos, fall, 10, 20);

	


	
}


