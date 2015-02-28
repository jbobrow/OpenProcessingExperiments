
int c = 40;
int d = 40;

void setup(){
  
  size(500,500);
  background(255);
  frameRate(100);
  smooth();
  noStroke();
}
 
void draw(){
  
  noStroke();
  float a = random(0,1);
  float i = random(-1,0);
  
  for(i=0;i<a;i++){
  if(mousePressed) { 
    ellipse(mouseX, mouseY, 10, 10);
    fill(0);
  }
  
  else{
    ellipse(mouseX, mouseY, 30*sin(c), 30*sin(d));
    fill(255);
  }
  }
}
                                                                    
