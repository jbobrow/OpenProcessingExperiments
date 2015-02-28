
void setup()
{
  size(500,500);
  background(255);
  smooth();
}

void draw()
{
  //Triangle bleu
  noStroke();
  fill(91,195,241,75);
beginShape();
vertex(400,250);
vertex(400,375);
vertex(250,375);
vertex(400,250);
endShape(CLOSE);

//forme bleu centre
  noStroke();
  fill(91,195,241,155);
 beginShape();
vertex(125,125);
vertex(375,125);
vertex(350,250);
vertex(400,250);
vertex(250,375);
vertex(125,250);
endShape(CLOSE);

//forme verte réduite 50%
fill(234,234,45,255);
scale(0.5);
  beginShape();
vertex(125,125);
vertex(375,125);
vertex(350,250);
vertex(400,250);
vertex(250,375);
vertex(125,250);
endShape(CLOSE);


noLoop();  
}


