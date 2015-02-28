
float random1X, random1Y, random1Rad;
float random2X, random2Y, random2Rad;
float random3X, random3Y, random3Rad;
float random4X, random4Y, random4Rad;

float random5X, random5Y, random5Rad;
float random6X, random6Y, random6Rad;
float random7X, random7Y, random7Rad;
float random8X, random8Y, random8Rad;

void setup(){  
  size(800, 500);
  smooth();  
  randomizeEllipse();
}

void draw(){  
   background(0);
   
   // draw 3 shapes
   stroke(255);
   fill(255, 15);
   ellipse(random1X, random1Y, random1Rad, random1Rad); 
   ellipse(random2X, random2Y, random2Rad, random2Rad); 
   ellipse(random3X, random3Y, random3Rad, random3Rad); 
   ellipse(random4X, random4Y, random4Rad, random4Rad);
    
   ellipse(random5X, random5Y, random5Rad, random5Rad); 
   ellipse(random6X, random6Y, random6Rad, random6Rad); 
   ellipse(random7X, random7Y, random7Rad, random7Rad); 
   ellipse(random8X, random8Y, random8Rad, random8Rad); 
   
   // connect the shapes
   stroke(255, 50);
   line(random1X, random1Y, random2X, random2Y);
   line(random1X, random1Y, random3X, random3Y);
   line(random1X, random1Y, random4X, random4Y);
   
   line(random2X, random2Y, random3X, random3Y);
   line(random2X, random2Y, random4X, random4Y);
   
   line(random3X, random3Y, random4X, random4Y);
   
   //
   line(random5X, random5Y, random6X, random6Y);
   line(random5X, random5Y, random7X, random7Y);
   line(random5X, random5Y, random8X, random8Y);
   
   line(random6X, random6Y, random7X, random7Y);
   line(random6X, random6Y, random8X, random8Y);
   
   line(random7X, random7Y, random8X, random8Y);
   //
   
   //random noise
   random1X = makeNoise(random1X, width);
   random2X = makeNoise(random2X, width);
   random3X = makeNoise(random3X, width);
   random4X = makeNoise(random4X, width);
   
   random1Y = makeNoise(random1Y, height);
   random2Y = makeNoise(random2Y, height);
   random3Y = makeNoise(random3Y, height);
   random4Y = makeNoise(random4Y, height);
   
   random5X = makeNoise(random5X, width);
   random6X = makeNoise(random6X, width);
   random7X = makeNoise(random7X, width);
   random8X = makeNoise(random8X, width);
   
   random5Y = makeNoise(random5Y, height);
   random6Y = makeNoise(random6Y, height);
   random7Y = makeNoise(random7Y, height);
   random8Y = makeNoise(random8Y, height);
}

void mousePressed(){
  randomizeEllipse();  
}

float makeNoise(val, max){
   // random walk (brownian noise)
   val noiseVal = 3;   
   val += random(-noiseVal, noiseVal);   
   
   // make sure it stays within bounds
   val = constrain(val, 0, max);
   return val;
}

void randomizeEllipse(){
  // recalculate random variables
  
  random1X = random(0, width);
  random1Y = random(0, height);  
  random1Rad = random(16, 28);
  
  random2X = random(0, width);
  random2Y = random(0, height);  
  random2Rad = random(16, 28);
  
  random3X = random(0, width);
  random3Y = random(0, height);  
  random3Rad = random(16, 28);
  
  random4X = random(0, width);
  random4Y = random(0, height);  
  random4Rad = random(16, 28);
  
  random5X = random(0, width);
  random5Y = random(0, height);  
  random5Rad = random(16, 28);
  
    random6X = random(0, width);
  random6Y = random(0, height);  
  random6Rad = random(16, 28);
  
    random7X = random(0, width);
  random7Y = random(0, height);  
  random7Rad = random(16, 28);
  
    random8X = random(0, width);
  random8Y = random(0, height);  
  random8Rad = random(16, 28);
}
