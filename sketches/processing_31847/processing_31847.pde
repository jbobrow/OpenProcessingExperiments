


int patternSeperationX = 100;  

int patternSeperationY = 100;  

   

   

void setup(){  

  size(500,500);  

     

  //the white box simply shows you the space your pattern gets drawn in  

  fill(255);  

  noStroke();  

  rect(0,0,patternSeperationX,patternSeperationY);  

  stroke(0);  

     

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

smooth();
noStroke();
fill(0);
rect(0, 0, 100,100 );

fill(0);
ellipseMode(CENTER);
ellipse(50, 50, 100, 100);

noStroke();
fill(255);
triangle(0, 50, 50, 0, 100, 50);
triangle(50, 100, 0, 50, 100, 50);
/*
noStroke();
fill(0);
ellipseMode(CENTER);
ellipse(50, 50, 70.5, 70.5);

fill(255);
triangle(14.5, 50, 50, 14.5, 86.5, 50);
triangle(14.5, 50, 50, 86.5, 86.5, 50);

fill(0);
ellipseMode(CENTER);
ellipse(50, 50, 50, 50);
*/
  
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


