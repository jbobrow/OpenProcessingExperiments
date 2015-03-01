
float radius, mRadius; 
int counter; 
float inc; 

void setup() {
  size(600, 600); 
  background(0); 
  smooth(); 
  
  colorMode(HSB, 360, 100, 100, 100);

  mRadius = width/4; 
  radius = mRadius - 40; 
  counter = 0; 
  inc = 0;
}

void draw() {
  background(0);  

  translate(width/2, height/2);   

  float x, y, eSize, factor;

  for (float a = 0; a < 360; a += 20) {
    x = cos(radians(a)) * mRadius;
    y = sin(radians(a)) * mRadius;
    pushMatrix(); 
    translate(x, y); 
    rotate(radians(a+inc)); 

    eSize = 0; 
    counter = 0; 

    for (float angle = 0; angle < 276; angle += 10) {
      
      factor = (float) ((inc + counter) % 48) / 48;       
      eSize = 30 * sin(factor);      

      x = cos(radians(angle)) * radius;
      y = sin(radians(angle)) * radius;

      int c = (int) inc/2 % 360;
      fill(c, 80, 100, lerp(100, 0, factor));
      stroke(200, lerp(100, 0, factor));         
      ellipse(x, y, eSize, eSize);
      counter++;
    }    
    popMatrix();  
  }

  inc += 0.3;
  
}



