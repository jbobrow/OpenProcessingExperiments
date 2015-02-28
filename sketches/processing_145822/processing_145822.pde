
int n = 300;

void setup() {
 size(n,n);
 background(255);
 noFill();
 smooth();
 frameRate(10);
}


void draw() {
 strokeWeight(random(1,6));
 stroke(random(64,255),random(64,255),random(64,255));
 bezier(random(n),random(n),random(n),random(n),
        random(n),random(n),random(n),random(n));
}

void mousePressed() {
  background(255);
}

