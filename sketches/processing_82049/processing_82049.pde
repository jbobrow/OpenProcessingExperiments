
void setup()
{
  background(5);
size(400,400);


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
         
         noStroke();
         strokeWeight(1);
          ellipse(posX, posY, 100, 100);
          stroke(#2D5F67);
           ellipse(posX, posY, 150, 150);
           stroke(#899698);
           ellipse(posX, posY, 300, 300);
            strokeWeight (2);
          ellipse(posX, posY, 50, 50);
          ellipse(posX, posY, 70, 70);
  
    }
         }

noLoop ();
}



