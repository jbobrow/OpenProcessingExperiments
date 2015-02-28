
size(768, 768);

 background(255);
  for (int i=1; i<4000; i++)
  {
     
    float posX1 = random(180, width-180);
    float posY1 = random(180, height-180);
    float posX2 = random(180, width-180);
    float posY2 = random(180, width-180);
    stroke(0);
    line(posX1, posY1, posX2, posY2);
  }


