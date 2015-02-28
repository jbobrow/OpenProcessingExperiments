
///////////////////////////////////////////////  

/// Written by Ben Jack, 14th February 2011 ///  

///////////////////////////////////////////////  

   

   

//what happens if you change these both to 50? what are they doing to the pattern?  

int patternSeperationX = 50;  

int patternSeperationY = 50;  

   

   

void setup(){  

  size(500,500);  

     

  //the white box simply shows you the space your pattern gets drawn in  

  //fill(255);  

  fill(255);  

  noStroke();  

 rect(0,0,500,500);  

  stroke(0);  

     

     

     

  for(int i = 0; i < width/patternSeperationX+50; i++){  

      for(int j = 0; j < height/patternSeperationY+50; j++){  

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

     

 // line(0,0,50,50);  

//  line(0,50,50,0);  

  float col1 = random (256);  

  float col2 = random (256);  

  float col3 = random (256);  

     

     

    

  fill(col1,col2,col3);  

  //noStroke();  

  //stroke(225);  

  //triangle(0,0,50,50,0,50);  

  //triangle(50,50,50,0,100,0);  

  //triangle (50,50,100,50,100,100);  

  //triangle(50,50,50,100,0,100);  

     

  triangle(0,0,-50,0,-50,-50);  

  triangle(0,0,0,-50,50,-50);  

  triangle(0,0,50,0,50,50);  

  triangle(0,0,0,50,-50,50);  

  smooth();  

    

  //stroke(0);  

     

}  

 void mouseReleased() {
    for(int i = 0; i < width/patternSeperationX+50; i++){  

      for(int j = 0; j < height/patternSeperationY+50; j++){  

        pushMatrix();  

        translate(i*patternSeperationX, j*patternSeperationY);  

        yourFunction();  

        popMatrix();
  }
    }
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


