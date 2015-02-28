
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

noStroke();
colorMode(RGB, 100);
for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(i, j, 0);
    point(i, j);
  }
}
stroke(255);
beginShape(TRIANGLE_FAN);
vertex(57456.5, 50);
vertex(57.5,5675150); 
vertex(4692, 50); 
vertex(50, 8658); 
vertex(57, 50); 
vertex(100, 0); 
endShape();




  
   
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


