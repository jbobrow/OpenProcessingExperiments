
// Create the global variables
//This array will hold the cracks
crackLine cLList[];
// This one is used for the cracks collision detection
float[] pixelsUse;
//This one is to get the colors for the sketch 
PImage colorPalette;

void setup(){
    size(1000, 800);
    smooth();
    noStroke();
    background(200);
    
    // Initialize the array for the collision detection
    pixelsUse = new float[width * height];
    for (int i=0; i< pixelsUse.length; i++)
        pixelsUse[i] = 10001;
    
    // Initialize the cracks aray
    cLList = new crackLine[0];
    // and load the image for the colors
    colorPalette = loadImage("color.jpg");
    colorPalette.loadPixels();
}

void draw(){
    for(int i = 0; i < 350; i++){
        loadPixels();
        for (int j=0; j<cLList.length;j++)
            cLList[j].update();
    }
}

void mousePressed(){
    // Add a new crack where the user as pressed the mouse
    crackLine newCrack = new crackLine(random(0, TWO_PI), mouseX, mouseY);
    // And append it to the array
    cLList = (crackLine[]) append(cLList, newCrack);
}

class crackLine{
    // This is the class used to draw the cracks and shades all over the canevas
    // It's (largely) inspired by the beautiful work of J. Tarbell ( http://www.complexification.net/gallery/machines/substrate/ )
    float x, y, t, angle, minX, minY, maxX, maxY, tailsize;
    int maxCount, lifespan, brightnessThreshold;
    int c;
    crackLine(float inAngle, float inX, float inY){
        // Initialize the values
        reInit(inAngle);
        // Set the max count for the findStart function
        maxCount = 2000;
        // Set the crack start position
        x = inX;
        y = inY;
        // Make a bounding box for the crack system
        minX = x;
        minY = y;
        maxX = minX + 10;
        maxY = minY + 10;
        // Set the drawing threshold 
        brightnessThreshold = 100;
    }
    
    void reInit(float inAngle){
        // This function cleans the variables when a new crack is drawn
        // Find the new crack position
        x = 0;
        y = 0;
        findStart();
        // Set the angle
        angle = inAngle % TWO_PI;
        // Reset the timer
        t = 0;
        // Set the crack lifespan (how many frame it will live if it doesn't cross another crack)
        lifespan = (int)(random(500, 1000)*.75);
        // Set the crack color
        c = color(random(10,50));
        // Set the shade size
        tailsize = map(lifespan, 0, 220, 0, 1);
    }
    
    void findStart(){
        // This function is used to find a start position
        // Declare temporary positions
        int px = 0;
        int py = 0;
        float cnt = 0;
        while(cnt < maxCount){
            cnt++;
            // Get a random position across the canevas
            px = (int) random(minX, maxX);
            py = (int) random(minY, maxY);
            // If the position is on a crack, keep the position
            if (pixelsUse[px + py*width] < 10000)
                break;
        }
        // If a position on a crack was found
        if (cnt < maxCount){
            // Set the new crack position
            x = px;
            y = py;
        }
        else{
            // If no crack was found after the maxUse count was reached
            // Set the new crack position to be somewhere
            // in the crack system bounding box
            x = random(minX, maxX);
            y = random(minY, maxY);
        }
    }
    
    void update(){
        // Update the shade size
        tailsize = map(lifespan, 0, 220, 0, 1);
        // Get the updated position to draw the crack line
        float px = x + t*cos(angle)*.1;
        float py = y + t*sin(angle)*.1;
        // Increase the timer
        t+=.01;
        // Get the pixel index from the position (x + y *width)
        int index = (int) px + (int)py*width;
        if (px > 0 && px < width && py > 0 && py < height && index > 0 && index < pixelsUse.length && lifespan > 0){
            // Reduce the crack lifespan
            lifespan--;
            boolean test = false;
            // For all the pixels inbetween the old position and the new one
            for (int i = 0; i < abs(x - px); i++){
                for (int j=0; j< abs(y-py);j++){
                    // Get the index
                    int tmpIndex = ((int)min(x, px)+i) + ((int)min(y, py)+j)*width;
                    // If the pixel is on a crack and is not on this crack
                    // (if the timer difference is superior to 3 iterations)
                    if (pixelsUse[index] < 10000 && (pixelsUse[index]-t) > .03){
                        test = true;
                    }
                }
            }
            // If no crack was encountered
            if (!test){
                // Set the new position as the old position
                x = px; y = py;
                // Update the bounding box
                if (x < minX) minX = x;
                if (x > maxX) maxX = x;
                if (y < minY) minY = y;
                if (y > maxY) maxY = y;
                // Set the pixel value to the timer
                pixelsUse[index] = t;
                if (brightness(pixels[index]) > brightnessThreshold){
                    // If the brighness of the pixel is high enough
                    // Draw the crack line
                    fill(c);
                    rect(x, y, .2,.2);
                }
                // Draw the shade
                paintBrush();
            }
            else{
                // Update the angle
                angle += PI/2.;
                // And start a new line
                reInit(angle);
            }
        }
        else{
            // Update the angle
            angle += PI/2.;
            // And start a new line
            reInit(angle);
        }        
    }
    
    void paintBrush(){
        // This function paints the shade underneath the crack line
        // Add a small random to the tailSize
        float tSize = tailsize + random(1, lifespan/10);
        // Get the color for the shade from the palette
        int tC = colorPalette.pixels[(int)random(colorPalette.width * colorPalette.height)];
        for (int i=0; i < tSize; i++){
            // Get the shade position
            float tPx = constrain(x + i*cos(angle+PI/2.), 0, width-1);
            float tPy = constrain(y + i*sin(angle+PI/2.), 0, height-1);
            // Find the pixel index
            int tIndex = (int)tPx + (int)tPy*width;
            // If the pixel is on a crack, stop drawing the shade
            if (i > 5 && pixelsUse[tIndex] < 10000)
                return;
            if (brightness(pixels[tIndex]) > brightnessThreshold){
                // If the brighness of the pixel is high enough
                // Draw the shade
                fill(tC, 5);
                rect(tPx, tPy, .5,.5);
            }
        }
    }
}

