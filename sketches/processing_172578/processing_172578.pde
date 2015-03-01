
void setup() {
	size(800, 600);
	background(100);
	stroke(255);
	//ellipse(50,50,25,25);
	//println("hello web!");
	}
	

void draw() {
int d = mouseX+random(60);
int e = mouseY+random(60);
stroke(100);
if (mousePressed == true) {
fill(116+random(100), 193, 206+random(150));
ellipse(d+30, e, 33, 33);
ellipse(d-30, e, 33, 33);
ellipse(d, e+30, 33, 33);
ellipse(d, e-30, 33, 33);
}
}

/*
rect(d+10, e, (e/2)+33, (e/2)+33);
rect(d-10, e, (e/2)+33, (e/2)+33);
rect(d, e+10, (e/2)+33, (e/2)+33);
rect(d, e-10, (e/2)+33, (e/2)+33);
*/	
	


