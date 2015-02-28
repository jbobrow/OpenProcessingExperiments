
void setup()
{
  size(500,500);
}

void draw()
{
  background(80);
  
  translate(width/2,height/2);
  float sekunden = map(second(),0,60,0,360);
  float minuten = map(minute(),0,60,0,360);
  float stunden = map(hour(),0,12,0,360);
  
  noStroke();
  fill(255);
  ellipse(0,0,8,8);
  
  pushMatrix();
  noStroke();
  fill(255);
  rotate(radians(sekunden));
  rect(0,-120,1,120);
  popMatrix();
  
  pushMatrix();
  noStroke();
  fill(255);
  rotate(radians(minuten));
  rect(0,-100,2,100);
  popMatrix();
  
  pushMatrix();
  noStroke();
  fill(255);
  rotate(radians(stunden));
  rect(0,-80,3,80);
  popMatrix();
  
   for (int i=0; i<360; i+=30)
 { 
    pushMatrix();
    rotate(radians(i));
    translate(0,-150);
    fill(255);
    noStroke();
    rect(0, 0,5,10);
    popMatrix();
    
 }
  
     for (int i=0; i<360; i+=6)
 { 
    pushMatrix();
    rotate(radians(i));
    translate(0,-150);
    fill(255);
    noStroke();
    rect(0, 0,1,4);
    popMatrix();
    
 }
  
}
