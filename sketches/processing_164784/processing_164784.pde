
int counter;
void setup(){
  counter=0;
size(400, 400);
background(154, 199, 234);
}

void draw(){ 
  fill(170, 169, 163, 50);
  noStroke();
  ellipse(mouseX, mouseY, 200, 50);
  counter=counter+1;
  if(counter>10) counter=0;
  if (mousePressed && counter==10) {
 
  noStroke();
  rect(400, 90, 300, 100);
  fill(255, random(200), random(195));
  ellipse(mouseX + random(-25, 25), mouseY + random(-25, 25), 25, 25); 
  }
  PImage img;
  filter(BLUR, 1);
  fill(170, 169, 163, 50);
  noStroke();
  ellipse(mouseX, mouseY, 200, 50);
  noStroke();
  fill(100, 69, 60);
  triangle(0, 400, 200, 310, 400, 400);
   stroke(255, random(200), random(195));
  line(200, 310, mouseX, mouseY);
  }  

