


void setup()
{
  size(600,600);
}

void draw()
{
  background(0,0,0);
  fill(#FA7C1C);
  noStroke();
  //ellipse(random(600),random(600),random(50),random(50));
  
  strokeWeight(6);
  stroke(#552907);
  line(200,190,200,460);
  line(200,190,430,230);
  line(430,230,200,460);
  
  noStroke();
  fill(#1EFA78);
  triangle(500,200,580,400,200,500);
  triangle(10,50,485,200,67,150);
  
  noStroke();
  rect(350,400,150,150);
  
  noStroke();
  fill(#363BFF);
  rect(515,430,150,150);
  rect(55,380,125,125);
  triangle(20,375,10,580,200,570);
  triangle(20,30,380,96,400,155);
  arc(500,500,70,70,0,PI);
  
  
  noStroke();
  fill(#FCED3B);
  rect(210,515,120,120);
  rect(425,10,140,140);
  triangle(20,10,500,10,500,100);
  triangle(220,210,220,420,410,240);
  arc(480,140,100,100,0,PI/2);
  
  noStroke();
  fill(#FF2121);
  rect(10,185,170,170);
  triangle(515,200,640,100,590,400);
  ellipse(435,223,50,50);
  arc(140,130,125,125,PI/2,PI);
  


}


