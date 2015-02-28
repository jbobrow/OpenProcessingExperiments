
void setup()
{
  size(400,400);
  background(#000000);
  noStroke();

  //Object 1 - largeCenterCircle
  fill(#CC0000);
  ellipse(200,205, 325,325);
  //Object 2 - smallCenterCircle
  fill(#FF3300);
  ellipse(200,205, 265,265);

  //Object 3 - outterLeftQuad
  fill(#FFCC33);
  quad(100,265, 200,325, 200,205, 100,145);
  //(bottomLeft, bottomRight, topRight, topLeft)
  //Object 4 - outterRightQuad
  fill(#FF9900);
  quad(300,265, 200,325, 200,205, 300,145);
  //(bottomRight, bottomLeft, topLeft, topRight)
  //Object 5 - outterTopQuad
  fill(#FFFF66);
  quad(200,205, 100,145, 200,85, 300,145);
  //(bottom, left, top, rightMid)

  //Object 6 - centerTopQuad
  fill(#99FFFF);
  quad(150,175, 200,145, 250,175, 200,205);
  //(left, top, right, bottom)
  //Object 7 - centerLeftQuad
  fill(#3399FF);
  quad(150,175, 200,205, 200,265, 150,235);
  //(topLeft, topRight, bottomRight, bottomLeft)
  //Object 8 - centerRightQuad
  fill(#3333CC);
  quad(200,205, 250,175, 250,235, 200,265);
  //(topLeft, topRight, bottomRight, bottomLeft)  
  
  //Object 9 - leftLeftQuad
  fill(#3399FF);
  quad(150,235, 100,205, 100,265, 150,295);
  //(topRight, topLeft, bottomLeft, bottomRight)
  
  //Object 10 - rightRightQuad
  fill(#3333CC);
  quad(250,235, 300,205, 300,265, 250,295);
  //(topLeft, topRight, bottomRight, bottomLeft)
  
  //Object 11 - leftRightTriangle
  fill(#3333CC);
  triangle(150,235, 150,295, 200,265);
  //(leftTop, leftBottom, rightMiddle)
  
  //Object 12 - rightLeftTriangle
  fill(#3399FF);
  triangle(250,235, 250,295, 200,265);
  //(rightTop, rightBottom, leftMiddle)
  
  //Object 13 - leftTopTriangle
  fill(#99FFFF);
  triangle(150,235, 150,175, 100,205);
  //(rightBottom, rightTop, leftMiddle)
  
  //Object 14 - rightTopTriangle
  fill(#99FFFF);
  triangle(250,235, 250,175, 300,205);
  //(leftBottom, leftTop, rightMiddle)
  
  //Object 15 - topTopQuad
  fill(#99FFFF);
  quad(200,145, 250,115, 200,85, 150,115);
  //(bottom, right, top, left)
  
  //Object 16 - topLeftTriangle
  fill(#3399FF);
  triangle(150,175, 150,115, 200,145);
  //(leftBottom, leftTop, rightMiddle)
  
  //Object 17 - topRightTriangle
  fill(#3333CC);
  triangle(250,175, 250,115, 200,145);
  //(rightBottom, rightTop, leftMiddle)
  
  //Object 18-23 - boxLines
  stroke(#000000);
  line(200,85, 100,145);
  line(100,145, 100,265);
  line(100,265, 200,325);
  line(200,325, 300,265);
  line(300,265, 300,145);
  line(300,145, 200,85);
  
  //Object 24 - pointStar
  stroke(#FFFF00);
  strokeWeight(10);
  point(200,205);
}


