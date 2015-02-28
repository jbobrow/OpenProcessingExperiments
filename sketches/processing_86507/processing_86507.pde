
size(600, 600);
background(255);

strokeWeight(random(0,20));
float d;
for (int i = 0; i < 30; i++) {
    stroke(0, 0, random(255), 70);
    noFill();
    d = random(40, 400);
    strokeWeight(d/10)
    ellipse(random(width), random(height), d, d);
}
