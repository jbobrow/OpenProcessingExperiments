

void setup()
{
  size(500, 500);
  background(#01908D);
  smooth();
  noStroke();
  fill(#FFDC12);
}

void draw()
{ 
  for (int posx=35; posx<= 470; posx= posx+40)
    for (int posy=35; posy<= 470; posy=posy+40)   
      rect(posx, posy, 10, 10);


  fill(#FCC9E7,180);
for (int posx=40; posx<= 450; posx= posx+40)
    for (int posy=40; posy<= 450; posy=posy+40)   
      rect(posx, posy, 10, 10);
noFill();


  noLoop();
}



