
float r=0;
float d=0;
float ran = random(0, 255);

void setup() {
size(500, 500);
background(0);
smooth();
}

void draw() {
noStroke();
translate(width/2, height/2);
stroke(255);
strokeWeight(0.5);
float n=noise(d)*500;
float m=height;
rotate(r);
line(n, 0, m, 0);
line(n*0.1, 0, m*0.1, 0);
noStroke();
fill(255);
ellipse(n*0.5, 0, 10, 1);
fill(random(0, 255));
ellipse(0.05, 0, height/4, width/4);
r+=1;
d+=n;
}
                
                                                
