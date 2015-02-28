
////GSwP 4.7 Flex Your for Loop's Muscles and 4.8 Fanning out the Lines
////and 4.9 Kinking the Lines
//
//size(480, 120);
//smooth();
//strokeWeight(2);
//for(int i = 20; i < 400; i += 20)
//{
//  line(i, 0, i + i/2, 80);
//  line(i*1.2, height, i + i/2, 80);
//}

////GSwP 4.10 Embed One for Loop in Another
//
//size(480, 120);
//background(0);
//smooth();
//noStroke();
//for(int y = 0; y <= height; y += 40)
//{
//  for(int x = 0; x <= width; x += 40)
//  {
//    fill(255, 140);
//    ellipse(x, y, 40, 40);
//  }
//}

////GSwP 4.11 Rows and Columns
//
//size(480, 120);
//background(0);
//smooth();
//noStroke();
//for(int y = 0; y <= height; y += 40)
//{
//  fill(255, 120);
//  ellipse(0, y, 40, 40);
//}
//for(int x = 0; x <= width; x += 40)
//{
//  fill(255, 120);
//  ellipse(x, 0, 40, 40);
//}

////GSwP 4.12 Pins and Lines
//
//size(480, 120);
//background(0);
//smooth();
//fill(255);
//stroke(102);
//for(int y = 20; y <= height-20; y += 10)
//{
//  for(int x = 20; x <= width-20; x += 10)
//  {
//    line(x, y, width/2, height/2);
//    ellipse(x, y, 4, 4);
//  }
//}

//GswP 4.13 Halftone Dots

size(480, 120);
background(0);
stroke(0);
fill(255);
smooth();
for(int y = 32; y <= height; y += 8)
{
  for(int x = 32; x <= width; x += 15)
  {
    ellipse(x + y, y, 16 - y/10.0, 16 - y/10.0);
  }
}
