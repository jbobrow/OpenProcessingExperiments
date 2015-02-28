
void setup() {
    size(500,500);
    background(255);
    println("setup");
    colorMode(RGB,0,500,500);
}  

void draw() {
    //abs(mouseX-pmouseX);
    rectMode(CENTER);
    fill(mouseX,mouseY,mouseX,20);
    noStroke();
    
    //rect(0,0,600,800); 
    
    line(mouseX,mouseY,300,400); 
    rect(mouseX,mouseY,100,100); 

    strokeWeight(abs(mouseX-pmouseX));

}      






