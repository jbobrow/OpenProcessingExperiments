
int s;
float xoff = 0.0;
float xxx = 0.0;
float yyy = 0.0;

void setup() {
    size(500, 500);
    smooth();
        

}
 
 
void draw() { 
    background(0);
xoff = xoff + 0.03;
xxx = xxx + 0.003;
yyy = yyy + 0.003;
float n = noise(xoff) * 30 + 65;
float n2 = noise(xxx) * 200 + 50;     
float n3 = noise(yyy) * 150 + 100;    
    translate(width/2, height/2);

    fill(255);
    noStroke();
    ellipseMode(CENTER);
    ellipse(0, 0, 120, 120);

    
    pushMatrix();
    rotate(millis() * 0.001 * TWO_PI / 5 );
    translate(n, 0);
    colorMode(HSB);
    fill(255,255,255-n);
    ellipse(0, 0, 2.5, 2.5);
    popMatrix();
    
    
    pushMatrix();
    rotate(millis() * 0.001 * TWO_PI / 3 );
    translate(n, 0);
    colorMode(HSB);
    fill(255,255,255-n);
    ellipse(0, 0, 2.5, 2.5);
    popMatrix();
    
    pushMatrix();
    rotate(millis() * 0.001 * TWO_PI / 1.5 );
    translate(n, 0);
    colorMode(HSB);
    fill(255,255,255-n);
    ellipse(0, 0, 2.5, 2.5);
    popMatrix();
    
    pushMatrix();
    rotate(millis() * 0.001 * TWO_PI / 15 );
    translate(n, 0);
    colorMode(HSB);
    fill(255,255,255-n);
    ellipse(0, 0, 2.5, 2.5);
    popMatrix();
    
    fill(255);
     
    pushMatrix();
    rotate(millis() * 0.001 * TWO_PI / 10.0);
    translate(n2, 0);
    colorMode(HSB);
    fill(0,0,255-n2);
    ellipse(0, 0, 40, 40);
    colorMode(RGB);
    
    pushMatrix();
    rotate(millis() * 0.001 * TWO_PI / 5.0);
    translate(40, 0);
    ellipse(0, 0, 10, 10);
    popMatrix();
    
    popMatrix();    
    
    //---
    
    pushMatrix();
    rotate(millis() * 0.001 * TWO_PI / 15.0);
    translate(n3, 0);
    colorMode(HSB);
    fill(0,0,255-n3);
    ellipse(0, 0, 25, 25);
    colorMode(RGB);
    
    pushMatrix();
    rotate(millis() * 0.001 * TWO_PI / 8);
    translate(55, 0);
    ellipse(0, 0, 7, 7);
    popMatrix();
    

    
    pushMatrix();
    rotate(millis() * 0.001 * TWO_PI / 3);
    translate(30, 0);
    ellipse(0, 0, 4, 4);
    popMatrix();
    
    popMatrix();
    
    
    rotate(millis() * 0.001 * TWO_PI);



}

