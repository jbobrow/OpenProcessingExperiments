
void setup()
{
  size(500,500);
}

void draw()
{
  background(60);
  
  translate(width/2,height/2);
  float sekunden = map(second(),0,60,0,360);
  float minuten = map(minute(),0,60,0,360);
  float stunden = map(hour(),0,12,0,360);
  
  pushMatrix();
  noStroke(); 
  fill(105);
  rectMode(CORNER);
  rect(-0.25,-250,0.5,500);
  rect(-250,-0.25,500,0.5);
  rotate(radians(30));
  rect(-0.25,-400,0.5,800);
  rect(-400,-0.25,800,0.5);
  rotate(radians(30));
  rect(-0.25,-400,0.5,800);
  rect(-400,-0.25,800,0.5);
  popMatrix();
  
  pushMatrix();
  noStroke();
  fill(190);
  rotate(radians(sekunden));
  rectMode(CENTER);
  rect(0,-200,5,5);
  popMatrix();
  
  pushMatrix();
  noStroke();
  fill(210);
  rotate(radians(minuten));
  rect(0,-140,8,10);
  popMatrix();
  
  pushMatrix();
  noStroke();
  fill(135,219,159);
  rotate(radians(stunden));
  rect(0,-80,10,15);
  popMatrix(); 
  

}
  
