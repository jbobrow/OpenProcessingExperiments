
float r= 0;
float g= 0;
float b= 0;

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  background (r,g,b);
  strokeWeight(50);
  line(40,0,70,height);
  strokeWeight(120);
  line(300,0,240,height);
  strokeWeight(10);
  line(400,0,10,height);
  
  if (mousePressed) {
    r= random(255);
    g= random(255);
    b= random(255);  
    stroke(0);
  } 
  
  else {
    r= 204;
    g= 204;
    b= 204;
    stroke(204);
  }
  
}
                
