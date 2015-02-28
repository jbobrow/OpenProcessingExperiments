
// Create an array of bins in Physics world to collect balls WORKS 7/6/2013 2:30am
void initBins(){
  physics.setDensity(0); // Set density for bins to 0 so they won't move
  physics.setFriction(.1);
  bin = new Body[bin_num + 1]; // Create the array for bins
  for(int i = 0; i < bin_num+1; i++){
    float bin_x = bin_start_x + i*(bin_wall_w + bin_width); // Compute center of current bin wall center
    bin[i] = physics.createRect(bin_x-bin_wall_w/2,bottom-bin_wall_h,bin_x+bin_wall_w/2,bottom);
  }
}

// Put blue rectangles on the bin walls WORKS 7/6/2013 2:50am
void displayBins(){
   // Putting blue rectangle on bin walls
   for(int i = 0; i < bin_num+1; i++){
     Vec2 pos = physics.worldToScreen(bin[i].getWorldCenter()); //First get the center of the body
     float a = bin[i].getAngle(); // Get the angle of rotation of the body
     rectMode(CENTER); // physics uses the center
     pushMatrix(); // Save the transformation matrix
     translate(pos.x, pos.y); //Translate to the body center
     rotate(-a); // Rotate to match the body
     noStroke();
     fill(0,0,240);
     rectMode(CENTER);
     rect(0, 0,bin_wall_w, bin_wall_h); // Draw the graphics
     popMatrix(); // Undo the transformation
   }
}

// Draws vertical lines through center of bin wall to see if bin layout is correct.
// WORKS 7/6/2013 2:30am
void binLines(){
  stroke(0);
  strokeWeight(1);
  for(int i = 0; i < bin_num+1; i++){
    float binx = bin_start_x+i*(bin_width+bin_wall_w);
    line(binx,0,binx,bottom);
  }
}

