
size (400,400);
background(245, 255, 250);
for(int i=0; i<400; i=i+1) {
float r = random(400);
float l = random(150,250);
float m = random(190, 255);
float n = random(200,300);
noStroke();
fill(l,m,255, 90);
ellipse(i, n, n, i);
}


