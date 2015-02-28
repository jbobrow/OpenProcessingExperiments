
void setup(){
  size(500,500);
  smooth();
  strokeWeight(.5);
  background(255);  
}

void draw(){
  background(random(255));
  fill(0, 0, 0);
  for(int i = 0;i < 100; i++){
    noFill();
    ellipse(width/2,height/2,i*3,i*3);
    stroke(0.1);
    fill(134,23,256,.1);
    line(random(500), random(500), random(500), random(500));
    quad(random(200),i*10,1*4,random(300),random(499),i*2,i*9,random(100));
    
    fill(255, 255, 255);
    ellipse(mouseX,mouseY,i*2 - random(20),i*2- random(10));
  }
  fill(255);
      ellipse(random(width),random(height), random(20),random(0));
}

void mousePressed(){
  background(random(255,45),random(255));
  
}
