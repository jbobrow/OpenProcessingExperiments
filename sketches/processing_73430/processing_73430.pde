
int size = 20;  
float distanceX = 0.0;  
float distanceY = 0.0;  
float distance = 0.0;  

void setup() {  
  size(400, 400);  
  background(255);  
  noFill();   
}  

void draw() {  
  //background(255);  
  stroke (250,mouseX,mouseY);  
  fill(0,90);
  rect(0,0,400,400);
  //strokeWeight( 1);
  int ilim = width;  
  int jlim = height;  

  int x = 0;  
  int y = 0; 
  
  int a = 0;  
  int b = 0; 
    

  for(int i = 0; i < ilim; i++)  
  {     
      for(int j = 0; j < jlim; j++)  
      {  
          x = i * size;  
          y = j * size;  
          // some math magic to find this square's distance from the mouse  

          // ...please feel free to ignore this...  
          /*distance = (x - mouseX) * (x - mouseX) + (y - mouseY) * (y - mouseY);  
          distance = sqrt(distance) / sqrt(width * width + height * height);  
          distance = 1.0 - distance;  
          distance = distance * distance * distance;  
          distance = distance * 255.;  
          */
          a = x + i;
          b = y + j;
          
          distance = (x - mouseX) * (x - mouseX) + (y - mouseY) * (y - mouseY);  

          distance = sqrt(distance) / sqrt(width * width + height * height);  

          distance =  1-distance ;  

          distance = distance * distance * distance;  

          distance = distance * 50.;  

          
          if(mouseX >= a+10) 
          {
            distanceX =  a+5+distance ;  
          }

          else if(mouseX < a+10 && mouseX >= a) {
            distanceX =  mouseX  ;  
          }

          else if(mouseX < a && mouseX > a - 10) {
            distanceX =  mouseX ;  
          }

          else if(mouseX <= a - 10) {
            distanceX = a - 5 - distance ;  
          }
          
          
          if(mouseY >= b+10) distanceY = b+5;  

          else if(mouseY < b+10 && mouseY >= b) distanceY = mouseY;  

          else if(mouseY < b && mouseY > b - 10) distanceY = mouseY;  

          else if(mouseY <= b - 10) distanceY = b - 5; 


        //  fill(distance);  
        
          line(a, b, distanceX , distanceY);  
      }  
  }      
} 


