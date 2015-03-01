
// Mouse Click to generate a new EYE 


float b, eyec, ce;

void setup(){
 size(1000,900);
 background(255);
 colorMode(HSB, 360);
}

void draw(){
  
  float sd = width/8;
  float mean = width/2;
  float x = randomGaussian()*sd + mean;
  
  float sdy = height/8;
  float ymean = height/2;
  float y = randomGaussian()*sdy + ymean;
  


  float sdc = 360/ce;
  println(ce);
  float cmean = 360/2;
  float c = randomGaussian()*sdc+cmean;
  
    fill(c,c,c,10);
  noStroke();
  // stroke(1);
  ellipse(x, y, 400, 450);
    // ellipse(x, y, 30, 409);
    // ellipse(x-200, y, 30, 409);
    
    

  fill(0,20);
  float size=randomGaussian()*sd+mean;
   ellipse(width/2, height/2, size/3, size/3);

}


void mousePressed(){
  background(255);
 ce = random(-2,8);
}


