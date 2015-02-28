
int dots        = 100; // Number of Dots
int maxLinkDist = 40; // Distance between points where they no longer link to each other
int matrix[][]  = new int[dots][2]; // Stores the points... [0] = x; [1] = y

void setup() {
    size(475, 300); // To match the About Processing window...
    smooth();
    process();
}

void draw() {
    // Do nothing... I discovered that without this method, you won't be able to use the Escape key to close the program...
    // Due to some random() function calls, I had to put the process() code out of the draw() method...
}

void mousePressed() { // To process the image every click, not while the mouse is pressed...
    process();
}

void process() {
    background(8, 16, 26);

    // Point Positions
    for (int i = 0; i < dots; i++) {
        // To have a better control of the positioning of the points, I used random(random()). Every time you
        // see those, it's because I tried to concentrate the points in one region of the canvas...

        // Gets some random X value for the point, concentrating on the 
        int x = (int) random(random(30, width), width+20);
        matrix[i][0] = x;

        int y;
        // If the point is located on the rigth side of the canvas...
        if (x >= width-200) {
            // minimum value for the Y position is between 40 and 100
            y = (int) random(random(40, 100), height+20);
        } 
        else {
            // otherwise, the point will be at the bottom of the canvas...
            y = (int) random(height-100, height+20);
        } 
        matrix[i][1] = y;
    }

    // Draw!
    for (int i = 0; i < dots; i++) {
        int x = matrix[i][0]; // Get the X and Y values of the point
        int y = matrix[i][1];

        // Halo - Sphere around the point
        noStroke();
        fill(30, 100, 200, 40);
        float halosize = random(20, random(50, 80));
        ellipse(x, y, halosize, halosize);

        // Point
        stroke(255);
        strokeWeight(2);
        point(x, y);

        // Links
        strokeWeight(0.5); // The link is thinner than the point
        for (int j = i; j < dots; j++) {
            int xTo = matrix[j][0];
            int yTo = matrix[j][1];

            // If the distance between the points is less than maxLinkDist, link them!
            if (abs(x - xTo) < maxLinkDist && abs(y - yTo) < maxLinkDist)
                line(x, y, xTo, yTo);
        }
    }
    
    image(loadImage("logo.png"), 60, 55);
    fill(255, 200);
    
    textSize(10);
    text("by haroflow", 60, 140);
    text("Based on About Processing", 60, 155);
    
    text("-- Click to reprocess background -- ", 60, 185);
}


