
void setup()
{
  size(389,410) ;
  background(255,255,255);
  
  //rectangles
  
  fill(245,201,42);
  noStroke();
  rect(0,0,50,100);
  
  fill(74,114,178);
  noStroke();
  rect(50,358,102,16);
  
  fill(209,35,30);
  noStroke();
  rect(230,275,75,80);
  
  fill(209,35,30);
  noStroke();
  rect(370,360,110,16);
  
  //vertical lines

  strokeWeight(10) ;
  stroke(0,0,0);
  line(50,0,50,410) ;
  line(100,0,100,410) ;
   
  strokeWeight(8);
  line(130,0,130,410);
  line(150,0,150,410);
  
  strokeWeight(10);
  line(230,0,230,410);
  
  strokeWeight(8);
  line(300,0,300,410);
  line(325,0,325,410);
  line(373,0,373,410);
  
  //horizontal lines
  strokeWeight(10);
  line(0,97,389,97);
  line(0,155,389,155);
  
  strokeWeight(9);
  line(0,208,389,208);
  line(0,275,389,275);
  line(230,350,320,350);
  strokeWeight(7);
  line(230,400,320,400);
}


