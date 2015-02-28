
// Caroline: voir variations à l'interieur de boucles imbriquées pour articuler params à souris

void setup()
{
  size(300, 300); 
  background(5, 5, 5); 
  smooth();
}



float R;
float V;
float B;

void draw() 
{
  
 R=98;
 V=198;
 B=197;
 
  for (int posX = 25; posX<width; posX = posX+50)
  {

    for (int posY = 25; posY<height; posY = posY+50)
    {
        // fill(98, 198, 197);

 
 fill(R, V, B); 

      ellipse(posX, posY, 50, 50);
      ellipse(posX, posY, 40, 40);
      ellipse(posX, posY, 30, 30);
      ellipse(posX, posY, 20, 20);
     
      color rouge = color(211, 21, 25); 
      fill(rouge); 
      ellipse(posX, posY, 20, 10);     
      line(posX, posY, posX+10, posY+10);
      line(posX, posY, posX-10, posY-10);
    }
  }
 // noLoop();
}


