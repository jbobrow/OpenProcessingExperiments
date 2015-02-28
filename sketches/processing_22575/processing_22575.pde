

   

   

//what happens if you change these both to 50? what are they doing to the pattern?  

int patternSeperationX = 100;  

int patternSeperationY = 100;  

   

   

void setup(){  
 size(500,500);
color(200,300,10);
   


  



 

     

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

for(int i = 0; i < 100; i=i+10){

fill(2,300,15);
ellipse(i, 50, 55, 55);
fill(125);
rect(i,i,20,20);
fill(100,50,120);
arc(i,i,i, 50, 10, 100);




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

                
