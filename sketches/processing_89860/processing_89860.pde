
int xpos = width/2, ypos = height/2;
  int speed = 2;
  int direction = 1;
  int SIZE = 50;

void setup()
{
  size(200, 200);
  background(255); 
}

  void draw()
  {
  
        xpos = xpos + (speed * direction);
  
 if(xpos> width - SIZE || xpos < 0)
 {
   direction *= -1;
 }
 background(255);
    fill(200, 0, 0);
    rect(xpos+20, 30, 20, 40);
    fill(0, 200, 0);
    rect(xpos+10, 35, 20, 40);
    fill(0, 0, 200);
    ellipse(xpos+25, 35, 20, 20);
    
    }

  



  //if((mouseX < 90 || mouseX > 110) && (mouseY<90 ||mouseY>110))
