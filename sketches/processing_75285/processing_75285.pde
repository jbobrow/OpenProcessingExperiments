
void setup(){
  size(600, 800);
  background(255,5,5);
  smooth();
  colorMode(RGB, 245, 170, 170, 360);
}

void draw(){
  fill(random(255));
  rect(10, 750, 30, 30);
  rect(10, 20, 30, 30);
  rect(550, 750, 30, 30);
  rect(550, 20, 30, 30);

  fill(0,random(255),random(100));
  ellipse(width/2, height/2,100,100);
  
  if (mousePressed && (mouseButton == LEFT)){
    noStroke();
    ellipse(mouseX, mouseY, 20, 20);
    rect(5,5,5,5);
    rect(300,355,20,50);
    strokeWeight(5); 
    
    
  }
    
}
