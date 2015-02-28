
void setup()
{
  background(#C9B7E0);
size(500,500);


}




void draw ()

  

  //Nouvelle ligne
  {
         for (int posX = 40; posX < width; posX = posX+70)
         {
          for (int posY = 40; posY < height; posY = posY+70)
         {
           noFill();
         ellipse(posX, posY, 30, 30);
          fill(250, 20);
         strokeWeight(0);
         ellipse(posX, posY, 40, 40);
         noFill();
           ellipse(posX, posY, 90, 90);
         ellipse(posX, posY, 60, 60);
         fill(210, 10);
          ellipse(posX, posY, 120, 120);
         fill(250, 20);
       ellipse(posX, posY, 10, 10);
       fill(240, 50);
       ellipse (posX, posY, 5,5);
       fill(120,50);
        ellipse (posX, posY, 25,25);
        point(posX, posY);
    }
         }


}


