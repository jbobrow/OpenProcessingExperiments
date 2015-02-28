
//Task 09 Robot - Barrett Novack, 02/08/2011 IMED1470 W.Rainey ACC/ATX

size(500,700);
background(153,0,0,255);
smooth();

//background elements
noStroke();//nostroke background elements
fill(255,50);
beginShape();
vertex(0,0);
vertex(500,0);
vertex(250,400);
endShape();

//foundation floor
fill(40,0,0,230);
rect(0,400,500,300);

//shadow
fill(0,180);
beginShape();
vertex(300,500);
vertex(250,540);
vertex(390,500);
vertex(500,700);
vertex(0,700);
vertex(0,625);
endShape();
//end background elements

stroke(0);
strokeWeight(2);

//head assembly
//left antennae
stroke(0,255,0,255);
fill(0,255,0,255);
ellipse(125,125,5,5);
stroke(0);
strokeWeight(2);
line(127,125,190,120);
noFill();
strokeWeight(1);
ellipse(137,124,12,20);
ellipse(150,122,15,30);
//end left antennae

//head
stroke(0);
strokeWeight(2);
fill(100,160,255,255);
beginShape();
vertex(160,110); //first pt
bezierVertex(160,70,340,70,340,110); //first ctrl pt: cpx1,cpy1,cpx2,cpy2,x2,y2
bezierVertex(340,180,160,180,160,110); //next ctrl pt: cpx1,cpy1,cpx2,cpy2,x2,y2
endShape();

//eyes
//eye slit
stroke(0,255,0,255);
fill(0,0,70,255);
beginShape();
vertex(170,115);
bezierVertex(160,85,340,85,290,110);
bezierVertex(280,115,245,120,215,105);
bezierVertex(200,115,175,130,170,115);
endShape();

//pupils
noStroke();
fill(0,255,0,255);
ellipse(188,110,9,12);
ellipse(230,103,11,12);
ellipse(277,103,12,12);
stroke(0);

//eye frameshades
fill(0,120);
beginShape();
vertex(165,110);
bezierVertex(165,80,340,75,300,110);
bezierVertex(290,120,250,125,215,110);
bezierVertex(190,125,165,135,165,110);
endShape();
//end eyes

//right antennae
stroke(0);
strokeWeight(2);
line(330,110,390,105);
stroke(0,255,0,255);
fill(0,255,0,255);
ellipse(390,105,5,5);
noFill();
stroke(0);
strokeWeight(1);
ellipse(360,108,15,30);
ellipse(375,107,10,20);
//end right antennae

//mouth
noStroke();
fill(0);
ellipse(218,130,35,10);
//detail
stroke(100,160,255,255);
strokeWeight(2.5);
beginShape();
vertex(202,128);
vertex(205,135);
endShape();
beginShape();
vertex(206,125);
vertex(210,135);
endShape();
beginShape();
vertex(210,123);
vertex(215,135);
endShape();
beginShape(); //centerpoint
vertex(214,121);
vertex(220,135);
endShape();
beginShape();
vertex(220,123);
vertex(225,135);
endShape();
beginShape();
vertex(226,125);
vertex(230,135);
endShape();
beginShape();
vertex(230,125);
vertex(235,135);
endShape();
//end mouth
//end head assembly

stroke(0);
strokeWeight(2);


//neck
fill(51,51,100,255);
beginShape();
vertex(240,230);
bezierVertex(240,195,260,195,260,160);
vertex(260,155);
bezierVertex(260,150,280,150,280,155);
vertex(280,155);
bezierVertex(280,195,260,195,260,230);
endShape();
//end neck

//left arm
fill(51,51,100,255);
beginShape(); //upper arm
vertex(140,285);
bezierVertex(120,270,140,250,160,260); //shoulder top
bezierVertex(160,385,250,390,130,350); //lower wrist
bezierVertex(80,370,80,370,80,345); //thumb
bezierVertex(20,340,40,330,80,330); //finger
bezierVertex(180,330,145,375,140,285); //arm pit
endShape();
//detail
beginShape();
vertex(80,345);
vertex(80,337);
endShape();
fill(100,120,200,255);
ellipse(155,275,50,50); //shoulder joint
//end left arm

//left leg
beginShape();
vertex(85,540);
bezierVertex(95,390,135,360,165,360);
bezierVertex(165,360,185,360,185,360);
bezierVertex(235,360,245,360,255,540);
bezierVertex(255,540,185,560,155,565);
bezierVertex(85,565,85,550,85,540);
endShape();
//detail
strokeWeight(3);
stroke(100,160,255,255);
noFill();
beginShape();
vertex(150,550);
bezierVertex(160,390,200,360,220,370);
endShape();
//end left leg

stroke(0);
strokeWeight(2);

//torso
//torso top, continuous spline curve
fill(100,160,255,255);
beginShape();
curveVertex(250,400); //first control point
curveVertex(150,270); //first point
curveVertex(250,230); //midpoint top
curveVertex(350,270); //last point
curveVertex(250,400); //last control point
endShape();
//torso bottom, continuous spline curve
beginShape();
curveVertex(250,-500); //ctrl pt
curveVertex(150,270); //first pt
curveVertex(250,440); //midpoint bottom
curveVertex(350,270); //last pt
curveVertex(250,-500); //ctrl pt
endShape();
//torso face plate
stroke(100,160,255,255);
strokeWeight(3);
fill(51,51,100,255);
beginShape();
vertex(160,270);
bezierVertex(175,250,230,240,270,245);
bezierVertex(270,300,270,370,210,370);
bezierVertex(180,370,160,370,160,270);
endShape();
//grille detail
noFill();
beginShape();
vertex(160,280);
bezierVertex(175,260,230,250,270,256);
endShape();
beginShape();
vertex(160,290);
bezierVertex(175,270,230,260,270,267);
endShape();
beginShape();
vertex(160,300);
bezierVertex(175,280,230,271,270,278);
endShape();
beginShape();
vertex(161,310);
bezierVertex(176,290,240,285,269,291);
endShape();
//ellipse(205,330,40,45);
//end torso

stroke(0);
strokeWeight(2);
fill(100,120,200,255);

//right leg
beginShape();
vertex(250,560);
bezierVertex(260,400,300,370,330,370);
bezierVertex(330,370,350,370,350,370);
bezierVertex(400,370,410,370,420,550);
bezierVertex(420,560,350,580,320,580);
bezierVertex(250,580,250,570,250,560);
endShape();
//detail
strokeWeight(3);
stroke(100,160,255,255);
noFill();
beginShape();
vertex(320,570);
bezierVertex(330,410,360,370,380,377);
endShape();
 //leg axle
strokeWeight(2);
stroke(0);
fill(51,51,100,255);
ellipse(380,420,25,50);
//end right leg

fill(100,120,200,255);

//right arm
ellipse(350,270,50,50); //shoulder joint
fill(51,51,100,255);
beginShape(); //upper arm
vertex(360,285);
bezierVertex(340,270,360,250,370,260); //shoulder top
bezierVertex(480,385,470,390,350,350); //lower wrist
bezierVertex(300,370,300,370,300,345); //thumb
bezierVertex(240,340,260,330,300,330); //finger
bezierVertex(400,330,465,395,360,285); //arm pit
endShape();
//detail
beginShape();
vertex(300,345);
vertex(300,338);
//vertex(315,355);
endShape();
//end right arm


