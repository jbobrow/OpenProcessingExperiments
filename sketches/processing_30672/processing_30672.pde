
void setup ()
{
   size (400, 400);
   background(255);  
   smooth(); 

   fill(25,100,10);    
 ellipse (width/2, height/2, 80,80);    
 ellipse (width/1.5, height/1.5, 80,80);    
 ellipse (width/1.7, height/1.7, 80,80);    
 ellipse (width/3, height/3, 80,80);
  ellipse (width/5.5, height/5.5, 80,80);    
 ellipse (width/4, height/4, 80,80);  
 ellipse (width/1, height/90, 80,80);    
  ellipse (width/90, height/90, 80,80);   
  

}

void draw ()
{
   if(keyPressed) {
        if (key == ' ')
        {    
         saveFrame("line-####.jpg");
         background(255);         
        }
}

  float r = map(mouseY, 0,height,255,140);
  stroke(r,20,22);  
  
  line(pmouseX,pmouseY,mouseX,mouseY);  
   
}

          
                
