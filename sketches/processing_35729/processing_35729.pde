
size(515,675);
background(242,236,215);
smooth();
fill(0,0,0);
stroke(0,0,0);
//base for the head
ellipse(250,200,200,200);
triangle(200,375,290,315,150,200);
rect(230,230,115,230);
ellipse(270,395,100,300);

//curve of the profile
  beginShape();
  curveVertex(150,200);
  curveVertex(150,200);
  curveVertex(145,275);
  curveVertex(170,350);
  curveVertex(200,375);
  curveVertex(350,200);
  endShape();
  
//detraction (curve of neck)
fill(242,236,215);
stroke(229,242,216);
arc(485,320,300,450,0,PI*2);
ellipse(100,215,100,200);

//addition (chest, eyelash, hair, nose, lips)
fill(0,0,0);
stroke(0,0,0);
ellipse(310,500,200,200);
triangle(230,330,200,550,300,445);
triangle(230,400,140,550,375,500);
//nose
  beginShape();
  curveVertex(145,265);
  curveVertex(145,265);
  curveVertex(135,300);
  curveVertex(155,300);
  curveVertex(155,300);
  endShape();
//lips
  beginShape();
  curveVertex(180,200);
  curveVertex(180,200);
  curveVertex(150,315);
  curveVertex(170,335);
  curveVertex(170,335);
  endShape();
  beginShape();
  curveVertex(170,325);
  curveVertex(170,325);
  curveVertex(160,345);
  curveVertex(190,365);
  curveVertex(190,365);
  endShape();
//hair
ellipse(340,230,150,200);
ellipse(320,145,40,40);

//detraction (cleaning up bottom)
fill(242,236,215);
stroke(229,242,216);
triangle(140,550,500,480,300,800);

//border
noFill();
stroke(0,0,0);
ellipse(257.5,337.5,500,660);
ellipse(257.5,337.5,485,645);

