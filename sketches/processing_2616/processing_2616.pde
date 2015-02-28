

int grow = +1;
int d = 1;
int x = 100;
int y = 100;


void setup() {
size(400, 400);

smooth();
noFill();
strokeWeight(20);
frameRate(100);
}

void draw() {
 background(50);

  d = (d + grow);
 if (d > 40){
   d = 1;
 }
	for(int i = 0; i < 1600; i += 20){
	     stroke(100);
	     ellipse(mouseX, mouseY, d+i, d+i);
	     i = i+20;
	     stroke(200);
	     ellipse(mouseX, mouseY, d+i, d+i);

	 }
}

