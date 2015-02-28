
void setup(){
  size(800, 690);
  smooth();
}
void draw() {
  strokeWeight(5);
  
  stroke(22,26,74); //tail
  fill(40,56,116);
  beginShape();
  vertex(470,305);
  bezierVertex(500,100,770,40,790,590);
  vertex(567,640);
  bezierVertex(710,300,500,250,490,320);
  endShape();
  noFill();
  bezier(470,305,500,130,770,90,720,605);
  bezier(470,320,630,200,620,380,615,440);
  
  stroke(163, 107, 182);
  fill(209, 160, 226);
  
  
  ellipse(240, 380, 190, 190); //body
  beginShape();
  vertex(275,292);
  bezierVertex(280,300,380,300,455,290);
  bezierVertex(608,310,500,500,285,470);
  endShape();
  
  beginShape(); //neck
  vertex(149,355);
  bezierVertex(157,130,240,100,280,140);
  bezierVertex(265,240,240,260,275,292);
  endShape();
  
  ellipse(180, 140, 210, 210); //head
  
  beginShape(); //snout
  vertex(77,158);
  bezierVertex(25,158,72,210,87,220);
  bezierVertex(110,235,135,240,150,240);
  endShape();
  
  beginShape(); //front leg
  vertex(200,410);
  bezierVertex(200,410,230,510,170,685);
  vertex(310,685);
  bezierVertex(350,680,300,510,275,420);
  endShape();
  
  beginShape(); //back leg
  vertex(400,395);
  bezierVertex(400,395,390,460,460,510);
  bezierVertex(460,510,450,600,185*2,685);
  vertex(530,685);
  bezierVertex(530,685,590,650,555,500);
  bezierVertex(555,500,545,485,535,500);
  bezierVertex(535,500,555,400,525,337);
  endShape();
  
  noStroke(); //cutie mark
  
  fill(255);
  triangle(420,380,480,360,480,380);
  triangle(460,380,440,330,480,380);
  triangle(460,380,500,330,480,390);
  triangle(530,380,480,365,480,380);
  triangle(440,440,455,380,475,380);
  triangle(500,440,470,380,485,380);
  
  fill(239,67,139); //main star
  
  triangle(470,310,460,380,480,380);
  triangle(400,330,470,370,470,400);
  triangle(520,330,470,370,470,400);
  triangle(415,430,460,370,470,390);
  triangle(530,430,465,360,460,390);
  triangle(450,470,460,380,480,380);
  
  stroke(22,26,74); //mane
  fill(40,56,116);
  
  beginShape();
  vertex(210,130);
  bezierVertex(150,70,40,100,10,120);
  bezierVertex(45,-70,100,-10,210,30);
  bezierVertex(280,50,300,100,290,130);
  bezierVertex(250,250,400,330,230,390);
  bezierVertex(200,360,195,340,190,315);
  bezierVertex(200,320,230,320,240,290);
  bezierVertex(230,300,200,300,180,280);
  vertex(190,220);
  bezierVertex(220,250,280,185,260,115);
  vertex(260,100);
  endShape();
  
  noFill();
  line(145,95,210,30);
  bezier(40,105,30,50,65,0,75,-10);
  bezier(290,220,250,300,200,280,185,260);
  bezier(305,267,250,360,200,350,197,340);
  
  stroke(163, 107, 182);
  fill(209, 160, 226);
  
  beginShape(); //horn
  vertex(150,60);
  bezierVertex(130,45,20,-150,100,80);
  endShape();
  noFill();
  bezier(85,30,100,35,105,30,113,10);
  bezier(95,60,110,65,120,60,130,40);
  
  fill(209, 160, 226);
  
  beginShape(); //ear
  vertex(210,115);
  bezierVertex(210,115,170,80,230,4);
  bezierVertex(230, 4, 285, 10, 260, 115);
  endShape();
  bezier(240,90,260,70,255,60,250,40);
  
  noStroke(); //eye
  fill(255);
  
  beginShape(); //eye white
  vertex(130,190);
  bezierVertex(225,222,250,150,230,100);
  bezierVertex(180,70,130,100,130,190);
  endShape();
  fill(99,51,137); //iris
  ellipse(180,145,85,100);
  fill(0); //pupil
  ellipse(170,140,55,75);
  fill(255); //shines
  ellipse(190,130,40,50);
  ellipse(165,165,20,15);
  
  stroke(0); //lashes
  strokeWeight(5);
  noFill();
  
  beginShape(); //main lash line
  vertex(230,100);
  bezierVertex(180,70,130,100,130,187);
  endShape();
  
  beginShape();
  vertex(220,95);
  bezierVertex(235,95,240,90,240,85);
  endShape();
  beginShape();
  vertex(205,90);
  bezierVertex(215,95,235,80,233,70);
  endShape();
  beginShape();
  vertex(190,88);
  bezierVertex(200,85,215,80,215,70);
  endShape();
  
}
