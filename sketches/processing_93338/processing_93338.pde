
float a=-100;
float b;

void setup () {
  size(400,400);
  smooth();
}

void draw() {
  background(0);
  
  beginShape();
  
vertex(339.0, 44.0);

bezierVertex(a,65.0, 240.0, 145.0, 226.0, 173.0);


bezierVertex(212.0, 201.0, a, 271.0, 227.0, 286.0);

endShape();

if(a<312) {a=a+1;}
else {a=a+0;}

a=a++;
}


