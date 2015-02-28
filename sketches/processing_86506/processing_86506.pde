
//static for loop

size(600, 200);
float d;
background(255);
for(int i = 0; i < 100; i++) {
    noFill();
    stroke(0, random(255), 0, 50);
    d = random(40, 75);
    strokeWeight(d/10);
    ellipse(random(width), random(height), d, d);
    
 }
