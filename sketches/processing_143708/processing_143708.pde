
void setup()
{
  size(500, 500);
  background(255);
  smooth();
}
void draw()
{
  background(255);
  noStroke();
  fill(200);
  quad(100, 200, 500, 200, 500, 500, 0, 300);
  rect(0, 300, 500, 500);
  

  //Glas wird im Stundentakt gefüllt
  translate(40, 300);
  for (int i=0; i<=hour()*4; i+=1)
  {
    pushMatrix();
    stroke(130, 100, 0);
    fill(220, 200, 0);
    ellipse(225, i*(-1), 150, 50);
    popMatrix();
    if (mousePressed == true)
    {
      i = mouseX;
    }
  }//Hinteres Glas
  stroke(0);
  noFill();
  line(150, -200, 150, 0);
  line(300, -200, 300, 0);
  ellipse(225, -200, 150, 50);
  arc(225, 0, 150, 50, PI, 0);
  stroke(0, 50);
  arc(225, 0, 150, 50, -PI, 0);
  
  translate(0, 100);
  //Glas wird im Sekundentakt gefüllt
  for (int i=0; i<=second()*4; i+=1)
  {
    pushMatrix();
    stroke(140, 60, 0);
    fill(255, 125, 0);
    ellipse(125, i*(-1), 150, 50);
    popMatrix();
    if (mousePressed == true)
    {
      i = mouseX;
    }
  }
  //Glas wird im Minutentakt gefüllt
  for (int i=0; i<=minute()*4; i+=1)
  {
    pushMatrix();
    stroke(130, 20, 0);
    fill(200, 20, 0);
    ellipse(325, i*(-1), 150, 50);
    popMatrix();
    if (mousePressed == true)
    {
      i = mouseX;
    }
  }
  translate(0, -300);

  //Linkes Glas
  stroke(0);
  noFill();
  line(50, 50, 50, 300);
  line(200, 50, 200, 300);
  ellipse(125, 50, 150, 50);
  arc(125, 300, 150, 50, PI, 0);
  stroke(0, 50);
  arc(125, 300, 150, 50, -PI, 0);

  //Rechtes Glas
  stroke(0);
  noFill();
  line(250, 50, 250, 300);
  line(400, 50, 400, 300);
  ellipse(325, 50, 150, 50);
  arc(325, 300, 150, 50, PI, 0);
  stroke(0, 50);
  arc(325, 300, 150, 50, -PI, 0);
  
  
}

