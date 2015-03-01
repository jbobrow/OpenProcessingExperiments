
float diameter = 20;
int divisor = 10;

void setup() {
    size(600, 600);
}
void draw() {  
    for (int x = width/divisor; x < width; x += width/divisor) { // The X for loop runs 9 times
        for (int y = height/divisor; y < height; y+= height/divisor) { // The Y for loop generates 9 ellipses for each time X runs, making 81 total

            if (dist(mouseX, mouseY, x, y) < diameter / 2) { //if the cursor distance is less than the radius (diameter/2) of the currently drawn circle, do this
                fill(0); //color it black
                println("(" + x / (width/divisor) + ", " + y / (height/divisor) + ")  "); //tell us which one is being drawn
            } else {
                fill(255); //color the ones not being hovered over white
            }
            ellipse(x, y, diameter, diameter); //draw the ellipse at x and y position.

        }
    }
}

