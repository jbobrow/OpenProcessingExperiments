
//Size of window: 400x400
size(400, 400);
println(width + ", " + height);
fill(random(255));
smooth();

//Background colour is randomly produced everytime the program is run
//Background is limited to greyscale
background(random(0, 100));

//Random variations in stroke
stroke(random(255));

//vertical lines pointing upwards from y = 200
//At the end of each line is a ellipse if l > 85
//If lengthUp < 85, at the end of each line is an ellipse
float lengthUp = random(20, 150);

for (int tp = 10; tp < 400; tp += 10) { 
  line(tp, 200, tp, lengthUp); 
 if(lengthUp>85){
    rect(tp-5, lengthUp, 10, 10);
 }else{
  ellipse(tp, lengthUp-5, 10, 10);
 }
  lengthUp = random(20, 150);
}

//Vertical lines pointing downwards from y = 200
//At the end of each line is a square if k < 325
//If lengthDown > 325, at the end of each line is an ellipse
float lengthDown = random(250, 380);

for (int bt = 10; bt < 400; bt += 10) { 
  line(bt, 200, bt, lengthDown); 
  if(lengthDown>325){
    ellipse(bt, lengthDown-5, 10, 10);
  }else{
    rect(bt-5, lengthDown, 10, 10);
  }
  lengthDown = random(250, 380);
}

//Two sine waves starting at (0, 200)

float abc = random(0, 90);

//Sine wave 'going down'
float angleDown = 0;        // Angle receives sine values from 0 degrees 
float angleIncDown = PI/random(35); // Increment between the next angle 
float yOffsetDown = 200;     // Y offset 
float scaleValDown = abc;    // Scale value for the wave magnitude is randomized
for (int x = 0; x <= width; x += 5) { 
  float y = yOffsetDown + (sin(angleDown) * scaleValDown); 
  ellipse(x, y, 6, 4); 
  angleDown += angleIncDown; 
}

//Sine wave 'going up'
float angleUp = 135;        // Angle receives sine values from 135 degrees
float angleIncUp = PI/random(35); // Increment between the next angle 
float yOffsetUp = 200;     // Y offset 
float scaleValUp = abc;    // Scale value for the wave magnitude is randomized
for (int x = 0; x <= width; x += 5) { 
  float y = yOffsetUp + (sin(angleUp) * scaleValUp); 
  rect(x, y, 6, 4); 
  angleUp += angleIncUp; 
}

//Screenshot
//saveFrame("soundWave.jpg");
//END DOCUMENT

