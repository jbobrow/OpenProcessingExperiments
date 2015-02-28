
size(300,300);
background(150,255,175);
smooth();

fill(100,255,125);
noStroke();
ellipse(300,275,300,400);

//shirt
stroke(100,100,100);
fill(0,0,0);
//98,71,104,0
quad(100,250, 220,275, 250,300, 100,300);

/*-----------------------------------------------------*/

//some hair behind the earring
noStroke();
fill(25,5,0);
/*x,y are original starting points. the next integer pulls that point left or right,
the proceeding integer pulls that point up or down.
it all depends on where the original points are; less than that number, it will pull
to the left, more than that number, and it will pull to the right.
*/
bezier(134,0,130,100, 275,300,50,275);

fill(30,10,0);
bezier(135,0,130,100, 260,300,50,240);

/*-----------------------------------------------------*/

//neck
stroke(229,179,180,255);
fill(255,220,220);
//98,71,104,0
quad(98,180,104,300,0,300,0,250);

/*-----------------------------------------------------*/

//earring
noFill();
stroke(150,150,150);
strokeWeight(5);
ellipse(110,165,50,100);
stroke(255,255,255);
strokeWeight(1);
ellipse(109,164,50,100);

/*-----------------------------------------------------*/

//face
noStroke();
fill(255,0,0,20);
ellipse(5,80,280,450);

//illustrator vectors(0,13,146,-7,121,236,105,290);
//bezier(0,287,146,307,121,64,105,0);
stroke(229,179,180,255);
strokeWeight(1);
fill(255,220,220);
ellipse(5,65,250,450);

//cheeks
fill(255,0,0,10);
noStroke();
ellipse(80,145,75,50);

//freckles
stroke(187,90,51,100);
strokeWeight(4);
point(2,110);
point(10,111);
strokeWeight(3);
point(10,103);

//nose
fill(229,120,120,20);
noStroke();
ellipse(0,170,50,30);

//eyecavity
fill(229,179,180,150);
noStroke();
ellipse(80,73,125,60);

/*-----------------------------------------------------*/

//glasses
stroke(93,23,0);
strokeWeight(8);
fill(200,179,180,100);
rect(20,55,100,50);
strokeWeight(7);
line(0,70,19,70);
line(124,70,127,70);

/*-----------------------------------------------------*/

//eyes
//outside eye shape
//illustrator vectors 33,219,46,262,144,225,40,218
stroke(229,179,180,255);
strokeWeight(1);
fill(255,255,255);
bezier(33,81,46,38,144,75,40,82);
//iris
stroke(150,255,100);
fill(180,130,46,200);
ellipse(55,70,20,20);
//pupil
noStroke();
fill(0,0,0);
ellipse(55,69,11,11);
noFill();

/*-----------------------------------------------------*/

//nose
//illustrator vectors (37,153,37,150,56,129,47,137);
strokeWeight(2);
stroke(255,180,180,255);
bezier(37,147,37,150,56,171,34,179);
//0,109,13,108,30,137,31,120
bezier(0,191,13,191,45,167,31,180);

/*-----------------------------------------------------*/

//piercing
stroke(100,100,100);
strokeWeight(0.5);
fill(100,100,100,100);
ellipse(60,195,9,9);
noStroke();
fill(255,255,255);
ellipse(59,195,3,3);

/*-----------------------------------------------------*/

//upper lip dimple
fill(255,100,100,25);
ellipse(6,204,15,25);

//underlying lip fill
//0,78,117,108,29,33,0,47
noStroke();
strokeWeight(1.5);
fill(255,150,150,225);
bezier(0,224,117,192,29,263,0,253);

//lips 0,35,68,47,60,83,60,83
stroke(255,100,100,100);
//bottomlip
bezier(0,255,68,253,60,217,60,217);
//0,72,0,72,20,66,35,80

//inside shape
strokeWeight(3);
bezier(0,228,0,228,20,234,32,222);
//37,80,37,80,46,78,56,84
bezier(32,222,37,220,46,228,56,220);

//upperlip 0,80,16,76,27,95,55,85
strokeWeight(1.5);
bezier(0,220,16,224,27,205,60,217);

/*-----------------------------------------------------*/

//eyebrow
stroke(93,23,0);
fill(50,15,0,225);

beginShape();
vertex(22.3, 44.4);
bezierVertex(18.6, 19.7, 107, 20, 105.6, 39.7);
bezierVertex(94.3, 15.7, 45, 55, 22.3, 44.4);
endShape();

/*-----------------------------------------------------*/

//hair

/*vertex is the starting point
bezierVertex: first 2 are vertex controllers
next 2 are vertex controllers
next 2 are second point coords
bezierVertex: first two are 2nd point controllers
next two are vertex controllers
next two are beginning/closing vertex coords
*/

strokeWeight(0.5);

fill(10,5,0,255);
beginShape();
vertex(140,0);
bezierVertex(150,25, 250,150,180,200);
bezierVertex(150,25, 100,100,110,0);
endShape();

beginShape();
vertex(130,0);
bezierVertex(100,100, 250,300, 130,290);
bezierVertex(180,280, 80,80, 130,0);
endShape();

beginShape();
fill(25,10,0,240);
vertex(135,5);
bezierVertex(125,100, 250,250, 160,250);
bezierVertex(200,200, 80,80, 130,5);
endShape();

noStroke();

beginShape();
fill(10,10,0,255);
vertex(135,5);
bezierVertex(130,10, 100,25, 145,100);
bezierVertex(150,100, 120,5, 130,5);
endShape();

//bangs
noStroke();
fill(25,3,0);
bezier(-30,0,-5,0, 30,49,40,0);
fill(25,10,0);
bezier(-10,0,-5,0, 160,60,135,0);


