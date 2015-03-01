
void draw() {
 
fill(255);
    size(250,250);
    background(255);

fill(51,51,255);
    ellipse(75,15,25,25);

rectMode(CENTER);
    fill(204,0,0);
    rect(160,160,50,50,5);

fill(0,255,0);
    triangle(10,20,30,60,10,60);

fill(255,255,255);
    line(100,100,50,50);

if(mousePressed == true);
    strokeWeight(10);
    point(mouseX,mouseY-10);

}
