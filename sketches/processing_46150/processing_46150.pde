
void setup(){
  size(1000,1000);
}

void draw(){
  fill(random(0,255),255,7);
  rect(0,0,1000,1000);
  background(mouseX,100,25,72); 
  point(50,50);
  strokeWeight(2);
  ellipse(400,400,100,100);
  fill(random(0,245),21,96,76);
  ellipse(mouseY,500,2000,100);
  strokeWeight(1);
  line(500,100,100,10);
  line(500,100,-100,250);
  fill(mouseY,1,72,1);
  rect(200,500,250,250);
  strokeWeight(6);
  point(50,50);

}





