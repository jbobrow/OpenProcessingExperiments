
void setup(){
 size(640, 480);
smooth(); 
}

void draw(){
  background(0);
  
  noFill();
  rect(0,0,100,100);
  
  fill(255,0,0);
  ellipse(mouseX, mouseY, 5,5);
  
  float mx = map(pmouseX, 0, 100, 0, width);
  float my= map(pmouseY, 0, 100, 0, height);
  
  fill(0,100,100);
  noStroke();
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  rect(mx, my, speed+10, speed+10);
  fill(90,100,9);
  rect(mx, my, pmouseX, pmouseY);
  fill(0,40,100);
  ellipse(mx, my, speed+60, speed+60);
  fill(200,200,100);
  rect(mx, my, speed+100, speed+10);
  fill(255,0,0);
  rect(mx-100, my, speed+10, speed-50);
  rect(mx, my+80, speed+20, speed+10);
 
 
  
  
  
  
}

