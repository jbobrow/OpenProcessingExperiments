
void setup()
{
  size(500,500);
  background(0);
  noStroke();
  smooth();
}

int wid = 30;
int hei = 30;

void draw()
{
    background(0);
  for (int r = 0; r<20; r++)
  {
    for(int c = 0; c<20; c++)
    {
      
      fill(0);
      //rect(r*20, c*20, 20, 20);
        pushMatrix();
        fill(255);
        rectMode(CENTER);
        translate(r*wid, c*wid);
        float squareX = abs(mouseX - r*wid)/11;
        float squareY = abs(mouseY - c*wid)/11;
        float dim = (((squareX*squareX)+(squareY*squareY))*0.5)/4;
        rotate(PI/4);
        rect(0, 0, dim, dim);
        popMatrix();
      /*
       beginShape();
       vertex(r2*wid+wid/2, c2*hei);
       vertex(r2*wid+wid, c2*hei+hei/2);
       vertex(r2*wid+wid/2, c2*wid+wid);
       vertex(r2*wid, c2*wid+wid/2);
       endShape();*/
    }
  }
}               
