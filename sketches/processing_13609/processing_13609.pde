
//by Hanna Oh
//based on code by Dennis. Thanks.

void setup() {
  size(500,500);
  stroke(200);
  background(1,50,100);
}

void draw() {
  fill(255,255,255,2);
  noStroke();
  rect(mouseX,mouseY,100,250);

  

  fill(random(255),50);
  ellipse(mouseX,mouseY,10,70);
  
  
  stroke(255,255,255,30);
  line(height/2,width/2,mouseX,mouseY);
} 
                
                
