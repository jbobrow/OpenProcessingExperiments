
//admin
size(640, 480);
smooth();
background(207,214,178);

//mouth = filled in arc 
fill(40);

stroke(0);
fill(234, 199,38);
// 8 parameters
quad(150, 0, 640, 0, 640, 480, 150, 480 );

// orange
stroke(0);
strokeWeight(10); 
fill(231,113,2);
arc(540, 0, 300, 1000,0, PI);


// bleu
stroke(22,38,102);
strokeWeight(10); 
fill(22,38,102);
arc(570, 0, 300, 1000,0, PI);

//   x    y  lenght, height, 
stroke(0);
strokeWeight(10); 
fill(255,5,5);
arc(600, 0, 300, 1000,0, PI);


stroke(0);
strokeWeight(7); 
fill(231,113,2);
//   origin x,y, width, height
rect(360,-5,30,640);

stroke(0);
strokeWeight(7); 
fill(231,113,2);
//   origin x,y, width, height
rect(330,-5,30,640);

stroke(0);
strokeWeight(7); 
fill(0);
//   origin x,y, width, height
rect(310,-5,30,640);

// first quad up
stroke(0);
// 8 parameters
quad(100,0,310,0,285, 200,110,200);


stroke(0);
//          x1 y1  x2, y2, x3, y3  x,y of 3 points clock wise
triangle ( 285, 200, 300,280,290,480);

// second quad down
stroke(0);
// 8 parameters
quad(110,200,285, 200,285, 480,80,480);



//Hair. A detail.
stroke(50);
for (int i=0; i<480; i+=20)
{
  line(0, i, 110, i);
}

stroke(0);
fill(207,214,178);
// orighin x,y, diametre h longueur, diametre v largeur
ellipse(100,280,250,250);

stroke(107,169,132);
strokeWeight(40);
fill(207,214,178);
// orighin x,y, diametre h longueur, diametre v largeur
ellipse(100,280,160,160);






