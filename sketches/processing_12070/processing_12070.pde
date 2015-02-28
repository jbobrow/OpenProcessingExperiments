
class Car {
    private float a_x;
    private float a_y;
    private float v_x;
    private float v_y;
    private float x;
    private float y;

    public Car(float pX, float pY) {
	a_x = 0;
	a_y = 0;
	v_x = 0;
	v_y = 0;
	x = pX;
	y = pY;
    }

    public void move() {
	float dx = mouseX - x;
	float dy = mouseY - y;
	float dist = sqrt(sq(dx) + sq(dy));
	a_x = dx/sq(dist);
	a_y = dy/sq(dist);
	v_x += a_x;
	v_y += a_y;
	x += v_x;
	y += v_y;
    }

    public void draw() {
	pushMatrix();
	translate(x, y);
	rotate( atan2(v_y, v_x) );
	rectMode(CENTER);
	fill(100, 100, 150);
	stroke(255);
	rect(0, 0, 20, 10);
	fill(195);
	rect(-5, -5, 4, 3);
	rect(5, -5, 4, 3);
	rect(-5, 5, 4, 3);
	rect(5, 5, 4, 3);
	popMatrix();
    }
}

int NUM_PARTS = 300;

Car parts[] = new Car[NUM_PARTS];

void setup() {
    size(800, 200);
    for (int i = 0; i < NUM_PARTS; i++) {
	parts[i] = new Car(random(width),
			    random(height));
    }
}

void draw() {
    background(100);
    for(Car b : parts) {
	b.move();
	b.draw();
    }
}

