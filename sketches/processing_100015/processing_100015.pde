
float a;
float b;
float diam;

int hitScore;

void setup() {  // this is run once.   
    
    // set the background color
    background(255);
    
    // canvas size (Variable aren't evaluated. Integers only, please.)
    size(300, 300); 
      
    // smooth edges
    smooth();
    
    // limit the number of frames per second
    frameRate(25);
    
    // set the width of the line. 
    strokeWeight(12);
    
} 

void draw() {  // this is run repeatedly.  

    // set the color
    stroke(random(50), random(255), random(255), 100);
    
    background(255);
    
    line(mouseX, mouseY, 100, 300);
    
    a = random(width);
    //b = random(height);
    b = height/2;
    diam = 16;
    
    stroke(0,0,0);
    ellipse(a,b,diam,diam);
    
    if (mousePressed) {
        if (sqrt(sq(mouseX-a) + sq(mouseY-b)) < radians(ellipse(a,b,diam,diam))) { 
    noFill();
    noStroke();
    }
    hitScore++;
    if (sqrt(sq(mouseX-a) + sq(mouseY-b)) > radians(ellipse(a,b,diam,diam))) {
        stroke(60,170,114);
    ellipse(a,b,diam,diam);
    }
    println(hitScore);

}
}
