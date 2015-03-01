
// Variables controlling the graph properties
String filename = "sampleData";  // Filename of the data points to graph: in data folder: Should have "sampleData_TurnedAngles.txt" and  "sampleData_Lengths.txt"
int yMax = 500; // Arbitrarily high value to keep scale same between conditions
int yTickDist = 25; // Distance (microns) of the rings (y-axis scale)
float c = 200; // Circle opacity
float scaleFactor = 3.5; // Play with this value to keep all points within the view
int nRand = 60; // Number of random points to sample
int circleSize = 20; // Change the size of the data points

// Other variables
float r;
float theta = 0;
int index = 0;
float[] data;
float d = 200;
int randomIndex;
int[] randDraws = new int[nRand];
//  This constant changes the opacity of the lines
// A few color combinations I particularly liked:
// a soft blue: (0.1*255,0.58*255,1*255)
// light mauve:(0.48*255,0.55*255,1*255)
// lighter mauve:(0.69*255,0.76*255,1*255)
// The equation 1/r*c is can be used to modify transparency relative to length, works well if c = 20000


void setup() {
  size(800, 800);
  fill(1*255,1*255,1*255); // Set background color
  stroke(0);
  rect(0, 0, width, height);
  //line(0, height/2, width, height/2);
  // line(width/2, 0, width/2, height);
  smooth();
  translate(-100,0);

// 30 degree ticks
//  r = yTickDist;
//  while (r <= yMax) {
//     while (theta < 360) {
//        // Polar to Cartesian conversion
//       float x = r * cos(theta);
//       float y = r * sin(theta); 
//       noStroke();
//       fill(0);
//       ellipse(x + width/2, y + height/2, 1, 1);  
//        // increment angle
//        theta += radians(30);
//     }
//    r += yTickDist;
//    theta = 0;
//  }
  noLoop(); // Only run draw() once
 }

void draw() {
  rotate(radians(-90));
  translate(-(height+100),0);
  // Instead of calling a custom function, initialize arrays within setup. 
 String[] angles = loadStrings(filename + "_TurnedAngles.txt");
 String[] lengths = loadStrings(filename + "_Lengths.txt");
 float[] anglesData = new float[angles.length];
 float[] lengthData = new float[lengths.length];
 for(int i = 0;i < angles.length; ++i) {    
   anglesData[i] = float(angles[i]); 
   }
 for(int k = 0;k < angles.length; ++k) {    
   lengthData[k] = float(lengths[k]); 
   }
    
    // Make ticks to represent histogram counts
  r = yTickDist * scaleFactor;
  theta = 0;
  while (r <= yMax) {
     while (theta < 360) {
        
        // Polar to Cartesian conversion
       float x = r * cos(theta);
       float y = r * sin(theta); 
       
       noStroke();
       fill(0.5*255,0.5*255,0.5*255);
       ellipse(x + width/2, y + height/2, 3, 3);

        // increment angle
      theta += radians(30);
     }
    r += yTickDist / 5 * scaleFactor;
    theta = 0;
  }  
  // Repeat with lower angle frequency to make the appearance of lines
   r = yTickDist * scaleFactor;
  theta = 0;
  while (r <= yMax) {
     while (theta < 360) {
        
        // Polar to Cartesian conversion
       float x = r * cos(theta);
       float y = r * sin(theta); 
       
       noStroke();
       fill(0.5*255,0.5*255,0.5*255);
       ellipse(x + width/2, y + height/2, 3, 3);

        // increment angle
      theta += radians(5);
     }
    r += yTickDist * scaleFactor;
    theta = 0;
  }  
  
  // Draw points
  for(int j = 0; j < nRand ; ++j) {
    
    randomIndex=int(random(1,anglesData.length));
    // Make sure this random value hasn't already been used
    randDraws[j]=randomIndex;
    int duplicate = 0;
    for(int k=0; k<j;k++){
     if(randomIndex==randDraws[k]){
        duplicate = 1;
     } 
    }
    while(duplicate==1){
      randomIndex=int(random(1,anglesData.length));
      randDraws[j]=randomIndex;
      duplicate=0;
      for(int k=0; k<j;k++){
         if(randomIndex==randDraws[k]){
              duplicate = 1;
         } 
      }
    }
    println(anglesData[randomIndex]);
    
    
    r = lengthData[randomIndex] * scaleFactor; // Represent length but multiply by a constant
    theta = radians(anglesData[randomIndex]);
     
      
     
     
    // Polar to Cartesian conversion
     float x = r * cos(theta);
     float y = r * sin(theta); 
    
    // Choose fill depending on angles
    if (theta <= radians(5) && (theta >= radians(-5))){
      stroke(0*255,0*255,0*255, c); // Yellow
      fill(1*255,1*255,0.1*255, c);
      } else if ((theta > radians(5)) && (theta < radians(180))) {
          stroke(0*255, 0*255, 0*255,c); // Green
          fill(0.1*255, 0.6*255, 0.1*255,c);
      } else if ((theta < radians (-5)) || (theta >= radians(-180))){
          stroke(0*255, 0*255, 0*255,c); // Red
          fill(0.6*255, 0.1*255, 0.1*255,c); 
        }
    
    // draw points
    strokeWeight(1);
    ellipse( width/2 +  x, height/2 +  y, circleSize,circleSize); 
  
     // DRAW LINES of color dependent on angles
     strokeWeight(2);
    if (theta <= radians(5) && (theta >= radians(-5))){
      stroke(1*255,0.9*255,0.4*255, c); // Yellow
      } else if ((theta > radians(5)) && (theta < radians(180))) {
          stroke(0.1*255, 0.6*255, 0.1*255,d); // Green
      } else if ((theta < radians (-5)) || (theta >= radians(-180))){
          stroke(0.6*255, 0.1*255, 0.1*255,d); // Red 
        } 
        
     line(width/2, height/2, width/2 +  x, height/2 +  y);
   
    
  }
  

// Draw another circle in the center
  
  stroke(1*255,1*255,1*255); // Change to modify center circle outline color
  fill(1*255,1*255,1*255); // must be same color as circle background
  ellipse(width/2, height/2, 90, 90);

  // Draw another circle in the center
  strokeWeight(5);
  stroke(0*255,0*255,0*255); // Change to modify center circle outline color
  fill(1*255,01*255,1*255); // must be same color as circle background
  ellipse(width/2, height/2, 20, 20);

// Export the image
save(filename + "-grid_random"+nRand+"new.tif");
}





