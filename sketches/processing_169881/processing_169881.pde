
void setup()
{
  size(500,500);
  background(255);
}

void draw()
{
  //background(255);
  float sekunde_1 = map(second(),0,59,0,2*PI);
  pushMatrix();
  translate(width/2,height/2);
   noStroke();
   fill(176,196,2,1);
   rotate(sekunde_1);
  ellipseMode(CENTER);
  ellipse(0,-150,50,50);
    popMatrix();
    
    
    float minute_1 = map(minute(),0,59,0,2*PI);
    
    pushMatrix();
    translate(width/2,height/2);
    noStroke();
    fill(254,95,130,1);
    rotate(minute_1);
    ellipseMode(CENTER);
    ellipse(0,-100,50,50);
    popMatrix();
    
    float stunde_1 = map(hour(),0,12,0,2*PI);
    
    pushMatrix();
    translate(width/2,height/2);
    noStroke();
    fill(80,196,32,1);
    rotate(stunde_1);
    ellipseMode(CENTER);
    ellipse(0,-50,50,50);
    popMatrix();  
}
  
 
  
