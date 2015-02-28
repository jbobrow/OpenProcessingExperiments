

///////////////////////////////////////////////  

/// Written by Kimberlee Botha, 6th March 2011 ///  

///////////////////////////////////////////////  

   

   

//what happens if you change these both to 50? what are they doing to the pattern?  

int patternSeperationX = 100;  

int patternSeperationY = 100;  

   

   

void setup(){  

  size(500,500);  
  color(200,300,10);
ellipseMode(ROUND);





 

     

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

for(int i = 0; i < 100; i=i+20){



fill(2,100,300);
rect(0,0,20,20);
fill(10);
rect(20,0,20,20);
fill(2,100,300);
rect(40,0,20,20);

fill(2,100,300);
rect(80,0,20,20);
fill(2,100,300);
rect(0,20,20,20);
rect(0,40,20,20);
fill(10);
rect(0,60,20,20);

rect(0,80,20,20);
fill(10);
rect(20,20,20,20);
fill(2,100,300);
rect(40,20,20,20);
rect(60,20,20,20);
fill(10);
rect(80,20,20,20);
fill(2,100,300);
rect(20,40,20,20);
fill(10);
rect(40,40,20,20);
fill(10);
rect(60,0,20,20);
fill(2,100,300);

rect(60,40,20,20);
fill(10);
rect(80,40,20,20);
fill(2,100,300);
rect(20,60,20,20);
fill(10);
rect(40,60,20,20);
fill(2,100,300);
rect(60,60,20,20);
rect(80,60,20,20);
rect(20,80,20,20);
rect(40,80,20,20);
fill(10);
rect(60,80,20,20);
fill(2,100,300);
rect(80,80,20,20);
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

