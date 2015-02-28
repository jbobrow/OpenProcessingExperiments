
void setup()
{
  background(#62CE8E);
size(500,500);


}




void draw ()

  

  //Nouvelle ligne
  {
         for (int posX = 50; posX < width; posX = posX+70)
         {
          for (int posY = 50; posY < height; posY = posY+70)
         {
           noFill();
         ellipse(posX, posY, 40, 40);
         strokeWeight(1);
         ellipse(posX, posY, 40, 40);
         noFill();
           ellipse(posX, posY, 90, 90);
           fill(250, 20);
         ellipse(posX, posY, 60, 60);
          ellipse(posX, posY, 100, 100);
          ellipse(posX, posY, 120, 120);
         fill(210, 20);
         strokeWeight(1);
       ellipse(posX, posY, 100, 110);
     
       ellipse (posX, posY, 5,5);
       fill(#C7E3D2);
        ellipse (posX, posY, 25,25);
        point(posX, posY);
    }
         }

noLoop ();
}


