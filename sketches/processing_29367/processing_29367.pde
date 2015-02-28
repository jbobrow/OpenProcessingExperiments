
// global
float maxV = 2.5;
int numBalls = 150;
float spring = 1;
float gravity = 0.05;
Ball[] balls = new Ball[numBalls + 100];

int canvasWidth  = 468; //500;
int canvasHeight = 498; //530;
int modelWidth  = 468; //500;
int modelHeight = 468; //500;

// temperature
float t = 0.5;

void setup() {
    size(canvasWidth, canvasHeight);
    frameRate(40);
    
    noStroke();
    smooth();

    for (int i = 0; i < numBalls; i++) {        
        balls[i] = new Ball(random(modelWidth), random(modelHeight), 40, i, balls);
    }
}

void draw() {
    background(0);

    for (int i = 0; i < numBalls; i++) {
        balls[i].collide();
        balls[i].move();
        balls[i].display();
        balls[i].structure(-5);
    }

    PFont fontInfo = loadFont("Arial");   
    textFont(fontInfo, 11);   
    fill(255);
    text("temperature: "+(int)round(t*10)+"   # objects: " + i, 15, 478);
    //fill(100, 150, 255);
    //text("autor: www.sourcer.cz", 400, 478);   
}

class Ball {
    float x, y;
    float diameter;
    float vx = 0;
    float vy = 0;
    int id;
    Ball[] others;

    Ball(float xin, float yin, float din, int idin, Ball[] oin) {
        x = xin;
        y = yin;
        diameter = din;
        id = idin;
        others = oin;
    }

    void structure(float dz) {
        for (int i = id + 1; i < numBalls; i++) {
            float dx = others[i].x - x;
            float dy = others[i].y - y;

            float distance = sqrt(dx*dx + dy*dy);
            float minDist = others[i].diameter/2 + diameter/2;

            if (distance < (minDist + dz)) {
                float v = 100*min(maxV, sqrt(vx*vx + vy*vy));
                stroke(v, 255 - v, 0, 100);
            
                line(others[i].x, others[i].y, x, y);
            }
        }   
        
        noStroke();
    }

    void collide() {
        for (int i = id + 1; i < numBalls; i++) {
            float dx = others[i].x - x;
            float dy = others[i].y - y;

            float distance = sqrt(dx*dx + dy*dy);
            float minDist = others[i].diameter/2 + diameter/2;

            if (distance < minDist) {
                float angle = atan2(dy, dx);
                float targetX = x + cos(angle) * minDist;
                float targetY = y + sin(angle) * minDist;
                float ax = (targetX - others[i].x) * spring;
                float ay = (targetY - others[i].y) * spring;

                vx -= ax;
                vy -= ay;
                others[i].vx += ax;
                others[i].vy += ay;

                vx *= 0.9;
                vy *= 0.9;
            }
        }
    }

    void move() {
        vy += gravity;
        x += vx * t;
        y += vy * t;

        if (x + diameter/2 > modelWidth) {
            x = modelWidth - diameter/2;
            vx *= -0.8;
        }
        else if (x - diameter/2 < 0) {
            x = diameter/2;
            vx *= -0.8;
        }
        //if (y + diameter/2 > canvasHeight) {
        if (y + diameter/2 > modelHeight) {
            y = modelHeight - diameter/2;
            //vy *= -0.8;
            //vy *= -1.5;
            vy = -25*t;
        }
        else if (y - diameter/2 < 0) {
            y = diameter/2;
            vy *= -0.8;
        }
    }

    void display() {
        noFill();
        float v = 100*min(maxV, sqrt(vx*vx + vy*vy));

        fill(v, 255 - v, 0);
        ellipse(x, y, 5, 5);
    }
}

void keyPressed() {
    if (key == CODED) {
        if (keyCode == UP) {
            if (t < 1) {
                t += 0.1;
            }
        } 
        else if (keyCode == DOWN) {
            if (t >= 0.01) {
                t -= 0.1;
            }
        }
    }
}

void mouseClicked() {
    numBalls++;
    balls[numBalls - 1] = new Ball(mouseX, mouseY, 40, numBalls - 1, balls);
}
