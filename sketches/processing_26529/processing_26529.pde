
//LSD CLASS
class LSD {

  //array of x/y positions for storing each circle
  float[] positions = new float[125];
  float[] positions2 = new float[125];
  float[] opacity = new float[125];
  float[] reds = new float[125];
  float[] greens = new float[125];
  float[] blues = new float[125];
  
  float m;
  float x;
  float y;
  
  //perlin noise time starts
  float t1;
  float t2;
  float t3;
  float tX = 0.0;
  float tY = 0.3;
  
  float theta = 0;
  
  float incrementX = 0.01;
  float increment = 0.1;
  
  int time;
  float timescale;
  int movementscale;
  
  int trail;
  
  float fadein = 0;
  float fadeout = 1;
  
  
LSD(float _x, float _y, int _time, int _trail, float _timescale) {
  
  x = _x;
  y = _y;
  time = _time;
  trail = _trail;
  timescale = _timescale;
  
  
  //size(500, 400);
  //background(0);
  
  movementscale = 1000;
  
  
  
}


void display(int start) {
  
  
  //generate values using perlin noise
  float m = noise(t2/(timescale * movementscale) + time)*16;
  
  //get a noise value at time and scale it for movement
  float x = noise(tX + time)*width;
  float y = noise(tY + time)*height;
  
  theta += .01;
  
  //sin raises and lowers the speed of the movement for the shape
  incrementX += abs(sin(theta)*.00000000001);
  
  // With each cycle, increment the " time "
  t1 += increment;
  t2 += increment;
  t3 += increment;
  tX += incrementX;
  tY += incrementX;
  
  noStroke();
  // Shift array values
  for (int i = 0; i < positions.length-1; i ++ ) {
    // Shift all elements down one spot. 
    // xpos[0] = xpos[1], xpos[1] = xpos = [2], and so on. Stop at the second to last element.
    positions[i] = positions[i+1];
    positions2[i] = positions2[i+1];
    reds[i] = reds[i+1];
    greens[i] = greens[i+1];
    blues[i] = blues[i+1];
  }
  
  // New location
  positions[positions.length-1] = x-m; // Update the last spot in the array with the mouse location.
  positions2[positions2.length-1] = y-m;
  
  /*
  if (reds[reds.length - 1] < 160*(1.5*noise((t2/timescale + time)/7))) {
   reds[reds.length - 1]++;
  } 
  
  if (greens[greens.length - 1] < 200* (1.5*noise((t1/timescale + time)/10))) {
   greens[greens.length - 1]++;
  }
  
  if (blues[blues.length - 1] < 120) {
   blues[blues.length - 1]++;
  }
  */
   
  
  reds[reds.length - 1] = 100*(1.5*noise((t3/timescale + time)));
  greens[greens.length - 1] = 200* (1.5*noise((t1/timescale + time)));
  blues[blues.length - 1] = 160;
  
  if (fadein < 1) {
    fadein = fadein + .0067;
  }
  
  if (start > 3450 && fadeout > 0) {
    fadeout = fadeout - .0067;
  }
  
  // Draw everything
  for (int i = 1; i < positions.length; i ++ ) {
     // Draw an ellipse for each element in the arrays. 
     // Color and size are tied to the loop's counter: i.
     
    noStroke();
    fill(reds[i], greens[i], blues[i], (((i*2 - (trail)) * 1-(noise(t2/timescale))/5) * fadein * fadeout));
    pushMatrix();
    translate(positions[i], positions2[i]);
    rotate(t3/17);
    ellipse(0, 0, ((positions[i-1] - 10) * .2) * (i/124), ((positions2[i-1] - 10) * .2) * (i/124));
    popMatrix();
  
  
  
  }
}




}

