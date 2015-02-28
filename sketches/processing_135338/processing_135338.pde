
//Emma Grapek, 02-20-2014, Creative Computing, Benjamin Bacon

//Background
{
  size(800, 600);
  PImage img;
  img = loadImage("Malibu_Sunset_1.jpg");
  image(img, 0, 0);
}
//Hair
{
  noStroke(); 
  smooth();
  fill(#0187a8);
  ellipse(400, 150, 115, 115);
  rect(343, 150, 115, 100);
}
//Head
{
  smooth();
  fill(255, 254, 205);
  noStroke();
  ellipse(400, 150, 100, 100);
}
//Bangs
{
  fill(#0187a8);
  arc(400, 130, 95, 70, PI, TWO_PI);
}
//Eyes
{ 
  fill(000000);
  ellipse(380, 140, 5, 5);
  ellipse(415, 140, 5, 5);
}
//Mouth
{
  noFill();
  stroke(000000);
  arc(398, 165, 35, 10, 0, PI);
}
//Body
{
  noStroke();
  fill(255, 254, 205);
  rect(370, 190, 55, 100);
}
//Arms
{
  stroke(255, 254, 205);
  smooth();
  strokeWeight(5);
  strokeCap(ROUND);
  line(350, 240, 370, 200);
  line(445, 240, 425, 200);
}
//Bikini
{
  stroke(#a20ca7);
  fill(#a20ca7);
  line(370, 220, 425, 220);
  ellipse(385, 220, 15, 15);
  ellipse(410, 220, 15, 15);
}
//Bellybutton
{
  noStroke();
  fill(#000000);
  ellipse(397.5, 270, 3, 3);
}
//Tail
{
  beginShape();
  noStroke();
  fill(#75ffc0);
  rect(365, 290, 65, 110);
  rect(365, 400, 90, 30);
}
//Fin
{
  noStroke();
  arc(470, 410, 50, 50, HALF_PI, PI+HALF_PI);
}


