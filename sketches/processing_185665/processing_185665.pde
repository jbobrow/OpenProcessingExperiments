
float r,g,b,q,w,e;

void setup(){
  
 size(640, 480);
 
 
}

void draw(){
  
background(255);
  noStroke();
  if (mouseX > width/2){
    fill(r,g,b);
    rect(0,0, width/2, height);
    fill(q,w,e);
    rect(width/2-50, height/2, 100, 100);
    
  } else {
    fill(q,w,e);
  rect (320, 0, width/2, height);
  fill(r,g,b);
  rect(width/2-50, height/2, 100, 100);
  }
}

void mousePressed(){
  
  r = random(255);
  g = random(255);
  b = random(255);
  q = random(255);
  w = random(255);
  e = random(255);
}
