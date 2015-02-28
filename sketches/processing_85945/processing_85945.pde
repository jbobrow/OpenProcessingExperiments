
void setup()
{
  background(#0D82BF);
size(500,500);


}




void draw ()

  

  //Nouvelle ligne
  {
         for (int posX = 42; posX < width; posX = posX+70)
         {
            fill(#C7E3D2);
          for (int posY = 42; posY < height; posY = posY+70)
         {
         
   
         strokeWeight(2);
       noFill();
         
         strokeWeight(1);
       stroke(255);
          ellipse(posX, posY, 100, 100);
           ellipse(posX, posY, 110, 110);
         fill(12, 12, 12); 
          ellipse (posX, posY, 65,65);
          ellipse (posX, posY, 75, 75);
          fill(0);
       ellipse (posX, posY, 5,5);
           fill(255);
        ellipse(posX, posY, 20, 20);
 
           ellipse(posX, posY, 20, 20);
        point(posX, posY);
    }
         }

noLoop ();
}


