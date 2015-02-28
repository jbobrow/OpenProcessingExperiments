
ScaredBall ball;
int minx = 20; // Set borders of the canvas
int miny = 20;
int maxx = 20;
int maxy = 20;

void setup() {
    size(200, 200);
    background(0);
    smooth();
    ball = new ScaredBall();
}

void draw() {
    fill(0, 50);
    rect(0, 0, width, height); // The onion-skin effect
    ball.draw();
}

public class ScaredBall {
    float x, y; // Position
    int w, h; // Size
    float speedx, speedy;
    float accel;

    ScaredBall() {
        x = width  / 2; // Middle of the canvas
        y = height / 2;

        w = 10;
        h = 10;

        speedx = 0;
        speedy = 0;
        accel  = 0.1; // Value used to increment the speed
    }

    void draw() {
        stroke(255);
        fill(255);
        ellipse(x, y, w, h);

        if (mouseX < x) {      // If the mouse is to the right of the ball,
            speedx += accel;   // it goes to the left...
        } 
        else if (mouseX > x) { // If the mouse is to the left of the ball,
            speedx -= accel;   // it goes right... =)
        }
        x += speedx;

        if (mouseY < y) {      // Same as above...
            speedy += accel;
        } 
        else if (mouseY > y) {
            speedy -= accel;
        }
        y += speedy;

        speedx = constrain(speedx, -5, 5); // Don't let the speed be greater than 5.
        speedy = constrain(speedy, -5, 5);
        x      = constrain(x, minx, width-maxx); // Don't let the ball run away...
        y      = constrain(y, miny, height-maxy);

        if (x == minx || x == width-maxx) speedx = 0; // When the ball reaches the borders, set the speed to 0,
        if (y == miny || y == width-maxy) speedy = 0; // so it can start running to the opposite direction right away.
    }
}


