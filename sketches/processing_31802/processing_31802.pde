
///////////////////////////////////////////////  

/// Written by Ben Jack, 14th February 2011 ///  

///////////////////////////////////////////////  

   

   

//what happens if you change these both to 50? what are they doing to the pattern?  

int patternSeperationX = 100;  

int patternSeperationY = 100;  

   

   

void setup(){  

  size(500,500);  
  background(200, 204, 0);

     

  //the white box simply shows you the space your pattern gets drawn in  

  fill(255);  



  rect(0,0,patternSeperationX,patternSeperationY);  

  stroke(255);  

     

  for(int i = 0; i < width/patternSeperationX; i++){  

      for(int j = 0; j < height/patternSeperationY; j++){  

        pushMatrix();  

        translate(i*patternSeperationX, j*patternSeperationY);  

        yourFunction();  

        popMatrix();  

      }  

  }  

     

}  

   


   

void draw()  

{  

  //This is here so the program keeps running and the screengrab will work  

}  

   

   

void yourFunction(){  

     

  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------  

  //try making pleasant designs :-)  

     

  //line(10,100,50,50);  

  //line(80,50,50,80);  
  
  //line(500,50,50,80);  
// Click within the image to change 
// the value of the rectangle



ellipse(56, 46, 200, 200);
 
fill(212, 255, 184);

ellipse(66, 56, 200, 200);

fill(203, 123, 255);

ellipse(76, 66, 200, 200);

fill(232, 136, 100);

ellipse(86, 76, 200, 200);

fill(255, 242, 110);

ellipse(96, 86, 200, 200);

fill(153, 218, 232);

ellipse(106, 96, 200, 200);

fill(203, 123, 255);

ellipse(116, 106, 200, 200);

fill(232, 136, 100);

ellipse(126, 116, 200, 200);

fill(255, 242, 110);

ellipse(136, 126, 200, 200);

fill(153, 218, 232);

ellipse(146, 136, 200, 200);
 
fill(212, 255, 184);

ellipse(156, 146, 200, 200);

fill(203, 123, 255);

ellipse(166, 156, 200, 200);

fill(232, 136, 100);

 

  

     

}  

   

void keyPressed()  

//Takes PNG screenshots when you push S  

//Careful - doesn't prompt when overwriting files!  

{  

  if(key == 's' || key == 'S')  

  {  

    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser  

    if(filePath != null)  

    {  

      save(filePath + ".png");  

    }  

  }  

} 


