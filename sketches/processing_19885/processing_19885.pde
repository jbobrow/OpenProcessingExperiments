
PVector [] points = new PVector [3];
float circleRad = 275;
int numPoints = 3;

PVector center;

void setup () {
    background (000, 000, 000);
    size (600, 600);
    
    center = new PVector ( width/2, height/2);
}


void draw () {
    background (000, 000, 000);
    
    PVector pointHolder;
    //println( "positioning" );
    
    
    
    points = new PVector[numPoints];
    
    for (int i = 0; i<points.length; i++) {
        pointHolder = calculatePositionForDegrees( ( (float(360)/float(points.length)) * i ) + -90 );
        points [i] = pointHolder;
        
        //println( "    POS IS " + points[i].x + ", " + points[i].y ); 
    }
    
    // draw circle
    stroke (255, 255, 255);
    noFill ();
    ellipse (center.x, center.y, circleRad*2, circleRad*2);
    
    //noStroke ();
    for (int i = 0; i<points.length; i++) {
        ellipse (center.x+points[i].x, center.y+points[i].y, 5, 5);
    }
    
    strokeWeight (1);
    stroke (255, 255, 255);
    
    for (int i = 0; i<points.length; i++) {
        for (int j = 0; j<points.length; j++ ) {
            if (i==j) {
            } else if (wrapArray( i+1 )==j ) {
            } else if (wrapArray (i-1)==j) {
            } else{
                if (i% 6 == 0) {
                    stroke (255, 000, 000);
                }
                if (i% 6 == 1) {
                    stroke (000, 255, 000);
                }
                if (i% 6 == 2) {
                    stroke (000, 000, 255);
                }
                if (i% 6 == 3) {
                    stroke (255, 255, 0);
                }
                if (i% 6 == 4) {
                    stroke (153, 0, 153);
                }
                if (i% 6 == 5) {
                    stroke (255, 153, 000);
                }
                line ( center.x+points[i].x, center.y+points[i].y,  center.x+points[j].x, center.y+points[j].y );
            }
        }
    }
}

void keyPressed() {
    if (keyCode == UP) {
        numPoints++;
    } else if ( keyCode == DOWN ) {
        if ( numPoints > 3 ) {
            numPoints--;
        }
    }
}




PVector calculatePositionForDegrees ( float degrees ) {
    PVector posHolder = new PVector();
    
    posHolder.x = cos( radians(degrees) ) * circleRad;
    posHolder.y = sin( radians(degrees) ) * circleRad;
        
    return posHolder;
}


int wrapArray (int index) {
    
    if (index==points.length) {
        return 0;
    }else if (index==-1) {
        return points.length-1;
    }else {
        return index;
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

                
                
