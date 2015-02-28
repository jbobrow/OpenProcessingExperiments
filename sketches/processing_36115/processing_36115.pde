
void setup() {
  size(700,400);
  smooth();
  background(5,1,1);
  color(RGB);
}


void draw() { 
  
  fill((mouseX+frameCount*10)%255, (mouseY+frameCount*10)%255,162);
  rect(0,0,120,120);
  fill((mouseX+frameCount*10)%255, (mouseY+frameCount*10)%255,162);

  rect(120,120,120,120);
  fill((mouseX+frameCount*10)%255, (mouseY+frameCount*10)%255,162);
  
  rect(240,0,120,120);
  fill((mouseX+frameCount*10)%255, (mouseY+frameCount*10)%255,162);

  rect(360,120,120,120);

  rect(480,0,120,120);
  fill((mouseX+frameCount*10)%255, (mouseY+frameCount*10)%255,162);

   rect(600,120,120,120);

  rect(0,240,120,120);
  
  rect(120,360,120,120);

  rect(240,240,120,120);

  rect(360,360,120,120);
  fill((mouseX+frameCount*10)%255, (mouseY+frameCount*10)%255,162);
  
  rect(480,240,120,120);
  
   rect(600,360,120,120);

  
  rect(0,480,120,120);

  rect(240,480,120,120);
  fill((mouseX+frameCount*10)%255, (mouseY+frameCount*10)%255,162);
  
  rect(480,480,120,120);
}


