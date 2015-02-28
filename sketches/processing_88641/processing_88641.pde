
color[] ft1 = {#363333, #007C7C, #00C8C8, #FFFFFF, #FFD300};
//this palatte is "First Tech 01" by cdwilliams2
 
void setup() {
    size(600, 600);
    smooth();
    noFill();
    
    background(ft1[0]);    
}
 
void draw() {

frameRate(mouseY/200);

    float a= random(1, 300);
    float b= random(301, 600);
    float c= random(1, 200);
    float d= random (201, 400);
    float e= random (401, 600);
    float s1= random (1, 7);
    float s2= random (8, 15);
     
    stroke(ft1[int(random(1,4))]);
    triangle(a, c, d, e, b, c);
    strokeWeight(s1);
    
     
    stroke(ft1[int(random(1,4))]);
    triangle(a, c, d, e, b, c);
    strokeWeight(s2);
     
}
