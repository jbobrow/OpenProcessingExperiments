

// copyright Yasha Mushtaq Mir
// HW - 2 Sep 3rd'13
// Pittsburgh PA

size (400, 400);
background(77,76,74);

//variables
float x=200;
float y=200;

float wd=200;
float ht=200;

//'y' face outline
strokeWeight(6);
stroke (224, 204, 152);
line (x+wd*.25,y+ht*.45,x+wd*.1,y+ht*.95);
fill(224, 204, 152);
noStroke();
beginShape( );
curveVertex (x-wd*.45,y-ht*.4);
curveVertex (x-wd*.45,y-ht*.35);
curveVertex (x-wd*.4,y+ht*.25);
curveVertex (x-wd*.25,y+ht*.5);
curveVertex (x,y+ht*.6);
curveVertex (x+wd*.25,y+ht*.5);
curveVertex (x+wd*.4,y+ht*.25);
curveVertex (x+wd*.45,y-ht*.35);
curveVertex (x+wd*.45,y-ht*.4);
endShape( );

//Hair
strokeWeight(1);
fill (72, 49, 49, 100);
rect (x-wd*.48, y-ht*0.6, wd*.95, ht*0.25, wd*0.8, ht*.3, 0, 0);

//'M' Eyebrows
stroke(64,49,36);
strokeWeight(3);
strokeCap(SQUARE);
line (x-wd*.4,y-ht*.2,x-wd*.2,y-ht*.35);
line (x+wd*.4,y-ht*.2,x+wd*.2,y-ht*.35);
noFill();
strokeWeight(6);
arc (x, y-ht*.5, wd*0.5, ht*0.5, radians(37), radians(143));

//Eyes
fill(107,129,234,75);
strokeWeight(1);
ellipse (x-wd*.2,y-ht*.2,wd*.4,ht*.2);
ellipse (x+wd*.2,y-ht*.2,wd*.4,ht*.2);

stroke (255);
fill (38, 43, 62);
ellipse (x-wd*.2,y-ht*.2,wd*.05,ht*.1);
ellipse (x+wd*.2,y-ht*.2,wd*.05,ht*.1);

//'M' Moustache
noStroke();
fill (72, 49, 49);
beginShape( );
curveVertex (x-wd*.55,y+ht*.5);
curveVertex (x-wd*.5,y+ht*0.45);
curveVertex (x-wd*.3,y+ht*0.25);
curveVertex (x-wd*.1,y+ht*.2);
curveVertex (x,y+ht*.25);
curveVertex (x+wd*.1,y+ht*.2);
curveVertex (x+wd*.3,y+ht*0.25);
curveVertex (x+wd*.5,y+ht*0.45);
curveVertex (x+wd*.55,y+ht*0.5);
endShape( );
noFill();







