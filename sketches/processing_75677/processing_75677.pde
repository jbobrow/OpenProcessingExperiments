
void setup(){
  //background(0);
  size(800,800);
  fill(126);
  noSmooth();
  rectMode(CENTER);
}

void draw(){
  if(mousePressed){
  stroke(0);
  strokeWeight(2); 
}
  else{
    stroke(255);
    strokeWeight(10);
  }

line(mouseX-66,mouseY,mouseX+66,mouseY);
line(mouseX,mouseY-66,mouseX,mouseY+66);
rect(mouseX, height/2,mouseY/2+10, mouseY/2+10);
fill(255,204);
fill(random(255),random(255),random(255),50);
int inverseX = width-mouseX;
int inverseY = height-mouseY;
rect(inverseX, height/2, (inverseY/2)+10, (inverseY/2)+10);
fill(random(255),random(255),random(255),10);
}


