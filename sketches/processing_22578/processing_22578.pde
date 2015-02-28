

int patternSeperationX = 100;  

int patternSeperationY = 100;  

   

   

void setup(){  
size(500,500); 
fill(200,300,10);
   
rectMode(ROUND);

  



 

     

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

fill(50,150,30);
ellipse(100, 50, 55, 55);
fill(20,100,200);
rect(i,i,20,20);
fill(200,10,50);
arc(40,i,i, 50, 10, 100);
fill(300,10,20);



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

                
                
