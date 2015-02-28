
int   x, y;
int   numberOfArcs = 15; 
float rotation = - (HALF_PI / 3);
int   arcSize;
int   step = 40;
float start, stop;


void setup()
{
    size(600, 450);
    background(140);
    stroke(2);
    noFill();
    ellipseMode(CENTER);
    strokeCap(PROJECT);
    smooth();
    noLoop();
}

void draw()
{
    for (int i = 0; i < numberOfArcs; i++) {
        strokeWeight(i);
        x = width / 2;
        y = height / 2;
        arcSize = 100 + (step * i);
        start = rotation * i;
        stop = rotation * i + TWO_PI - HALF_PI;
        arc(x, y, arcSize, arcSize, start, stop);
    }
}

                
                                
