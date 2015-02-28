

float colour = 255;

int transparency = 80;

int maxDistance= 150;

//--------------------------------------------------SETUP


void setup(){

  size(600, 600, P3D);
}

//--------------------------------------------------DRAW LOOP


void draw() {
  

  background(255);


  smooth();

  
  noFill();

  stroke (colour); 

  stroke(1);
  
    for (int gridY=0; gridY<height; gridY=gridY+15)  {
       
    
    for (int gridX=0; gridX<width; gridX=gridX+15)  {
      
    
float diameter;

    
    PVector mousePos;
    
   mousePos = new PVector(mouseX,mouseY);
 
   
    PVector shapePos; 
    
    shapePos = new PVector(gridX, gridY);

    
   diameter = dist(mousePos.x,mousePos.y,shapePos.x,shapePos.y);

    
    

    
    diameter = diameter*40/maxDistance;

   
    pushMatrix();

   
    translate(gridX, gridY,0);

   
    rect (0,0,diameter, diameter);
    
    popMatrix();

  
    }

    }

}





