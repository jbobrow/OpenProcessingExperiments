
void setup()
{
  background(5);
size(400,400);


}




void draw()

  

  //Nouvelle ligne
  {
         for (int posX = 32; posX < width; posX = posX+50)
         {
            fill(#C7E3D2);
          for (int posY = 22; posY < height; posY = posY+50)
         {
         
   
         strokeWeight(2);
       noFill();
         
         strokeWeight(1);
       stroke(255);
          ellipse(posX, posY, 100, 100);
            fill(210, 10);
          ellipse(posX, posY, 70, 70);
          noFill();
          strokeWeight (1);
          stroke (#6EA8B2);
          ellipse (posX, posY, 120, 120);
          fill(230, 15);
          ellipse (posX, posY, 130, 130);

    }
         }

noLoop ();
}



