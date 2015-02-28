
void setup()
{
  background(#0D82BF);
size(500,500);


}




void draw ()

  

  //Nouvelle ligne
  {
         for (int posX = 50; posX < width; posX = posX+70)
         {
            fill(#C7E3D2);
          for (int posY = 50; posY < height; posY = posY+70)
         {
         
   
         strokeWeight(2);
          fill(#C7E3D2);
        ellipse(posX, posY, 50, 50);
       noFill();
         
         strokeWeight(1);
     
         rect(posX, posY, 100, 110);
        rect(posX, posY, 150, 150);
          ellipse(posX, posY, 100, 100); 
          ellipse (posX, posY, 65,65);
           ellipse (posX, posY, 15,15);
       ellipse (posX, posY, 5,5);
  
      ellipse (posX, posY, 25,25);
         rect(posX, posY, 8,8);
       fill(#C7E3D2);
        ellipse (posX, posY, 25,25);
        point(posX, posY);
    }
         }

noLoop ();
}


