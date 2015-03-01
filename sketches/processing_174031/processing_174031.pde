
void setup()
{
  size(500,500);
}

void draw()
{
  background(0);
  
  translate(250,250);
  
  rectMode(CENTER);
  
  for (int i=0; i<360;i+=20)
  {
    pushMatrix();
    noStroke();
    rotate(radians(i));
    
    float radius0 = 140+sin(millis()/100.0+i)*10;
    float radius = 100+sin(millis()/100.0+i)*10;
    float radius2 = 80+sin(millis()/100.0+i)*10;
    float radius3 = 60+sin(millis()/100.0+i)*10;
    float radius4 = 40+sin(millis()/100.0+i)*10;
    float radius5 = 20+sin(millis()/100.0+i)*10;
    
    //line(0,0,radius,0);
    fill(255,0,0);
    ellipse(radius,0,8,8); 
    fill(255,128,0);
    ellipse(radius2,0,10,10);
    fill(255,205,0);
    ellipse(radius3,0,8,8);
    fill(255,247,0);
    ellipse(radius4,0,10,10);
    fill(252,255,113);
    ellipse(radius5,0,8,8);
    
    //fill(147,147,147);
    //ellipse(radius0, 0, 10,10);

    popMatrix();
  }
}
