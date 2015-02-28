




int distX;
int distY;


float R;
float G;
float B;





 //.........................................................

void setup() {
  size (500, 500);

 //background ( R%255,G%250,B%255,1); 


  



  distX = 25;
  distY = 25;





  R = 0;
  G = 0;
  B = 0;

  
}

//...............................................3

void draw() {
  
  
  stroke(1);
  
  
  



  fill (R%0, G%0, B%255 ,1);
  rect (0, 0, 500, 500);


 
  fill (R%255, G%255, B%255 ,1);
  rect (0, 0, 500, 500);

    
   


stroke(R,G,B,10);
fill (200,10,10,10);

  triangle (25, 25, 225, 250, distX, 475);

  triangle (25, distY, 475, 25, 250, 225);

  triangle (275, 250, distX, 25, 475, 475);

  triangle (25, 475, 250, 275, 475, distY);
  
  
  
  
  

  
  
  stroke(0, 0, 0,250);
  line(250, 25, mouseX, mouseY);
  line(475, 250, mouseX, mouseY);
  line(250, 475, mouseX, mouseY);
  line(25, 250, mouseX, mouseY);
  
 

  
  distX = (mouseX);
  distY = (mouseY);





 
  R++; 
  G++;
  B++;

 
}












