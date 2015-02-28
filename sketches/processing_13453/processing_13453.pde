
void setup ()
{
  size (640,480);
  smooth();
  
}

void draw()

{
  background (255);
 
 stroke(0);
strokeWeight(5); 
  rect(200,200,100,50);
  rect(350,200,100,50);
  
  noStroke();
  
   if (mouseX <= 200)
  {fill(0);
  ellipse(225+ mouseX/3.8,225,50,50);
  ellipse(375+ mouseX/3.8,225,50,50);
  }
 else if (mouseX >200)
 {fill(0);
 ellipse(270,225,50,50);
 ellipse(425,225,50,50);
 }
 

  
  
   if (mousePressed == true)
   {fill(255);
  ellipse(225+ mouseX/3.8,225,25,25);
  ellipse(375+ mouseX/3.8,225,25,25);
  }
 else if (mouseX >200)
 {fill(255);
 ellipse(270,225,25,25);
 ellipse(425,225,25,25);
 }
  
    if (mouseY <= 300);
    {
      fill (200,0,0);
      rect(200,mouseY,100,50);
    }
    
         if (mouseY <= 300);
    {
      fill (200,0,0);
      rect(350,mouseY,100,50);
    }
 

 
  if (mouseY > 200)
  {fill (200,0,0,200);
  rect (200,200,100,50);
  }
  
  

 
  if (mouseY > 200)
  {fill (200,0,0,200);
  rect (350,200,100,50);
  }
//  if (mouseY > 200)
// 
//    
//    {fill (255,0,0,200);
//    rect (200,(mouseY), 100, 50);
//    }
//    
//    
//    



 
    if (mouseY >= 250);
    {
      fill(255);
      rect(200,250,width,500);
    }
     fill (255);
rect (0,0,width,200); 
  
}

