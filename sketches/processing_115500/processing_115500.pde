
color brushColor = color(0);
float angle = 0;
float s = 1;
float r = 0;

 
void setup() {  // this is run once.  
    size(500, 500);
    background(255);
    smooth();
}
 
void draw()
   {  
    if (mousePressed) 
    
    {
     
     
      if (mouseButton == LEFT) 
      {
        noStroke();
        fill(red(brushColor), green(brushColor), blue(brushColor));
         pushMatrix();
        noStroke();
        translate(mouseX,mouseY);
        rotate(r);
        scale(s);
        triangle(0,-15, 15, 15, -15,15);
        popMatrix();

      }
       
   
      if (mouseButton == RIGHT) {
        brushColor = get(mouseX, mouseY);
      }
      
      if ( key == UP)
       {
         s = 1.01*s;
       if(s<0)
         {
            s = -s;
         }
       }

    }
     
    
    for (int angle = 0; angle < 360; angle = angle + 1) {
      colorMode(HSB, 360, 100, 100, 100);
      pushMatrix();
      translate(30, 30);
      rotate(radians(angle));
      stroke(angle, 100, 100, 100);
      line(0, 0, 30, 0);
      popMatrix();
       
    }
    
    colorMode(RGB); 
}



