
final int groundLoc = 500;//the ground; original 500
int distance = 100;//start distance


void setup() {  //setup function called initially, only once

    size(800,600);//original: size( 800, 600) 
    background(255);
    smooth();
    fill(0, 153,0);//green
    rect(0, groundLoc, 800, groundLoc);
    stroke(102,51,0);//brown
    strokeWeight(10);
    
}

void draw() {

    if(mousePressed == true) {
       
        translate(width/2, groundLoc );//goal move origin to startpoint
        growTestTree(7, 100);
       
        
    
    }

}

void growTestTree(int brLv, float len) {

    
    if(brLv == 0 ) {
    
        return;
    }
    
    point(0,0);
    
    line(0, 0, 0, -len);//draw from ground upwards; use neg val after translation
    translate(0,-len);//move origin to endpoint of line
    
    pushMatrix();
    
    rotate(-QUARTER_PI);//rotate counter clockwise
    //line(0,0, 0, -len/2);//draw "straight up"
    growTestTree(brLv - 1, len * .75);
    
    popMatrix();
    
    pushMatrix();
    rotate(QUARTER_PI);//rotate clockwise
    //line(0,0, 0, -len/2);//draw "straight up"
    growTestTree(brLv - 1, len * .75);
    
    popMatrix();
    
   

}
