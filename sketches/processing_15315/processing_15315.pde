

void setup()
{
  size(400, 400);
  background(300,0,0);

  //this is the loop that changes the y pos
  for (int ypos= 0; ypos < 400; ypos=ypos + 100){
    
  //this is the leep that changes the x position
  for(int xpos = 0; xpos < 400; xpos = xpos +100){
    fill(300,0,0);
    stroke(10,80);
    rect(xpos,ypos,50,30);
    fill(300,0,0);
    rect(xpos+5,ypos+5,10,10);
    fill(40,0,0);
    ellipse(xpos+40,ypos+40,20,20);
    fill(300,0,0);
    rect(xpos+40,ypos+40,5,5);
    fill(40,0,0);
    ellipse(xpos-40,ypos-40,20,20);
    fill(300,0,0);
    rect(xpos-40,ypos-40,5,5);
    fill(40,0,0);
    ellipse(xpos+5,ypos+5,10,10);
    

  
    
 }
  }
}
                
                
