

float radius = 0.0;
float radius2 = 0.0;

float color1 = 122;
float color2 = 0;

int threshold = 10;
float prevMillis = 0.0;
float radiusLimit = 500;

void setup(){
  size(500, 500);
  background(0);
  fill(0);
  smooth();
  noStroke();
  
}

void draw(){
  
  if(radius2 == 0 || radius == 0){
    
    radiusLimit -= 20;
    
    color1 = random(255);
    color2 = random(255);
  }
  
  if(millis() - prevMillis >= threshold){
        
    
    
    prevMillis = millis();
    radius += 5;
    radius %= radiusLimit;
    
    //fill(radius, color1, 0);
    fill(color1 * radius, color1, color1, 25);
    
    ellipse(width/2, height/2, radius, radius);
  }
  
  radius2 += 10;
  radius2 %= radiusLimit;
  
  
  
  color2 += 1;
  //fill(radius2, color2, 0);
  fill(color2, color2, color2 * radius2, 25);
    
  ellipse(width/2, height/2, radius2, radius2);
  
  if(radiusLimit <= 0) {
    println("reset");
    radius = 0;
    radius2 = 0;
    radiusLimit = 500;
  }
}

