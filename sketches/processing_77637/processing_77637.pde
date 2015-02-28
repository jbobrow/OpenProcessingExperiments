
import processing.opengl.*;

float depth;
float zSpeed;

void setup() {
    size( 800, 800, OPENGL );
    smooth();
    frameRate(60);

    depth = 0;
    zSpeed = -2; 
}

void draw() {
    depth += zSpeed;
    
    if ( depth <= -1000 || depth >= 0 ) {
        zSpeed *= -1;
    }
    
    // background( 255 );
    
    for ( int i = 1; i <= 25; i++ ) {
        pushMatrix();

        translate( 0, 0, -i * 200 );

        // Circle
        noFill();
        stroke(0,0,0);
        strokeWeight(1);
        ellipseMode(CENTER);
        ellipse(width/2, height/2, width, height);
        // Label bg
        noFill();
        stroke(255,0,0);
        strokeWeight(50);
        point(width, height/2);
        // Label content
        fill(255, 255, 255);
        noStroke();
        textAlign(CENTER);
        text(i, width, height/2);

        popMatrix();
    }

    pushMatrix();
    translate(0, 0, depth );
    noStroke();
    float c = map(depth, -1000, 0, 50, 200);
    fill(c);
    ellipse(mouseX, mouseY, 100, 100);
    popMatrix();
    
}





