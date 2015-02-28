


int ypos = 200;

void setup()
{
  



  background(193,234,97);
   size(400,400);

  //this is the loop that changes the ypos
  for (int ypos = 0; ypos < 400; ypos = ypos + 75){
    
    //this is the loop that changes the xpos
    for(int xpos = 0; xpos <400; xpos = xpos + 75){
    
 
   rect(xpos,ypos,4,130);
    fill(20,79,129,150);
    ellipse(xpos-30,ypos+10,85,85);
    fill(71,147,18);
    rect(xpos,ypos,50,15);
    fill(148,222,22);
     rect(xpos,ypos,30,30);
    fill(65,175,201,200);
    ellipse(xpos-30,ypos+10,10,70);
    fill(141,240,90,130);
   
    
  
    }

  }

}

