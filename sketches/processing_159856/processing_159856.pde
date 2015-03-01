
// N lines
int num = 1;

float step, spacing, offSet, theta, angle, startPosition;

void setup() {
    size(256, 256);
    
    // Linewidth
    strokeWeight(2);
    noFill();
    // Line color
    stroke(200, 200, 200);
    
    // Spacing
    step = 22;
    startPosition = (PI / 2);
}

void draw() {
    background(0, 0, 0);
    translate(width / 2, height / 2);
    for (int i = 0; i < num; i++) {
        spacing = 32;
        // ofset in radians
        float offSet = (PI / 3 / num) * i;
        
        // end point of arch in radians
        angle = (theta + offSet) % PI;
        float arcEnd = map(sin(angle), -1, 1, -TWO_PI, TWO_PI);
        
        if(angle <= (PI / 2) ) {
            // (Centre of circle | Width and height in px | radians start and stop )
            arc(0, 0, spacing, spacing, 0 + startPosition, arcEnd + startPosition );
            //arc(0, 0, spacing, spacing,  TWO_PI + startPosition, TWO_PI - arcEnd + startPosition );
        } else {
            arc(0, 0, spacing, spacing, TWO_PI - arcEnd + startPosition, TWO_PI + startPosition );
            //arc(0, 0, spacing, spacing, 0 + arcEnd + startPosition, startPosition );
        }
    }
    // Static for center dot
    //arc(0, 0, 1, 1, 0, TWO_PI);
    
    //animation speed
    theta += .02;
}
