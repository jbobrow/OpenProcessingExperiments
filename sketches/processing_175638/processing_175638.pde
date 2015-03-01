
void setup()
{
  size(500,500);
}

void draw()
{
  background(0);
  
  translate(250,250);
  
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

    fill(255,0,0);
    text("feuer",radius,0,0); 
    fill(255,128,0);
  text("feuer",radius2,0,0);
    fill(255,205,0);
    text("feuer",radius3,0,0);
    fill(255,247,0);
    text("feuer",radius4,0,0);
    fill(252,255,113);
    text("feuer",radius5,0,0);
    
    popMatrix();
  }
}
