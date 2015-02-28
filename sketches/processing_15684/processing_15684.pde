
int ypos = 200;

void setup()
{
  size(400, 400);
  background(0);

  for(int xpos = 100; xpos < width; xpos = xpos + 100){
    noStroke();

    //draw a random colores circel for the face
    fill(random(25),random(255),random(255));
    ellipse(xpos,ypos,100,250);

    //draw the eyes
    stroke(0);
    fill(0);
    ellipse(xpos-10, ypos, 10, 3);
    ellipse(xpos+10, ypos, 3, 50);

    //draw the mouth
    line(xpos-10, ypos+15, xpos, ypos+17);
    line(xpos, ypos+17, xpos+10, ypos+15);
  }
}

