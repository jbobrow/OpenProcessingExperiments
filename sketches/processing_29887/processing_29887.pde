
void setup ()
{
   size (500, 500);
   background(0);  
   smooth(); 

   
}


void draw ()
{
   if(keyPressed) {
        if (key == ' ')
        {    
         saveFrame("line-####.jpg");
         background(0);         
        }
}


  float r = map(mouseX, 10,height,mouseY,0);
  stroke(random(255),random(255),r,random(10,255));  
  strokeWeight(random(10,10));
  quad(pmouseY,pmouseY,mouseY,mouseX,pmouseY,pmouseY,mouseY,mouseY);  
 

 ellipse(pmouseX,pmouseY,10,10);
}




