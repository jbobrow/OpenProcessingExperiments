
size(390, 560);
float rfactor = 0.001;
stroke(20);
for(int r = 0; r < 22; r++)
{
  for(int c = 0; c < 12; c++)
  {
    pushMatrix();
    noFill();
    translate(c*21+68, r*21+50);
    rotate(random(-rfactor,rfactor));
    rect(0, 0, 21, 21);
    popMatrix();
  }
  rfactor+=0.06;
}



