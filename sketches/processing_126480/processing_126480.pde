
float n = 0;

void setup(){
size(400,400);
background(0);
fill(255);
noStroke();
}

void draw (){
fill(random(200),random(200),random(200));
rotate(n);
float r = random(5,10);
ellipse(90 + n,50,r,r);
n = n + 2;
}
