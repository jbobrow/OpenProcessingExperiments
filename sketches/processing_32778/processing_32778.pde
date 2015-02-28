
//Galina Rybatsky
//N00210047
//Recreation of Kandinsky’s Transverse Line
//quote provided by http://quote.robertgenn.com/auth_search.php?authid=56


size(580,400);
background(248,245,217);

noStroke();
fill(250,232,170);
triangle(180,3,460,180,205,345);

//small ellipse in middle with red triangle
noStroke();
fill(153,102,53);
ellipse(270,210,45,53);
fill(255,0,0);
triangle(260,190,290,200,265,230);

noStroke();
fill(117,79,45);
beginShape();
  vertex(150,150);
  vertex(270,160);
  vertex(70,380);
  vertex(10,210);
endShape(CLOSE);

fill(224,202,165);
beginShape();
  vertex(70,185);
  vertex(178,178);
  vertex(125,315);
  vertex(36,270);
endShape(CLOSE);

stroke(0);
strokeWeight(1.25);
line(145,160,328,50);

noStroke();
fill(69,61,112);
ellipse(100,130,70,63);

//curve over the blue ellipse
noFill();
strokeWeight(2);
stroke(212,66,12);
beginShape();
  vertex(50,100);
  bezierVertex(30,100,100,50,150,175);
  endShape();
  
noStroke();
fill(102,102,102);
beginShape();
  vertex(230,250);
  vertex(260,280);
  vertex(205,320);
  vertex(200,290);
endShape(CLOSE);

 fill(204,153,51);
 ellipse(520,350,21,27);

//large complicated black curve in the middle of the composition

strokeWeight(4);
stroke(0);
noFill();
beginShape();
  vertex(200,60);
  bezierVertex(150,100,190,250,260,350);
  endShape();
  strokeWeight(4);
strokeWeight(2);

stroke(2);
line(220,65,200,90);
line(200,90,400,370);
line(200,60,220,65);



//small circles on the blue ellipse

noStroke();
fill(244,192,12);
  ellipse(90,130,6,6);
  ellipse(80,140,4,4);
  ellipse(90,110,4,4);
fill(255,0,0);
  ellipse(120,130,6,6);
fill(50,100,50);
  ellipse(100,150,7,7);

stroke(0);
strokeWeight(3);
line(52,175,155,90);

noStroke();
fill(208,78,29);
triangle(273,25,320,65,268,69);

noFill();
stroke(9);
strokeWeight(9);
ellipse(240,120,38,38);

noStroke();
fill(0);
ellipse(240,120,13,13);

fill(254,128,40);
ellipse(460,25,30,30);

strokeWeight(3);
stroke(0);
line(48,378,490,2);

strokeWeight(5);
stroke(0);
line(450,3,475,55);

strokeWeight(3);
noFill();
ellipse(430,195,210,210);

noFill();
strokeWeight(1);
beginShape();
  vertex(120,5);
  vertex(190,25);
  vertex(130,95);
  vertex(98,33);
endShape(CLOSE);


strokeWeight(2.5);
line(45,55,330,8);

strokeWeight(1.5);
line(165,75,220,9);

strokeWeight(1);
line(105,24,140,83);
line(110,17,150,72);
line(115,10,160,57);
line(118,5,175,40);
line(108,45,135,8);
line(109,58,145,12);
line(118,67,155,17);
line(125,80,169,21);

noFill();
strokeWeight(2);
beginShape();
  vertex(390,70);
  bezierVertex(370,80,260,60,280,160);
 endShape();
  

strokeWeight(1);
beginShape();
  vertex(340,20);
  bezierVertex(300,25,280,40,290,50);
  endShape();
  

strokeWeight(1);
beginShape();
  vertex(355,30);
  bezierVertex(308,25,288,40,298,50);
 endShape();
  


strokeWeight(1);
beginShape();
  vertex(355,40);
  bezierVertex(315,25,290,40,305,55);
 endShape();
  
strokeWeight(3);
fill(255);
beginShape();
  vertex(245,150);
  vertex(260,170);
  vertex(190,210);
  vertex(168,150);
endShape(CLOSE);

//series of lines on bottom left)

strokeWeight(1);
line(450,275,550,370);
line(400,255,550,350);
line(400,265,450,370);
line(270,175,470,370);
line(285,180,475,370);
line(350,255,320,290);
line(300,200,450,370);

//snake like line at the bottom

strokeWeight(2);
stroke(0);
noFill();
beginShape();
  vertex(405,250);
 // bezierVertex(480,400,480,370,500,280);
  bezierVertex(350,390,300,220,270,380);
 endShape();
 
noStroke();
fill(0);
beginShape();
  vertex(465,94);
  vertex(420,90);
  vertex(410,95);
  vertex(390,100);
  vertex(350,120);
bezierVertex(270,300,400,150,500,120);
endShape();
  
fill(50,100,50);
ellipse(100,250,35,55);

PFont gillsans;
fill(255,0,0);
gillsans=loadFont("GillSans-Bold-35.vlw");
textFont(gillsans, 23);
text("The composition is the", 222, 255);
fill(204,102,0);
textFont(gillsans, 35);
text("ORGANIZED SUM", 230,295);
fill(255,0,0);
textFont(gillsans, 23);
text("of the interior functions", 249, 325);
fill(255,0,0);
textFont(gillsans, 23);
text("of every part of the work.", 268, 355);
fill(0);
textFont(gillsans, 17);
text("-Wassily Kandinsky", 280, 379);




  
  

