
//Y.Okamoto 20140211 
//Olympic Winter Games 2014 Hot Cool Yours
size(500, 300);
smooth();
background(230,230,230);
float centX=width/2;
float centY=height/2;

//rect-object-1
stroke(#0BABE3);
fill(#0BABE3);
rect(0,0,100,300);
//rect-object-2
stroke(#E3DC0B);
fill(#E3DC0B);
rect(100,0,200,300);
//rect-object-3
stroke(0);
fill(0);
rect(200,0,300,300);
//rect-object-4
stroke(#21D84D);
fill(#21D84D);
rect(300,0,400,300);
//rect-object-5
stroke(#F73469);
fill(#F73469);
rect(400,0,500,300);


//ellipse-object
strokeWeight(35);
stroke(#FFFFFF);
fill(255,150,0,0);
//ellipse-object-1
ellipse(centX-100, centY, 100,100);
//ellipse-object-2
ellipse(centX-50, centY+50, 100,100);
//ellipse-object-3
ellipse(centX, centY, 100,100);
//ellipse-object-4
ellipse(centX+50, centY+50, 100,100);
//ellipse-object-5
ellipse(centX+100, centY, 100,100);

//ellipse-object
strokeWeight(30);
//ellipse-object-1
stroke(#0BABE3);
fill(255,150);
ellipse(centX-100, centY, 100,100);
//ellipse-object-2
stroke(#E3DC0B);
fill(255,150);
ellipse(centX-50, centY+50, 100,100);
//ellipse-object-3
stroke(#000000);
fill(255,150);
ellipse(centX, centY, 100,100);
//ellipse-object-4
stroke(#21D84D);
fill(255,150);
ellipse(centX+50, centY+50, 100,100);
//ellipse-object-5
stroke(#F73469);
fill(255,150);
ellipse(centX+100, centY, 100,100);

//polygon-object-1
strokeWeight(5);
stroke(#FFFFFF);
beginShape();
fill(0);
vertex(centX-50,10);
vertex(centX-30,10);
vertex(centX-30,30);
vertex(centX-50,30);
vertex(centX-50,50);
vertex(centX-30,50);
endShape();
//polygon-object-2
beginShape();
fill(0);
vertex(centX-10,10);
vertex(centX+10,10);
vertex(centX+10,50);
vertex(centX-10,50);
vertex(centX-10,10);
endShape();
//polygon-object-3
beginShape();
fill(230,230,230);
vertex(centX+30,10);
vertex(centX+30,50);
endShape();
//polygon-object-4
beginShape();
fill(#21D84D);
vertex(centX+50,10);
vertex(centX+50,30);
vertex(centX+70,30);
vertex(centX+70,50);
endShape();

//line-object-1
line(centX-250, centY-100, centX+250, centY-100);
