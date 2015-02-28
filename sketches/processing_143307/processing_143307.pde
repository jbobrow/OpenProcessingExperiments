

//konkuk university
 //JANG jin seon
 //201420105

int patternSeperationX = 50;  

 int patternSeperationY = 55;  

  
void setup(){  

  size(500,500);  

  smooth();  

  background(0,0,0);  

     

  //the white box simply shows you the space your pattern gets drawn in  

  fill(0,0,0);  

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


  stroke(0,0,0);  

  fill(255,0,100);  

  triangle(0, 50, 25, 0, 50, 50);  

   stroke(255,255,255);  

  fill(0,0,0);  

  triangle(5, 45, 25, 5, 45, 45);  

  stroke(0,0,0);  

  fill(255,255,255);  

  triangle(10, 40, 25, 10, 40, 40);  

  stroke(0,0,0);  

  fill(0,255,100);  

  triangle(37.5,25,50,0,62.5,25);  

  stroke(0,0,0);  

  fill(0,0,0);  

  ellipse(25, 25, 25, 25);  

  stroke(0,0,0);  

  fill(255,255,255);  

  ellipse(25, 25, 10, 10);  

  stroke(255,255,255);  

  fill(0,0,0);  

  ellipse(25, 25, 15, 15);  
}  

   

void keyPressed()  


{  

  if(key == 's' || key == 'S')  

  {  

    {  


    }  

  }  

} 

