
void setup ()
{
   size (1000, 500);
   background(255);  
   smooth(); 

   
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


  float r = map(mouseY, 10,height,255,0);
  stroke(random(255),0,r,random(10,255));  
  strokeWeight(random(50,10));
  
 quad(pmouseX,pmouseY,mouseX,mouseY,pmouseX,pmouseY,mouseX,mouseY);  
 
 fill(random(255));
 
 stroke(random(255),0,r,255);
 ellipse(pmouseX,pmouseY,10,10);
}




