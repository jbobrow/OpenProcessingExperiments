
//what happens if you change these both to 50? what are they doing to the pattern?  

int patternSeperationX = 100;  

int patternSeperationY = 10;  

    

    

void setup(){  

  size(500,500);  

      

  //the white box simply shows you the space your pattern gets drawn in  

  fill(225);  

  noStroke();  

  //rect(0,0,patternSeperationX,patternSeperationY);  

  stroke(0);  

  smooth();  

      

  for(int i = 0; i < width/patternSeperationX+1; i++){  

      for(int j = 0; j < height/patternSeperationY+1; j++){  

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

      

      

   fill(1, 1);  

   stroke(5);  

   

int x = 1;  

   

while(x<110){  

for(int b = 0; b<100; b=b+90){  

  triangle(0, b, 0, b+100, 100, x);  

}  

x=x+50;  

   

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

