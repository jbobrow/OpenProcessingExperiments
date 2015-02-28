
float progress = 0;
float circleRadius = 120;

void setup() {
    size(400,400);
    smooth();
    noStroke();
    noCursor();
}

void draw() {
    progress += 0.01;
    progress %= 2;
background(0);

fill(50);
ellipse(mouseX,mouseY,40,40);

//rect(0,10,width*progress,20);

translate(width/2,height/2);
rotate(atan2((width/2-mouseX)*-1, (height/2-mouseY)*1) - HALF_PI);
float distance = dist(width/2, height/2, mouseX, mouseY);

//progress = map(mouseX,20,width-20,0,1);
progress = map(distance,20,width-20,0,1);
progress = max(progress,0);
progress = min(progress,0.5);

float faktor = 4 * (sqrt(2)-1) / 3;

float extendleft = map(progress, 0.5,1, 1,-1);
extendleft = max(extendleft,-1);
extendleft = min(extendleft,1);
float extendright = map(progress, 0,0.5, -1,1);
extendright = max(extendright,-1);
extendright = min(extendright,1);


fill(255);


beginShape();

vertex(0, -circleRadius);

bezierVertex(circleRadius*faktor*extendright, -circleRadius, circleRadius*extendright, -circleRadius*faktor, circleRadius*extendright, 0);

bezierVertex(circleRadius*extendright, circleRadius*faktor, circleRadius*faktor*extendright, circleRadius, 0, circleRadius);

bezierVertex(-circleRadius*faktor*extendleft, circleRadius, -circleRadius*extendleft, circleRadius*faktor, -circleRadius*extendleft, 0);

bezierVertex(-circleRadius*extendleft, -circleRadius*faktor, -circleRadius*faktor*extendleft, -circleRadius, 0, -circleRadius);

endShape();

/*
    if (progress < 0.25) {
        fill(0);
        arc(width/2, height/2, circleSize, circleSize, HALF_PI, 3*HALF_PI);
        fill(255);
        arc(width/2, height/2, circleSize * (1-progress *4), circleSize, HALF_PI, 3*HALF_PI);
    }
    else if (progress < 0.5) {
        fill(0);
        arc(width/2, height/2, circleSize, circleSize, HALF_PI, 3*HALF_PI);
        arc(width/2, height/2, circleSize * (progress-0.25)*4, circleSize, -HALF_PI, HALF_PI);
    }
    else if (progress > 0.75) {
        fill(0);
        arc(width/2, height/2, circleSize, circleSize, -HALF_PI, HALF_PI);
        fill(255);
        arc(width/2, height/2, circleSize * (progress-0.75)*4, circleSize, -HALF_PI, HALF_PI);
    }
    else if (progress < 1) {
        fill(0);
        arc(width/2, height/2, circleSize * (1-(progress-0.5)*4), circleSize, HALF_PI, 3*HALF_PI);
        arc(width/2, height/2, circleSize, circleSize, -HALF_PI, HALF_PI);
    }
    */

}

