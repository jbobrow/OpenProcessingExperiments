
PImage myImage;
PImage myImage2;
boolean filterApplied = true;
void setup() 


{
 size (600, 600);
 myImage = loadImage("merob.jpg");
  myImage2 = loadImage("merob2.jpg");
   
}

void draw ()
 
 
{
  
  
  if (myImage.width > 0)
    {
     image(myImage, 0, 0, width, height);
       
      if (filterApplied == false)
     {
      myImage.filter(INVERT);
      filterApplied =  true;
     }
      
    }
   fill(#C5C1F5);
    quad(289,0,600,0,600,0,0,0);
     
     
    stroke(#FFFFFF);
    strokeWeight(3);
    fill(#C5C1F5);
     
     
    
    
     
     for (int i = 0; i < 0; i = i + 50)
   
     

   
   
    
    
       
      
     
      
    
 
    
      
      
     
         
     
     
   
{

 line(289, i, 600, i); 
    
}


   

  
  



 


 
 if (mouseX > 325)
{
   noTint();
   image(myImage2, 0, 0, width, height);
    myImage2.filter(INVERT);
    
}
}




