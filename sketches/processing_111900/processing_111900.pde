
int circleSize = 100;
int shrinkOrGrow = 1;
void setup()
{
    size(640, 480);
    ellipseMode(CENTER);
    frameRate(30);
    noStroke();
    background(220, 220, 255);
    fill(255, 0, 0);
    smooth();
}
void draw()
{
    if (circleSize > 299) {
        shrinkOrGrow = 0;
        println("circlesize: " + circleSize);
        println("shrinkorgrow " + shrinkOrGrow);
    } else if (circleSize < 101) {
        shrinkOrGrow = 1;
        println("circlesize: " + circleSize);
        println("shrinkorgrow " + shrinkOrGrow);
    }
    if (shrinkOrGrow == 1) {
        circleSize += 1;
    } else if (shrinkOrGrow == 0) {
        circleSize -= 1;  
    }
    background(100, 100, 100);
    ellipse(width/2, height/2, circleSize, circleSize);
}



