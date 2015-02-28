
import processing.video.*;

int cellSize = 5;
int cols, rows;

Capture video;

int firsttime = 0;
int numPixels;
int[] previousFrame;
int[] differenceFrame;

void setup() {
 size(1024, 768, P3D);
 frameRate(15);
 cols = width /cellSize;
 rows = height/cellSize;
 colorMode(RGB, 255, 255, 255, 100);
 println(cols);
 println(rows);

 video = new Capture(this, cols, rows, 30);
 numPixels = video.width * video.height;
 previousFrame = new int[numPixels];
 differenceFrame = new int[numPixels];
 loadPixels();
 background(0);
}

void draw() {
 float corx,  cory;
 if (video.available()) {
   video.read(); // Read the new frame from the camera
   int colorX = 0; // X-coordinate of the closest in color video pixel
   int colorY = 0; // Y-coordinate of the closest in color video pixel
   float closestColor = 10000; 
   int index = 0;
   video.loadPixels(); // Make its pixels[] array available
   if (firsttime < 10) {
     firsttime++;
     for (int i = 0; i < numPixels; i++) { // For each pixel in the video frame
       previousFrame[i] = video.pixels[i];
     }
   }
   
   fill(color(255, 255, 255, 255));
   noStroke();
   rectMode(CORNER);    
   
   int movementSum = 0; // Amount of movement in the frame
   for (int i = 0; i < numPixels; i++) { // For each pixel in the video frame
     color currColor = video.pixels[i];
     color prevColor = previousFrame[i];

     // Extract the red, green, and blue components from current pixel
     int currR = (currColor >> 16) & 0xFF; // Like red(), but faster
     int currG = (currColor >> 8) & 0xFF;
     int currB = currColor & 0xFF;

     // Extract red, green, and blue components from previous pixel
     int prevR = (prevColor >> 16) & 0xFF;
     int prevG = (prevColor >> 8) & 0xFF;
     int prevB = prevColor & 0xFF;

     // Compute the difference of the red, green, and blue values
     int diffR = abs(currR - prevR);
     int diffG = abs(currG - prevG);
     int diffB = abs(currB - prevB);

     // Add these differences to the running tally
     movementSum += diffR + diffG + diffB;
     differenceFrame[i] = 0xff000000 | (diffR << 16) | (diffG << 8) | diffB;
     previousFrame[i] = currColor;
   }

   if (movementSum >= 0) {
     for (int i = 0; i < cols; i++) {
       for (int j = 0; j < rows; j++) {
         int x = i*cellSize;
         int y = j*cellSize;
         int loc = (video.width - i - 1) + j*video.width; // Reversing x to mirror the image
        
         if ((brightness(differenceFrame[loc]) >= 20) && (brightness(previousFrame[loc]) < brightness(get(x+cellSize/2, y+cellSize/2)) )) {
           float r = red(video.pixels[loc]);
           float g = green(video.pixels[loc]);
           float b = blue(video.pixels[loc]);
           color c = color(r, 0, 0, 255);
           pushMatrix();
           translate(x+cellSize/2, y+cellSize/2);
           rotate((2 * PI * brightness(c) / 125.0));
           rectMode(CENTER);
           fill(c);
           //stroke(c);
           corx =0+random(-cellSize,cellSize);
           cory =0+random(-cellSize,cellSize);
           
           ellipse(corx, cory,
            corx+pow(brightness(differenceFrame[loc])/40,2)+cellSize, cory+ pow(brightness(differenceFrame[loc])/40,2)+cellSize);
           popMatrix();
         }
         
         if ((brightness(previousFrame[loc]) >= 20) && (brightness(differenceFrame[loc]) > brightness(get(x+cellSize/2, y+cellSize/2)) )) {
           float r = red(video.pixels[loc]);
           float g = green(video.pixels[loc]);
           float b = blue(video.pixels[loc]);
           color c = color(r, g*4/6, b*4/6, 255);
           pushMatrix();
           translate(x+cellSize/2, y+cellSize/2);
           rotate((2 * PI * brightness(c) / 125.0));
           rectMode(CENTER);
           fill(c);
           //stroke(c);
           corx =0+random(-cellSize,cellSize);
           cory =0+random(-cellSize,cellSize);
        
           ellipse(corx, cory,
            corx+pow(brightness(differenceFrame[loc])/40,2)+cellSize, cory+ pow(brightness(differenceFrame[loc])/40,2)+cellSize);
           popMatrix();
         }
       }
     }
   }
   
   if(movementSum > 0){
     
     //updatePixels();
     println(movementSum); // Print the total amount of movement to the console
     for (int b = 0; b < video.height; b++) {
       for (int a = 0; a < video.width; a++) {
       
       // Get the color stored in the pixel
       int pixelValue = pixels[index];
       
       // Determine the brightness of the pixel
       float colorProximity = abs(red(pixelValue)-255)+abs(green(pixelValue)-0)+abs(blue(pixelValue)-0);
       if (colorProximity < closestColor) {
         closestColor = colorProximity;
         closestColor=closestColor-10;
         colorY = b;
         colorX = a;
         updatePixels();
       }
       index++;
       }
     }
   }
 }
}
