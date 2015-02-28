
// Sketch to attach an ellipse at the end of a line, sort of an pendulum motion

void setup(){
    size(600,400);
    //stroke(0);
    strokeWeight(2);
}

void draw(){
    background(0);
    stroke(mouseY/2);
    line(0,0,mouseX,mouseY);
    fill(100,125,200,mouseX/2);
    ellipse(mouseX,mouseY,50,50);

}
