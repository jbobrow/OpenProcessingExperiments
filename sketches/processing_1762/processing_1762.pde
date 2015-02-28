
  float angleDownOrigin = 0;
  float angleDown = 0;        // Angle receives sine values from 0 degrees 
  float angleIncDown; // Increment between the next angle 
  float yOffsetDown = 200;     // Y offset 
  float scaleValDown;    // Scale value for the wave magnitude is randomized

  float angleUpOrigin = 0;
  float angleUp = 0;        // Angle receives sine values from 135 degrees
  float angleIncUp; // Increment between the next angle 
  float yOffsetUp = 200;     // Y offset 
  float scaleValUp;    // Scale value for the wave magnitude is randomized

void setup() {
  size(400, 400);
  smooth();
  frameRate(10);
  
  float abc = random(0, 90);
  scaleValDown = abc;    // Scale value for the wave magnitude is randomized
  scaleValUp = abc;    // Scale value for the wave magnitude is randomized
  angleIncDown = PI/random(35); // Increment between the next angle 
  angleIncUp = PI/random(35); // Increment between the next angle 
}

void draw() {
  background(50);
  smooth();
  
  //Random variations in stroke
  stroke(random(255));
  
  //vertical lines pointing upwards from y = 200
  //At the end of each line is a ellipse if l > 85
  //If lengthUp < 85, at the end of each line is an ellipse
  float lengthUp = random(20, 150);
  
  for (int tp = 10; tp < width; tp += 50) { 
    line(tp, 200, tp, lengthUp); 
    //fill(random(255));
   if(lengthUp>85){
      rect(tp-5, lengthUp, 10, 10);
   }else{
    ellipse(tp, lengthUp-5, 10, 10);
   }
    lengthUp = random(20, 150);
    //noFill();
  }
  
  //Vertical lines pointing downwards from y = 200
  //At the end of each line is a square if k < 325
  //If lengthDown > 325, at the end of each line is an ellipse
  float lengthDown = random(250, 380);
  
  for (int bt = 10; bt < width; bt += 50) { 
    line(bt, 200, bt, lengthDown); 
    if(lengthDown>325){
      ellipse(bt, lengthDown-5, 10, 10);
    }else{
      rect(bt-5, lengthDown, 10, 10);
    }
    lengthDown = random(250, 380);
  }
    
    //Two sine waves starting at (0, 200)
  
    angleDown = angleDownOrigin;
    angleUp = angleUpOrigin;
    
    //Sine wave 'going down'
    for (int x = 0; x <= width; x += 5) { 
      float y = yOffsetDown + (sin(angleDown) * scaleValDown);
      //fill(random(255)); 
      ellipse(x, y, 6, 4); 
      angleDown += angleIncDown; 
    }
    
    //Sine wave 'going up'
    for (int x = 0; x <= width; x += 5) { 
      float y = yOffsetUp + (sin(angleUp) * scaleValUp); 
      rect(x, y, 6, 4); 
      angleUp += angleIncUp; 
    }
  
    angleDownOrigin += 0.2;
    angleUpOrigin += 0.1;
}

