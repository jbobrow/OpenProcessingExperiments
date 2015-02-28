
int c = 40;
int d = 40;

void setup(){
  
  size(500,500);
  background(255);
  frameRate(60);
  smooth();
  noStroke();
}
 
void draw(){
  
  noStroke();
  float a = random(0,1);
  float i = random(-1,0);
  
  for(i=0;i<a;i++){
  if(mousePressed == true) { 
    ellipse(mouseX, mouseY, 10, 10);
    fill(0);
  }
  
  else {
    ellipse(mouseX, mouseY, 40*sin(c), 40*sin(d));
    fill(255);
  }
  }
}
                    
