
int k = 1;
int j = 1;
float t;
float p;

void setup (){
size(800, 800); 
}

void draw () {
beginShape();
//face
noStroke();
fill(0, 26, 51);
ellipse(400, 400, 500, 400);
//ears
ellipse(250, 200, 100, 100);
ellipse(550, 200, 100, 100);
fill (255);
ellipse(400, 400, 150, 130);
colorMode(HSB);
k = k+30;
fill (k,k,k,k);
if (k > 250) {
  k = 1;
}
ellipse(400, 400, 50, 50); 
fill(0, 26, 51);
ellipse(300, 600, 50, 100);
ellipse(500, 600, 50, 100);
}


