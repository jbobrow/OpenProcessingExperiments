
float xoff=0.0;void draw(){float n = noise(xoff)*100;background(0, 50, 165-n);noStroke();fill(255, 180-n, 0);xoff = xoff + .01;ellipse(50, n, 30, 30);fill(0, 105-n/2, 0);rect(0, 70, 100, 30);
}

