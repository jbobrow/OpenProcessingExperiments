
/*

Pinak Saha
HW01
Visual Foundation Studio
Fall2013
(0408908)

*/

void setup()
{
  size(400,400);
  background(000000);
  
  //ellipseMode(CENTER);
  
  stroke(#00ffff);
  fill(000000);
  strokeWeight(5);
  ellipse(200,200,400,400);
  
  fill(000000);
  stroke(#00ffff);
  strokeWeight(5);
  ellipse(200,200,300,300);
  
  stroke(#00ffff);
  strokeWeight(5);
  line(200,350,200,50);
  
  
  stroke(#00ffff);
  strokeWeight(5);
  line(50,200,350,200);
  
  
  stroke(#00ffff);
  strokeWeight(5);
  fill(#00ffff);
  //(x1,y1,x2,y2)
  line(100,300,300,100);
  
  stroke(#ff0000);
  strokeWeight(3);
  fill(#ff0000);
  //(x1,y1,x2,y2)
  line(300,250,100,150);
  
  //PFont mono;
  //mono = loadFont("HelveticaNeue.dfont");
  textSize(36);
  //textFont(mono);
  text('N',185,40);
  
  
  fill(#00ffff);
  textSize(36);
  
  text('E',360,215);
  
  text('S',190,385);
  
  text('W',10,215);
}


