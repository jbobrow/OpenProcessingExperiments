
//CUBIST SKETCH BY PATRICK ODONNEL
//based loosely on http://pirouline.deviantart.com/

void setup (){
  size (450, 600);
  background (255);
  smooth();
}
 
void draw () {
  //nose shadow
  noStroke();
  fill(255,200,90);
  triangle(111, 28, 165, 45, 200,200);
  
  //nose
  noFill();
  strokeWeight(2);
  stroke(0);
  line(125,55,200,200);
  line(200,200,180,220);
  line(180,220,225,300);
  
  //top lip
  strokeWeight(2);
  fill(255,105,180);
  beginShape();
  vertex (194,240);
  vertex (188,250);
  vertex (172,253);
  vertex (160,262);
  vertex (148,264);
  vertex (160,269);
  vertex (202,269);
  vertex (208,263);
  endShape(CLOSE);
  
  //bottom lip
  strokeWeight(3);
  fill(255,20,147);
  beginShape();
  vertex (160,269);
  vertex (169,269);
  vertex (205,288);
  vertex (216,279);
  vertex (218,270);
  endShape(CLOSE);
  
  //right lip
  strokeWeight(4);
  fill(255,10,140);
  beginShape();
  vertex (216,275);
  vertex (239,240);
  vertex (200,252);
  vertex (208,263);
  vertex (202,269);
  vertex (218,270);
  endShape(CLOSE);
  
  //shirt
  strokeWeight(3);
  fill(60,179,113);
  beginShape();
  vertex (2,598);
  vertex (2,400);
  vertex (30,392);
  vertex (40,370);
  vertex (220,382);
  vertex (226,415);
  vertex (290,425);
  vertex (378,598);
  endShape(CLOSE);
  
  //shirt collar
  strokeWeight(3);
  fill(50,190,100);
  quad(25,397, 35,365, 225,377, 231,420);
  
  //left eye
  noStroke();
  fill(0,200,250);
  arc (83,147,50,30,-QUARTER_PI,QUARTER_PI);
  noFill();
  stroke(0);
  strokeWeight(1);
  fill(255,0,0);
  line(100,135,60,160);
  line(60,160,111,175);
  noFill();
  arc (100,125, 20,20, TWO_PI, TWO_PI+HALF_PI);
  arc (100,125, 10,20, TWO_PI, TWO_PI+HALF_PI);
  arc (100,125, 30,20, TWO_PI, TWO_PI+HALF_PI);
  
  //right eye
  noFill();
  strokeWeight(1);
  arc(220,111,41,37,0,PI+PI);
  fill(0,10,100);
  arc(220,111,41,37,PI+HALF_PI,TWO_PI+PI+QUARTER_PI+PI/8);
  
  //cheek
  fill(201,230,40);
  noStroke();
  beginShape();
  curveVertex(275,50);
  curveVertex(313,89);
  curveVertex(295,240);
  curveVertex(235,293);
  curveVertex(200,300);
  endShape();
  beginShape();
  curveVertex(430,50);
  curveVertex(360,90);
  curveVertex(260,200);
  curveVertex(208,164);
  curveVertex(150,100);
  endShape();
  
  //ear
  fill(25,220,220);
  stroke(0);
  strokeWeight(3);
  arc(304,170,50,70, 3*PI/2,TWO_PI+HALF_PI);
  
  //hair
  noFill();
  strokeWeight(2);
  stroke(0); 
  curve(415,140,375,200,450,270,440,185);
  curve(0,0,285,50,375,200,500,500);
  curve(200,400,300,100,250,50, 400,200);
  curve(5, 100, 100, 24, 300,100, 405, 400);
  curve(5, 26, 100, 24, 100, 61, 5, 65); 
  strokeWeight(1);
  curve(105, 126, 100, 61, 80, 125, 200, 200);
  curve(60, 60, 80, 125, 60,80, 200, 100);
  curve(300, 60, 55,90, 70,300, 300, 300);
  curve(300, 60, 70,300,0,200, 300, 300);
  curve(240,120, 225,300, 110,350, 100,200);
  
}
