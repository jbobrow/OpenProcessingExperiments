
int nCircles = 100; // The number of circles
int circleWidth = 25; // For easy testing

// Create arrays to store details about each of the circles
// i.e. X-Coordinate, Y-Coordinate and direction
int xCoords[] = new int[nCircles];
int yCoords[] = new int[nCircles];
boolean direction[] = new boolean[nCircles];

void setup(){
  size(600, 600);
  smooth();
  
  // Draw 49 circles, placed randomly within the bottom right corner
  for(int i=0; i<nCircles-1; i++){
    xCoords[i] = int(random((300+circleWidth), (600-circleWidth)));
    yCoords[i] = int(random((300+circleWidth), (600-circleWidth)));
    direction[i] = false;
  }
  
  // Draw a 50th circle slightly away from the others
  xCoords[nCircles-1] = int(random((200+circleWidth), (250-circleWidth)));
  yCoords[nCircles-1] = int(random((200+circleWidth), (250-circleWidth)));
}

void draw(){
  // Draw a background with transparency so that the circles leave a trail
  fill(255, 15);
  rect(0, 0, 600, 600);
  
  // Loop to create each circle
  for(int i=0; i<nCircles; i++){
    // Change direction if we get to the corner
    if(yCoords[i]<50 && xCoords[i]<50){
      direction[i] = true;
    }
    if(yCoords[i]>550 && xCoords[i]>550){
      direction[i] = false;
    }
    
    // Move differently based on the direction boolean
    // add (or subtract) a random number in the range 
    // from the X and Y coordinates
    if(direction[i]==false){
      xCoords[i]+=random(-5, +3);
      yCoords[i]+=random(-5, +3);
    }
    else{
      xCoords[i]+=random(-3, +7);
      yCoords[i]+=random(-3, +7);
    }
    
    if(i==nCircles-1){ // Colour the 50th circle yellow
      fill(#E1E51E);
    }
    else{ // Colour the rest black
      fill(0);
    }
    
    // Draw the main circle
    ellipse(xCoords[i], yCoords[i], circleWidth, circleWidth);
    
    // Pick a random colour
    fill(random(255), random(255), random(255));
    
    // Draw the 'eyes' on the circles using the random colour
    ellipse(xCoords[i]-5, yCoords[i], (circleWidth/3), (circleWidth/3));
    ellipse(xCoords[i]+5, yCoords[i], (circleWidth/3), (circleWidth/3));
  }
}


