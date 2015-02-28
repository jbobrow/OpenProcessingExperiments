


void setup()
{
 size(1000,1000); 
background(200);
 stroke(5);

  
}


void draw()

{
  
  float x = mouseX;
float y = mouseY;
    
  line(x*2/2,y/2,x+10,y-5);

     line(x+40,y-5,x+25,y-20);


if (mousePressed == true) {
stroke(0);
  } else {
stroke(255);
  }
  line(x+40,y-5,x+25,y-20);
}

