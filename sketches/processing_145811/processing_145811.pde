
int n = 300;

void setup() {
 size(n,n); 
 background(255);
 noFill();
}

void draw() {
  bezier(random(n),random(n),random(n),random(n),
        random(n),random(n),random(n),random(n));
}

void mousePressed() {
  background(255);
}
