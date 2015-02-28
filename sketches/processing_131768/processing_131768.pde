
void setup() {
  size(600,600);
  background(0);
  frameRate(30);
  stroke(255);
  strokeWeight(5);
}

void draw(){
  line(550,0,550,600);
  line(0,550,600,550);
  line(50,600,50,0);
  line(0,50,600,50);
  fill(random(255), random(255), random(255), random(255));
  ellipse(mouseX, mouseY, random(150), random(150));
  if(mouseY>550)
     background(0,0,90);
  if(mouseX>550)
     background(0,0,190);
  if(mouseY<50)
     background(0,0,25);
  if(mouseX<50)
     background(0,0,255);  
     }
