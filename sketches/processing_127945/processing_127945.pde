
void setup()
{
  size (400, 400);
  background (#FFFFFF);
   
  strokeWeight(5);
  stroke(0, 0, 256);
  line(280, 20, 390, 20);
  line(10, 395, 50, 395);
   
  noStroke(); //gets rid of outline
  fill(#98A0EA); 
  rect(260, 40, 20, 90);
  rect(285, 40, 20, 90);
  rect(310, 40, 20, 90);
  rect(335, 40, 20, 90);
  rect(360, 40, 20, 90);
  rect(385, 40, 20, 90);
  rect(230, 260, 110, 20);
  
  quad(140, 125, 155, 85, 205, 85, 190, 125);
  quad(150, 175, 165, 135, 215, 135, 200, 175);
  fill(#BC1515);
  quad(160, 125, 175, 85, 225, 85, 210, 125);
  quad(150, 175, 157, 155, 207, 155, 200, 175);
  
  fill(#BC1515);
  arc(5, 10, 50, 50, 0, radians(90));
  arc(20, 30, 50, 50, 0, radians(90));
  arc(35, 50, 50, 50, 0, radians(90));
  arc(50, 70, 50, 50, 0, radians(90));
  arc(65, 90, 50, 50, 0, radians(90));
  arc(80, 110, 50, 50, 0, radians(90));
  arc(95, 130, 50, 50, 0, radians(90));
  arc(110, 150, 50, 50, 0, radians(90));
  arc(125, 170, 50, 50, 0, radians(90));
  arc(140, 190, 50, 50, 0, radians(90));
  arc(155, 210, 50, 50, 0, radians(90));
  arc(170, 230, 50, 50, 0, radians(90));
  arc(185, 250, 50, 50, 0, radians(90));
  arc(200, 270, 50, 50, 0, radians(90));
  arc(215, 290, 50, 50, 0, radians(90));
  arc(230, 310, 50, 50, 0, radians(90));
  arc(245, 330, 50, 50, 0, radians(90));
  arc(260, 350, 50, 50, 0, radians(90));
  arc(275, 370, 50, 50, 0, radians(90));
  arc(290, 390, 50, 50, 0, radians(90));
  arc(300, 300, 100, 100, 0, PI/2); 
  
  fill(#BC1515); 
  ellipse(40, 300, 60, 60);
  ellipse(100, 300, 60, 60);
  ellipse(160, 300, 60, 60);
  ellipse(40, 360, 60, 60);
  ellipse(100, 360, 60, 60);
  ellipse(160, 360, 60, 60);
  fill(#030303);
  arc(40, 300, 50, 50, 0, radians(360));
  fill(#98A0EA);
  arc(100, 300, 50, 50, 0, radians(270));
  fill(#030303);
  arc(100, 300, 50, 50, 0, radians(90));
  fill(#98A0EA);
  arc(40, 300, 50, 50, 0, radians(180));
  fill(#FFFFFF);
  arc(160, 300, 50, 50, 0, radians(360));
  fill(#030303);
  arc(160, 300, 50, 50, 0, radians(270));
  fill(#030303);
  arc(40, 360, 50, 50, 0, radians(270));
  fill(#FFFFFF);
  arc(100, 360, 50, 50, 0, radians(360));
  fill(#98A0EA);
  arc(160, 360, 50, 50, 0, radians(180));
  arc(100, 360, 50, 50, 0, radians(270));
  fill(#030303);
  arc(100, 360, 50, 50, 0, radians(90));
  
  fill(#98A0EA); 
  triangle(95, 75, 95, 20, 151, 75);
  triangle(125, 75, 125, 20, 181, 75);
  triangle(155, 75, 155, 20, 211, 75);
  triangle(230, 275, 258, 220, 286, 275);
  triangle(210, 220, 238, 165, 266, 220);
  fill(#BC1515);
  triangle(270, 220, 298, 165, 326, 220);
  triangle(330, 220, 358, 165, 386, 220);
  
}


