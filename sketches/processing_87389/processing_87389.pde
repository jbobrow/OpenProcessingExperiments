
void setup(){
    size (500,500);
    background (random(0,255), random(0,255), random(0,255));
    frameRate(60);
    loadPixels();
  }
 
 float timer = 0;
 float r = QUARTER_PI;
 
  void draw(){
    
  pushMatrix();
    
  noStroke();
  timer += 0.0167;
  
  if (timer < 5){
  
  float w = width;
  float h = height;
  float g = random (255);
  float m = random (255);
  float n = random (255);
  fill(g, m, n);
  ellipse(random(50,450), random(50,450), random(w), random(h));
  }
  
    if (timer >= 5 && timer < 10){
    
    
  fill (random(0,255), random(0,255), random(0,255));
  float a = random (50,100);
  float b = random (50,100);
  float x = mouseX;
  float y = mouseY;
  rect (x, y, a, b);

filter(ERODE);
  
  }
  
  if (timer > 10){
    
    translate(250,250);
    r += 0.75;
    strokeWeight(5);
    stroke(random(255),random(255),random(255));
    rotate (r);
    line (0, 0, 500, 500);
    
  }
  
  if (timer > 13 && timer < 18){
    filter(INVERT);
  }
  
  popMatrix();
  
  if (timer >= 18){
    
    strokeWeight(1);
    filter(ERODE);
   
    stroke(random(255),random(255),random(255));
    for (int i = 0; i < 250; i = i+25){
      for (int k = 250; k > 0; k = k-25){
      line(0,i,250,k);
      }
  
  }
  
      stroke(random(255),random(255),random(255));
    for (int i = 0; i < 250; i = i+15){
      for (int k = 250; k > 0; k = k-15){
      line(250,i,500,k);
      }
    }
    
        stroke(random(255),random(255),random(255));
    for (int i = 250; i < 500; i = i+50){
      for (int k = 500; k > 250; k = k-50){
      line(0,i,250,k);
      }
    }
    
            stroke(random(255),random(255),random(255));
    for (int i = 250; i < 500; i = i+35){
      for (int k = 500; k > 250; k = k-35){
      line(250,i,500,k);
      }
    }
  }
  
  if (timer > 19){
    filter(INVERT);
  }
  
  }
  
 void mousePressed(){
   filter(INVERT);
 }
 
  void keyPressed(){
    fill (0);
    rect (0,0,500,500);
  }


