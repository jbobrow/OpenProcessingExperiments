
float o;
float q;
float d;
float a;
int s;

void setup() {
  size (600,600);
  background (0);
smooth();
}

void draw() {
 for (int i = 30; i < 580; i = i+5) {
  for (int j = 0; j < 480; j = j+50) {
    //rect(i,j-5,j,i+4); 
    ellipse(mouseY+i,mouseX-j-i,mouseX-j,mouseY-i-j);
    fill(i,mouseX,j,12);
    
    if(mousePressed) {
    o = random(width);
    q = random(height);
    d = random(100);
    a = random(255);
    noStroke();
    fill(0);
    ellipse(o,q,d,d);
  }
}
}
}


