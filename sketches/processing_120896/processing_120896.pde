
void setup()
{
  size(500,500);
}
 
void draw()
{
  background(255);
  
  pushMatrix();
  fill(0,150,0);
  ellipse(250, 250, 500, 500);
  popMatrix();
   
  translate(width/2,height/2);
  float sekunden = map (second (),0,60,0,360);
  float minuten = map (minute(),0,60,0,360);
  float stunden = map(hour(),0,12,0,360);
   
  pushMatrix();
  fill(255);
  noStroke();
  ellipse(0,0,400,400);
  popMatrix();
  pushMatrix();
  fill(0,150,0);
  noStroke();
  ellipse(0,0,380,380);
  popMatrix();
  pushMatrix();
  fill(255);
  noStroke();
  ellipse(0,0,300,300);
  popMatrix();
  pushMatrix();
  fill(0, 150,0);
  noStroke();
  ellipse(0,0,270,270);
  popMatrix();
  pushMatrix();
  fill(255);
  noStroke();
  ellipse(0,0,150,150);
  popMatrix();
  pushMatrix();
  fill(0, 150, 0);
  noStroke();
  ellipse(0,0,110,110);
  popMatrix();
  pushMatrix();
  noStroke();
  fill(0);
  rotate(radians(sekunden));
  rect(0,-200,10,10);
  popMatrix();
  pushMatrix();
  noStroke();
  fill(0,0,0);
  rotate(radians(minuten));
  rect(0,-150,15,15);
  popMatrix();
  pushMatrix();
  noStroke();
  fill(0,0,0);
  rotate(radians(stunden));
  rect(0,-75,20,20);
  popMatrix();
  pushMatrix();
  fill(0,150,0);
  ellipse(0,0,30,30);
  popMatrix();
  pushMatrix();
  fill(0,150,0);
  noStroke();
  ellipse(0,0,15,15);
  popMatrix();
   for (int i=0; i<360; i+=90)
{
    pushMatrix();
    rotate(radians(i));
    translate(0,-230);
    fill(255);
    noStroke();
    rect(0, 0,10,10);
    popMatrix();
} 
}

