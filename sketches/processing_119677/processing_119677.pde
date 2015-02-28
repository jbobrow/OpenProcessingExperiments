
int colorChange; //in milliseconds (1000 = 1 sec)
int angleChange;
int hourChange;
float angleA = 0;
float angleB = 0;

void setup() {
  background(255);
  size(200, 200);
  rectMode(CENTER);
  fill(random(255), random(255), random(255));
  noStroke();
}

void draw() {

   
   
    
    
    
    if (millis() > 1000 + angleChange) {   
    translate(width/2, height/2);
    rotate(angleA/3);
    rect (0, 0, 20, 20); 
    angleA += 0.1;
    angleChange = millis();
    
     if (millis() > 500 + colorChange) {
    fill(random(255), random(255), random(255));
    colorChange = millis();
   }
    
  }
  
  
  if (millis() > 2000 + hourChange) {  
    pushMatrix();
//    translate(0, 0);
    
    translate(width/2, height/2);
    rotate(angleB/4);
    rect (50, 50, 40, 40); 
    angleB += 1;
    hourChange = millis();
    popMatrix();  
    
  }
    
  
}
