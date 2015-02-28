
void setup(){
  size (500, 500);
 // smooth();
 background (250, 250, 0);
  }

void draw(){
noStroke();
background (250, 250, 0);
fill(0,50);
ellipse(75, 75, 20, 20);

fill(0,50);
  if(dist(mouseX, mouseY, 75, 75) > 10){
    ellipse (mouseX, mouseY, mouseX*5, mouseY*5);
  } if(dist(75, 75, mouseX, mouseY) > 10){
    ellipse (mouseX, mouseY, mouseX/2, mouseY/2);
  }
}
