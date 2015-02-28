

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  
}

int pos = 0;

void draw(){
  
    background(0);
    
  fill(255);
  ellipse(mouseX, mouseY, 100,100);
  
  stroke(255);
  line(200, 200, mouseX, mouseY);
  
  noStroke();
  fill(mouseX, mouseX, mouseX);
  ellipse(width/10, height/10, mouseX/10, mouseY/10);
  ellipse(width/10 +60 , height/10, mouseX/10, mouseY/10);
  ellipse(width/10 +120 , height/10, mouseX/10, mouseY/10);
  ellipse(width/10 +180 , height/10, mouseX/10, mouseY/10);
  ellipse(width/10 +240 , height/10, mouseX/10, mouseY/10);
  ellipse(width/10 +300 , height/10, mouseX/10, mouseY/10);
  
  ellipse(width/10, height/10 +60, mouseX/10, mouseY/10);
  ellipse(width/10, height/10 +120 , mouseX/10, mouseY/10);
  ellipse(width/10 , height/10 +180, mouseX/10, mouseY/10);
  ellipse(width/10 , height/10 +240, mouseX/10, mouseY/10);
  ellipse(width/10 , height/10 +300, mouseX/10, mouseY/10);
  
  ellipse(width/10 +60, height/10 +60, mouseX/10, mouseY/10);
  ellipse(width/10 +60, height/10 +120 , mouseX/10, mouseY/10);
  ellipse(width/10 +60 , height/10 +180, mouseX/10, mouseY/10);
  ellipse(width/10 +60, height/10 +240, mouseX/10, mouseY/10);
  ellipse(width/10 +60, height/10 +300, mouseX/10, mouseY/10);
  
  ellipse(width/10 +120, height/10 +60, mouseX/10, mouseY/10);
  ellipse(width/10 +120, height/10 +120 , mouseX/10, mouseY/10);
  ellipse(width/10 +120 , height/10 +180, mouseX/10, mouseY/10);
  ellipse(width/10 +120, height/10 +240, mouseX/10, mouseY/10);
  ellipse(width/10 +120, height/10 +300, mouseX/10, mouseY/10);
 
  ellipse(width/10 +180, height/10 +60, mouseX/10, mouseY/10);
  ellipse(width/10 +180, height/10 +120 , mouseX/10, mouseY/10);
  ellipse(width/10 +180 , height/10 +180, mouseX/10, mouseY/10);
  ellipse(width/10 +180, height/10 +240, mouseX/10, mouseY/10);
  ellipse(width/10 +180, height/10 +300, mouseX/10, mouseY/10);

  ellipse(width/10 +240, height/10 +60, mouseX/10, mouseY/10);
  ellipse(width/10 +240, height/10 +120 , mouseX/10, mouseY/10);
  ellipse(width/10 +240 , height/10 +180, mouseX/10, mouseY/10);
  ellipse(width/10 +240, height/10 +240, mouseX/10, mouseY/10);
  ellipse(width/10 +240, height/10 +300, mouseX/10, mouseY/10);
  
  ellipse(width/10 +300, height/10 +60, mouseX/10, mouseY/10);
  ellipse(width/10 +300, height/10 +120 , mouseX/10, mouseY/10);
  ellipse(width/10 +300 , height/10 +180, mouseX/10, mouseY/10);
  ellipse(width/10 +300, height/10 +240, mouseX/10, mouseY/10);
  ellipse(width/10 +300, height/10 +300, mouseX/10, mouseY/10);

  
  fill(242, 86, 40);
  ellipse(width/2,height/2, 50, 50);
  


 
}



