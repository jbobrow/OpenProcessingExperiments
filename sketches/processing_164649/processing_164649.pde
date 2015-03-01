
boolean leftPressed = false;
boolean rightPressed = false;
boolean upPressed = false;

class Ball {
    public Ball(float tempDiameter, float tempX, float tempY, float tempVX, float tempVY, float tempFriction, float tempGravity, float tempThrustX, float tempThrustY) {
        diameter = tempDiameter;
        x = tempX;
        y = tempY;
        vx = tempVX;
        vy = tempVY;
        friction = tempFriction;
        gravity = tempGravity;
        thrustX = tempThrustX;
        thrustY = tempThrustY;
    }

    public void update() {
        if((y + (diameter/2) >= height)) {
            if(wasTouching) {
                if(vx < 0) {
                    vx += friction;
                }
                else {
                    vx -= friction;
                }
            }
            wasTouching = true;
        }
        else {
            wasTouching = false;
        }
        if(leftPressed) {
            vx -= thrustX;
        }
        if(rightPressed) {
            vx += thrustX;
        }
        if(y + (diameter/2) >= height && upPressed) {
            vy -= thrustY;
        }
        x = constrain((x + vx), (diameter/2), width - (diameter/2));
        vy += gravity;
        y = min((y + vy), height - (diameter/2));
        if(x + (diameter/2) >= width || x - (diameter/2) <= 0) {
            vx *= -1;
        }
        if(y + (diameter/2) >= height) {
            vy *= -1;
        }
        ellipse(x, y, diameter, diameter);
    }

    public float x, y, vx, vy, friction, gravity, thrustX, thrustY, diameter;
    private boolean wasTouching = false;
};

Ball ball = new Ball(50, 200, 200, 5, -5, 0.0125, 3, 0.5, 30);

void setup() {
    size(1000, 800);
    smooth();
    noStroke();
    background(0);
}

void draw() {
    fill(0, 25);
    rect(0, 0, width, height);
    fill(255);
    ball.update();
}

void keyPressed() {
    if (key == CODED) {
        if (keyCode == UP) {
            upPressed = true;
        }
        else if (keyCode == LEFT) {
            leftPressed = true;
        }
        else if (keyCode == RIGHT) {
            rightPressed = true;
        }
    }
}

void keyReleased() {
    if (key == CODED) {
        if (keyCode == UP) {
            upPressed = false;
        }
        else if (keyCode == LEFT) {
            leftPressed = false;
        }
        else if (keyCode == RIGHT) {
            rightPressed = false;
        }
    }
}
