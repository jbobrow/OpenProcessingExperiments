
class Munster
{
    void moveMe ()
    {
     //   translate(mouseX+random(50),mouseY+random(50));// bewegen, animieren, ...
   translate(mouseX,mouseY);  
  
}

    void drawMe ()
    {
        // kopf(200,300); 
  //background(random(255),random(255),random(255));
    
     strokeWeight(40);
      ellipse( 0,0, 200, 200 ); 
   
  beine();
 
    int position =mouseX;
   /* if (position/10 < 0)
    {
     position= -position; 
    }// malen!*/
    }
}


