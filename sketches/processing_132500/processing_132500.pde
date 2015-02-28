
void setup() {
  
  size(450,450);
  background(0);
   
}
 
void draw() {
}
 
void mouseDragged()
{
  
  float green = map(mouseX, 0, width, 100, 255);
  float blue = map(mouseY, 0, height, 100, 255);
  float red = dist(mouseX, mouseY, width/2, height/2);
   
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 10);
  
  //white masking layer
  noStroke();
  fill(0, alpha);
  rect(width/2, height/2, width, height);
   
 
  stroke (red, green, blue, 255);
  strokeWeight(1);
  
  float rad = dist(width/2, height/2, mouseX, mouseY);
  rectMode(CENTER);
  //ellipse(width/2, height/2, rad, rad);
 // rect(width/2, height/2, rad, rad);
  line(0, height/2, mouseX, mouseY);
  line(width, height/2, mouseX, mouseY);
  line(0, height/2, mouseX, height - mouseY);
  line(width, height/2, mouseX, height - mouseY);
  
  line(0, height/2, width - mouseX, mouseY);
  line(width, height/2, width - mouseX, mouseY);
  line(0, height/2, width - mouseX, height - mouseY);
  line(width, height/2, width - mouseX, height - mouseY);
  
  line(width/2, height, mouseX, mouseY);
  line(width/2, 0, mouseX, mouseY);
  line(width/2, height, width - mouseX, mouseY);
  line(width/2, 0, width - mouseX, mouseY);
  
  line(width/2, height, mouseX, height - mouseY);
  line(width/2, 0, mouseX, height - mouseY);
  line(width/2, height, width - mouseX, height - mouseY);
  line(width/2, 0, width - mouseX, height - mouseY);
 
   
}

