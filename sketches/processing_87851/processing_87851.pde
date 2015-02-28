
//NESTED FOR LOOPS
//with IF STATEMENTS
 
size(500, 500);

noStroke();
background(255);

for (int x = 30; x< width-20; x+=100)
{
  for (int y = 100; y<height-20; y+=20)
  {
 
    if (x<=width/2) {
      fill(42,187,255,5);
      beginShape();
      vertex (106,y+20);
      vertex (181,x+10);
      vertex (194,130);
      vertex(271,122);
      vertex (298,273);
      endShape();
    }
    else {
      fill(255,222,42,15);
      strokeWeight(1);
      stroke(255);
      beginShape();
      vertex (x+106,116);
      vertex (181,62);
      vertex (194,130);
      vertex(271,122);
      vertex (298,273);
      endShape();
    }
  }
}



