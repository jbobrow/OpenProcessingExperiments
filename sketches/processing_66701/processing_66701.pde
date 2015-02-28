
void setup() {
  size(500, 500);
  background(230, 170, 160);
  // Here we use RectMode Center to create the control points later
  rectMode(CENTER);
  smooth();
  
 // ellipse
 fill(0);
 ellipse(50,20,30,30);
 ellipse(120,35,20,20);
 ellipse(330,60,40,40);
 ellipse(400,80,37,35);
 ellipse(335,480,32,30);
 ellipse(480,480,34,26);
 ellipse(438,185,40,36);
 ellipse(120,height,20,20);
  
 //arch
  fill(0);
  //1starc
  arc(280, 500, 45, 30, PI, TWO_PI-PI/2);
  fill(255,60,0);
  //2narc
  arc(280, 500, 45, 30, TWO_PI-PI/2, TWO_PI);
 
  fill(255,60,0);
  //1starc
  arc(80, 200, 16, 16, PI, TWO_PI-PI/2);
  fill(0);
  //2ndarc
  arc(80, 200, 16, 16, TWO_PI-PI/2, TWO_PI);
  fill(0);
  //3rdarc
  arc(80,200,16,16,0,HALF_PI);
  fill(255,60,0);
  //4tharc
  arc(80,200,16,16,PI/2,PI);
   
  fill(0);
  //1starc
  arc(76, 260, 19, 19, PI, TWO_PI-PI/2);
  fill(255,60,0);
  //2ndarc
  arc(76, 260, 19, 19, TWO_PI-PI/2, TWO_PI);
  fill(255,60,0);
  //3rdarc
  arc(76,260,19,19,0,HALF_PI);
  fill(0);
  //4tharc
  arc(76,260,19,19,PI/2,PI);
   
  //triangular
  beginShape(TRIANGLES);
  fill(100,70,180);
  vertex(0, 355);
  vertex(0, 385);
  vertex(60,370);
  
  fill(0); 
  vertex(460,20);
  vertex(500,18);
  vertex(495,50);
  
  vertex(495,50);
  vertex(475,70);
  vertex(500,72);

  vertex(475,250);
  vertex(500,247);
  vertex(500,278);

  vertex(500,278);
  vertex(485,292);
  vertex(500,300);

  vertex(483,485);
  vertex(476,500);
  vertex(488,500);
  endShape();
  
  noFill();
  beginShape();
  vertex(171,397);
  bezierVertex(115,383,62,306,92,350);
  bezierVertex(51,274,72,107,62,189);
  bezierVertex(100,85,134,86,118,85);
  bezierVertex(125,98,118,138,121,118);
  bezierVertex(122,157,186,145,142,154);
  bezierVertex(200,55,287,105,252,85);
  bezierVertex(176,158,256,211,217,186);
  bezierVertex(260,142,330,158,294,150); 
  bezierVertex(268,222,331,239,300,230);  
  bezierVertex(339,188,384,220,358,202);  
  bezierVertex(331,252,413,265,373,259);  
  bezierVertex(389,298,248,408,333,340);
  vertex(171,397);
  endShape();
   
  beginShape(); 
  bezier(449,171,443,186,470,152,500,182);
  bezier(470,152,500,182,498,217,484,237);
  bezier(498,217,484,237,470,245,436,255);
  bezier(470,245,436,255,416,254,370,220);
  bezier(416,254,370,220,368,185,395,137);
  bezier(368,185,395,137,388,115,449,126);
  endShape();
  
  beginShape(); 
  bezier(63,500,92,500,103,457,114,369);
  bezier(103,457,114,369,122,346,176,358);
  bezier(122,346,176,358,159,431,171,380);
  bezier(171,380,159,431,150,500,114,500);
  endShape();
  
  beginShape();
  stroke(0,0,0);
  line(50,20,120,35);
  line(330,60,400,80);
  line(335,480,380,500);
  line(280,500,276,440);
  line(10,440,40,470);
  line(5,470,40,440);
  line(2,455,40,455);
  line(25,440,18,473);
  
  line(400,420,490,340);
  line(405,360,480,430);
  line(435,350,432,420);
  line(400,390,476,390);
  
  line(0,30,6,12);
  line(0,60,8,62);
  line(0,90,5,100);

}


