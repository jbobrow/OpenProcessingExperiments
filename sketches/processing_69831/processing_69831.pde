

/*****************************************
 * Assignment ## 1
 * Name:         Baijie Lu (Siv)
 * E-mail:       blu@brynmawr.edu
 * Course:       CS 110 - Section 1
 * Submitted:    9/12/2012
 * 
 * I sketched the Sydney Opera Houses. The reason why I did this
 is because I am taking a History of Modern Architecture and the 
 other day I was browsing pictures of modern architectures. I 
 thought the Opera Houses would be easy enough to draw using 
 processing.
 
 In my picture, I used lots of bezier curves to form the houses 
 and the curve function to form the waves that are beneath the
 buildings. I also used random() to make the wave move up and 
 down. Moreover, I colore the picture by building differnt shapes 
 and build each on top of another, cuz my original sketch was
 impossible to color.
***********************************************/



void setup()
{
  //background setup
size (500,500);
smooth ();
frameRate(2);
}



void draw()
{
  
  background(58,82,229);
  
//color structure 1 and 2
 noStroke();
 fill(160,95,95);
quad (8.1,337.5, 32.4,283.5, 40.5,288.9, 18.9,337.5); 
beginShape();
  vertex(0,229.5);
  vertex(13.5,229.5);
  vertex(13.5,323);
  vertex(8.1,337.5);
  vertex(0,337.5);
 endShape(CLOSE); 
 
 //color the opera houses
 fill(150);
 noStroke();
 bezier (58,250, 62.1,207.9, 90,160,  106,160);
triangle(58,250,106,160,90,256);

fill(255);
bezier (90,256, 91,197,97,140,150,109);
bezier (198,183, 198,161, 181,127,150,109);
quad(90,256,150,109, 198,183,173,263);
triangle(90,256,173,263,120,263);

fill(150);
bezier (173,263, 172,237,185,182,214,169);
triangle(173,263,214,169,203,263);

fill(255);
bezier (203,263, 204,240,202,127,271,95);
triangle (203,263,271,95, 265,263);

fill(220);
bezier (265,224, 265,195, 255,151, 271,95);
bezier (320,160, 314,138, 292,104, 271,95);
triangle (265,224,271,95,320,160);

fill(255);
bezier (247,263, 258,228, 299,165,350,140);
triangle (247,263,350,140,350,263);

fill(220);
bezier (330,240, 330,204, 326,173,350,140);
bezier(380,200,378,179,366,147,350,140);
triangle(330,240,350,140,380,200);

fill(255);
quad(310,263,403,190, 360,297, 310.5,297);
bezier (310,263, 331,232, 382,196, 403,190);

fill(220);
bezier (360,297, 360,250, 390,190, 403,190);
bezier (403,190, 416,190, 445.5,250, 445.5,297);
triangle(360,297,403,190,445.5,297);


//color the bases
noStroke();
fill(224,212,70);
triangle (48,297,  58,250, 270,297);
fill(224,183,70);
beginShape();
vertex(120,263);
vertex(310.5,263);
vertex(310.5,297);
vertex(270,297);
endShape(CLOSE);

//color the upper bricks

noStroke();
fill(255,112,94);
quad(18.9,337.5,38,297, 445.5,297, 445.5,337.5);



//=============== draw the outlines of everything =========
 
  
  strokeWeight(2);
  noFill();
  stroke(0);

//structure 1
quad (8.1,337.5, 32.4,283.5, 40.5,288.9, 18.9,337.5);

//structure 2
line (0,229.5, 13.5,229.5);
line (13.5,229.5, 13.5, 323);

//the base
triangle (48,297,  58,250, 270,297);
line (120,263, 310.5,263);
line (310.5,263, 310.5, 297);

//roof 1
bezier (58,250, 62.1,207.9, 90,160,  106,160);
bezier (90,256, 91,197,97,140,150,109);
bezier (198,183, 198,161, 181,127,150,109);

//roof 2
bezier (173,263, 172,237,185,182,214,169);
bezier (203,263, 204,240,202,127,271,95);
bezier (265,224, 265,195, 255,151, 271,95);
bezier (320,160, 314,138, 292,104, 271,95);



//roof 3

bezier (247,263, 258,228, 299,165,350,140);
bezier (330,240, 330,204, 326,173,350,140);
bezier(380,200,378,179,366,147,350,140);

//roof 4

bezier (360,297, 360,250, 390,190, 403,190);
bezier (403,190, 416,190, 445.5,250, 445.5,297);
bezier (310,263, 331,232, 382,196, 403,190);

//bricks 1

line (37,297, 445.5,297);
line (445.5,297, 445.5,337.5);
line (0,337.5, 472.5,337.5);
line (472.5,337.5, 472.5,364.5);
line (94.5,364.5,  472.5,364.5);

line (175.5,297, 175.5,337.5);
line (229.5,297, 229.5,337.5);
line (283.5,297, 283.5,337.5);
line (337.5,297, 337.5,337.5);
line (391.5,297, 391.5,337.5);

//lower bricks
stroke(0);
strokeWeight(2);
beginShape(LINES);
vertex(175.5,364.5);
vertex(175.5, 405);
vertex(229.5, 364.5);
vertex(229.5, 425);
vertex(283.5,364.5);
vertex(283.5,405);
vertex(337.5,364.5);
vertex(337.5,425);
vertex(391.5,364.5);
vertex(391.5,405);
vertex(445.5,364.5);
vertex(445.5,425);
endShape();

//wave 1
stroke(173,232,252);
strokeWeight(4);
beginShape();
noFill();
curveVertex(67.5,405);
curveVertex(121.5,random(425,430));
curveVertex(175.5,405);
curveVertex(229.5,random(425,430));
curveVertex(283.5,405);
curveVertex(337.5,random(425,430));
curveVertex(391.5,405);
curveVertex(445.5,random(425,430));
curveVertex(499.5,405);
curveVertex(553.5,random(425,430));
endShape();

//wave 2
noFill();
beginShape();
curveVertex(175.5,random(445,455));
curveVertex(229.5,465);
curveVertex(283.5,random(445,455));
curveVertex(337.5,465);
curveVertex(391.5,random(445,455));
curveVertex(445.5,465);
curveVertex(499.5,random(445,455));
curveVertex(553.5,465);
endShape();
}



















