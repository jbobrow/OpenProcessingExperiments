
int counter;

void setup() 
{  //setup function called initially, only once
  size(400, 400);
  background(255);  //set background white
  counter = 0;
}

void draw() 
{  //draw function loops 
    counter++;
    fill(random(255),100,255,50);
  
  if(mousePressed == true) 
  { 
        ellipse(mouseX, mouseY, 20, 20);
        if(counter > 400)
        {
            background(255);  //set background white
            counter = 0;
        }
  }
  else 
  {
      fill( 0, 598, 196 );
      line( mouseX, mouseY - 50 , 25, 25 );  
  }
  
}
