
/*

*/
int stepX;
int stepY;

void setup(){
  size(800, 400);
  background(0);
}


void draw(){
  
   colorMode(HSB, width, height, 100);
 //  colorMode(HSB, 360, 200, 150);

  stepX = mouseX+20;
  stepY = mouseY+20;
  for (int gridY=0; gridY<height; gridY+=stepY){
    for (int gridX=0; gridX<width; gridX+=stepX){
      noStroke();
      fill(gridX, height-gridY, 100);
      if (mouseX < width/2)
          {if (mouseY < height/2)
            rect(gridX, gridY, stepX, stepY);
         else 
             rect(gridX, gridY, stepX/2, stepY/2);}
       if (mouseX >= width/2)
           {if (mouseY < height/2)
              ellipse(gridX, gridY, stepX/4, stepY/4);
          else
              ellipse(gridX, gridY, stepY, stepY);}
       }
  }
}

