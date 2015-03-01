
//Array Practice
int x = 500;
int y = 500;

size (x, y);
background(255);

int n = 1000;
float[] xTop = new float[n];
float[] xBottom = new float[n];

for (int i = 0; i < n; i++) {
 xTop [i] = random(0, 500); 
 xBottom[i] = random(0, 500);
 stroke(random(3, 140), random(15, 130), random(150, 240), random(0, 300));
 fill(255, 255, 255, 0);
 strokeWeight(5);
 rectMode(CENTER);
 rect(xTop[i], xBottom[i], 30, 30);
}


