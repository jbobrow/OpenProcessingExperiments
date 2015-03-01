
float r1, r2, r3, r4; 
float a3; 
float mx, my; 
float inc; 
color c1 = #F7D92A; //
color c2 = #ED6E05; //
color c3 = #743BA7; //
color c4 = #028AB9; //
int cMode = 1; 

void setup() {
  size(350, 350); 
  background(0); 
  smooth();  
  noFill(); 

  mx = width/2; 
  my = height/2; 

  r1 = 50; 
  r2 = 100; 
  r3 = 110; 
  r4 = 165; 

  a3 = 30;  

  inc = 0;
}

void draw() {
  background(0);  

  float angle, x, y, rStep;
  float alpha = 200;
  float strWeight = 3;  

  strokeWeight(strWeight); 
  rStep = sin(radians(frameCount));    

  pushMatrix(); 
  translate(mx, my);     

  if (cMode == 1) {
    stroke(c1, alpha);
  } else { 
    stroke(c3, alpha);
  }
  beginShape(); 
  for (angle = 0; angle <= 360; angle += 30) {    
    x = cos(radians(angle) + inc) * (r3 + 40*rStep);
    y = sin(radians(angle) + inc) * (r3 + 40*rStep);
    vertex(x, y); 
    x = cos(radians(angle+a3) - inc) * (r4 - 20*rStep);
    y = sin(radians(angle+a3) - inc) * (r4 - 20*rStep);
    vertex(x, y);
  }
  endShape();

  if (cMode == 1) {
    stroke(c2, alpha);
  } else { 
    stroke(c4, alpha);
  } 
  beginShape(); 
  for (angle = 0; angle <= 360; angle += 30) {    
    x = cos(radians(angle) - inc) * (r1 - 30*rStep);
    y = sin(radians(angle) - inc) * (r1 - 30*rStep);
    vertex(x, y);  
    x = cos(radians(angle+a3) + inc) * (r2 + 40*rStep);
    y = sin(radians(angle+a3) + inc) * (r2 + 40*rStep);
    vertex(x, y);
  }
  endShape(); 

  popMatrix(); 

  inc += 0.01;
}

void keyReleased(){
  if(key == '1'){
    cMode = 1; 
  }
  if(key == '2'){
    cMode = 2; 
  }
}


