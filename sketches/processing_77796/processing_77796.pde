
void setup() {
size(700,700);
}

void draw() {
    background(255);
    
    // Change the color based on the mouse location
    fill(255.0 * mouseX / width, 255.0 * mouseY / width,0);
    
    // Draw everything but the eyes
    arc(220,350,590,520,-PI/2.3,PI/2.38);
    arc(220,350,500,500,-PI/2.3,PI/2.4);
    fill(255);
    arc(50,350,600,700,-PI/4.1,PI/4.55);
    ellipse(410,240,36,60);
    ellipse(365,246,36,60);
    fill(50);
    noFill();
    arc(405,350,70,100,PI/8,PI/1.2);
    arc(447,357,30,30,PI/2.5,PI);
    arc(363,365,30,30,-PI/8,PI/2.1);
    fill(100,80,40);
    ellipse(295,580,30,45);
    quad(277,121,241,91,257,71,295,97);
    arc(271,96,50,50,PI/64,PI/2.32);
    ellipse(251,84,25,28);
    
    // The pupils...make them move with the mouse
    pushMatrix();
    float angleToRotate = atan((mouseY - 256.0)/(mouseX - 360.0));
    translate(360, 256);
    rotate(angleToRotate);          
    ellipse(0,0,12,20);    
    popMatrix(); // See what happens if you remove this line!
    
    angleToRotate = atan((mouseY - 250.0)/(mouseX - 405.0));
    translate(405, 250);
    rotate(angleToRotate);          
    ellipse(0,0,12,20); 
    
}
