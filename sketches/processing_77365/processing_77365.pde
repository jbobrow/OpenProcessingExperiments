
void setup () {
  smooth();
 size (600,600);
background (0,map(mouseX,0,height,100,255),255); 
frameRate(40);
}

void draw () {
 
  fill(255,map(mouseX,0,600,100,255),0); 
  strokeWeight(1);
  ellipse(300,300,100,100);
  
  fill(0,map(mouseX,0,height,100,255),255,10);
  rect(0,0,600,600);
  
  fill(255,220,0);
  //stroke(random(255,255), random (180,255), random(0,0));
  stroke(255,map(mouseX,0,600,100,255),0);
  
  //strokeWeight(random(1,15));
  strokeWeight(map(mouseY,0,600,0,10));
  line(300,300, random(0,600), random (0,600));
  //line(100,100, mouseX, mouseY);
 
 
  noStroke();
  fill(map(mouseX,0,height,200,255), map(mouseX,0,height,100,255), map(mouseX,0,height,150,255));
  ellipse(600-mouseX, 600-mouseY, random(0,100),random(0,80));
  //ellipse(random(0,600), random(0,600), random(0,50), random(0,50));
}

