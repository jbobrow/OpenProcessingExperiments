
float angle;
float jitter;

void setup(){
  size(600, 600); //width, height
  background(50);
  frameRate(50);
  rectMode(CENTER);
 
}

void draw(){
  // during even-numbered seconds (0, 2, 4, 6...)
  if (second() % 2 == 0) {  
    jitter = random(-0.1, 0.1);
  }
  angle = angle + jitter;
  float c = cos(angle);
  translate(width/2, height/2);
  rotate(c);

  rect(0, 0, 1024, 1024);  
  fill(0, 0, 0, 10);
  stroke(3, 3, 3);
  
  rect(0, 0, 768, 768);  
  fill(37, 38, 41, 10);
  stroke(36, 27, 0);
  
  rect(0, 0, 512, 512);  
  fill(0, 0, 0, 10);
  stroke(72, 53, 0);
  
  rect(0, 0, 384, 384);  
  fill(37, 38, 41, 10);
  stroke(116, 85, 0);
  
  rect(0, 0, 256, 256);  
  fill(0, 0, 0, 10);
  stroke(201, 131, 0);
  
  rect(0, 0, 192, 192);  
  fill(37, 38, 41, 10);
  stroke(234, 154, 2);
  
  rect(0, 0, 128, 128);  
  fill(37, 38, 41, 10);
  stroke(234, 154, 2);
  
  rect(0, 0, 96, 96);  
  fill(0, 0, 0, 10);
  stroke(200, 140, 0);
  
  rect(0, 0, 64, 64);  
  fill(0, 0, 0, 10);
  stroke(160, 117, 0);
  
  rect(0, 0, 48, 48);  
  fill(0, 0, 0, 10);
  stroke(198, 146, 0);
  
  rect(0, 0, 32, 32);  
  fill(0, 0, 0, 10);
  stroke(277, 167, 0);
  
  rect(0, 0, 24, 24);  
  fill(0, 0, 0, 10);
  stroke(255, 188, 0);
  
  rect(0, 0, 16, 16);  
  fill(0, 0, 0, 10);
  stroke(255, 200, 49);
  
  rect(0, 0, 12, 12);  
  fill(0, 0, 0, 10);
  stroke(250, 215, 103);
  
  rect(0, 0, 8, 8);  
  fill(0, 0, 0, 10);
  stroke(255, 241, 203);
  
  rect(0, 0, 4, 4);  
  fill(0, 0, 0, 10);
  stroke(255, 249, 232);
  
  rect(0, 0, 2, 2);  
  fill(0, 0, 0, 10);
  stroke(250,250,250);
  
}
 


