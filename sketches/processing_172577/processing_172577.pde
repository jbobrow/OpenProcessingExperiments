
void setup() {
	size(800, 600);
	background(100);
	stroke(255);
	//ellipse(50,50,25,25);
	//println("hello web!");
	}
	

void draw() {
int d = mouseX;
int e = mouseY;
stroke(100);
if (mousePressed == true) {
fill(116, 193, 206);
rect(d+30, e, 33, 33);
rect(d-30, e, 33, 33);
rect(d, e+30, 33, 33);
rect(d, e-30, 33, 33);
}
}

/*
rect(d+10, e, (e/2)+33, (e/2)+33);
rect(d-10, e, (e/2)+33, (e/2)+33);
rect(d, e+10, (e/2)+33, (e/2)+33);
rect(d, e-10, (e/2)+33, (e/2)+33);
*/	
	


