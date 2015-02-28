
/*
Minimalistic Clock, by @ramayac
*/
int h,m,s;

void setup () {
    size (325,450);
    background (0);
    smooth();
}

void draw() {
    s = second ();
    m = minute ();
    h = hour ();

    fill (240); 
    strokeWeight(6);
    stroke(255);
    ellipse (width/2,225,230,230);
    noFill();
    noStroke();

    //center sketch
    translate (width/2,225);
 
    // hour
    strokeWeight(5);
    stroke(0);
    pushMatrix();
    rotate(radians (30*h));
    line(0,0,0,-60);
    popMatrix();

    //minute
    strokeWeight(5);
    stroke (0);
    pushMatrix();
    rotate(radians (6*m));
    line(0,0,0,-90);
    popMatrix();  
}
