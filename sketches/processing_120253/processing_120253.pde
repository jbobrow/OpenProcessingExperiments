
void setup()
{
  size(500,500);
}

void draw()
{
  background(100);
  
  translate(width/2,height/2);
  float sekunden = map (second (),0,60,0,360);
  float minuten = map (minute(),0,60,0,360);
  float stunden = map(hour(),0,12,0,360);
  
  pushMatrix();
  fill(110);
  noStroke();
  ellipse(0,0,250,250);
  popMatrix();
  
  //sekunden 
  pushMatrix();
  noStroke();
  fill(0);
  rotate(radians(sekunden));
  rect(0,-180,2,180);
  popMatrix();
  
  //minuten
  pushMatrix();
  noStroke();
  fill(255);
  rotate(radians(minuten));
  rect(0,-150,3,150);
  popMatrix();
  
  //stunden
  pushMatrix();
  noStroke();
  fill(255);
  rotate(radians(stunden));
  rect(0,-100,4,100);
  popMatrix();
  
  pushMatrix();
  fill(255);
  ellipse(0,0,30,30);
  popMatrix();
  
  pushMatrix();
  fill(144,4,4);
  noStroke();
  ellipse(0,0,15,15);
  popMatrix();
  
   for (int i=0; i<360; i+=30)
 { 
    pushMatrix();
    rotate(radians(i));
    translate(0,-230);
    fill(255);
    noStroke();
    rect(0, 0,5,10);
    popMatrix();
 }

  
  
}
