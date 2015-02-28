
int gameover = 0;

int tubeX = 400;
float gap = random(50, 200);

float birdVol = 0;
float gravity = 0.1;
float birdY = 160;

void setup() {

background(220, 220, 255);
size(400, 400);

}

void draw() {

if (gameover == 0){

background(200, 200, 255);

noStroke();


fill(0, 100, 0);
tubeX -= 2;
rect(tubeX, 0, 100, 400);
fill(200, 200, 255);
rect(tubeX, gap, 100, 150);

birdVol += gravity;
birdY += birdVol;
fill(255, 204, 0);
rect (180, birdY, 40, 40);

fill(255);
rect(200, birdY + 5, 15, 15);
fill(0);
rect(210, birdY + 10, 5, 5);
fill(255, 120, 0);
rect(200, birdY + 20, 50, 10);

if ((round(birdY) <= gap)&&(tubeX < 220)&&(tubeX > 280)) {
    gameover = 1;
    }

if (tubeX < -100) {
    gap = random(50, 200);
    tubeX = 400;
    }
     
     
}
     
}

void mousePressed() {

birdVol = -4;

}






