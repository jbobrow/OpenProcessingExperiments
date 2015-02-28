
void setup() {
 
  size(450,450);
  background(255);
  
}

void draw() {
}

void mouseDragged()
{
 
  float green = map(mouseX, 0, width, 0, 150);
  float blue = map(mouseY, 0, height, 0, 150);
  float red = dist(mouseX, mouseY, width/2, height/2)/1.5;
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 10);
 
  //white masking layer
  noStroke();
  fill(255, alpha);
  rect(width/2, height/2, width, height);
  

  stroke (red, green, blue, 255);
  strokeWeight(1);
 
  float rad = dist(width/2, height/2, mouseX, mouseY);
  rectMode(CENTER);
  ellipse(width/2, height/2, rad, rad);
 // rect(width/2, height/2, rad, rad);
  line(width/2, height/2, mouseX, mouseY);
  line(width - width/2, height/2, width - mouseX, mouseY);
  line(width/2, height - height/2, mouseX, height - mouseY);
  line(width - width/2, height - height/2, width - mouseX, height - mouseY);
  
}

