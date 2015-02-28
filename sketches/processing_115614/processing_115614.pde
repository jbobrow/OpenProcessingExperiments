
void setup()
{
  size(400,400);
  background(255);
  //stroke(0);
  //strokeWeight(2);
  smooth();
  noStroke();

}

void draw()
{
  
  translate(mouseX-200, mouseY-230);
  background(255);
  
  //COS
  fill(244,144,148);
  ellipse(200,230,100,100);
  fill(255,170,171);
  ellipse(200, 200, 75, 75);

  //ORELLES
  ellipse(170,170,20,20);
  ellipse(231,170,20,20);
  
  //NAS
  fill(244,144,148);
  ellipse(200,215,30,20);

  //ULLS
  fill(255);
  ellipse(185,190,20,20);
  ellipse(215,190,20,20);

  fill(0);
  //negre ulls
  ellipse(185,190,5,5);
  ellipse(215,190,5,5);
  //negre nas
  ellipse(195,215,5,5);
  ellipse(205,215,5,5);

  //peus
  fill(64,27,27);
  ellipse(185,280,25,10);
  ellipse(215,280,25,10);

  //mans
  fill(255,170,171);
  ellipse(150,230,20,20);
  ellipse(250,230,20,20);

  //corbata
  //fill(221,55,64);
  //line(200,242,190,255);
  //line(200,242,210,255);
  //line(190,255,200,267);
  //line(210,255,200,267);
  //ellipse(200,242,15,15);


}
