
void setup() {
size(600,400);

stroke(255);
strokeWeight(1);
smooth();

noCursor();
}

float v = 0;
float w = 0;

void draw() {
fill(0,50);
rect(0,0,width,height);

noFill();
beginShape();
for(float x = 0; x < width; x += 1) {
  vertex(x, height/2+mouseY
  *sin(v+(x/map(mouseX,0,width,1,100)))
  *tan(w+(x/map(mouseY,0,width,100,400)))
  *sin(v+(x/map(mouseY,0,height,1,100)))
  );
}
endShape();
v -= 0.02;
w += 0.04;
}


