
// Copyright Jacklynn Pham 2014
// HW #2

size(400, 400);
noStroke();
background(#82DCEA);

float x = 200;
float y = 200;
float wd = 200;
float ht = 200;

// boudning circle
ellipse(x, y, wd, ht);

//head
fill(#F5BE8A);
ellipse(x, y, wd, ht);


//mustache
fill(#8D8C8E);
arc( x, y+ht/4, wd/2, ht/2, PI, TWO_PI);

//nose
fill(#F5BE8A);
stroke(#D3AE75);
strokeWeight(3);
arc(x, y, wd/3, ht/3, 0, PI);


////////////// J snorkle
noStroke();
fill(#FFDA05);
//ellipseMode(CORNER);
rectMode(CENTER);
arc(x+(x*.35), y+(y*.25), wd/2, ht/2, 0, PI); 
rect(x+(x*.48), y-(y*.12), wd/4, ht*.75);


//goggles
ellipseMode(CORNER);
stroke(#522883);
strokeWeight(10);
fill(#ffffff);
//noFill();
beginShape();
curveVertex(x*1.75, y*.5); // reference

  curveVertex(x, y-ht*.25); //top center
  curveVertex(x+wd/2, y*.75); //top
  curveVertex(x+wd/2, ht);
  curveVertex(x+wd*.05, ht);
  curveVertex(x, y-(ht*.15)); //nose bit
  curveVertex(x-wd*.15, ht);
  curveVertex(x-wd/2, ht);
  curveVertex(x-wd/2, y*.75);
  curveVertex(x, y-ht*.25); //center

curveVertex(x*.5, y*.5); //reference 
endShape();
stroke(#B91515);



//fish
noStroke();
fill(#ED8C16);
ellipse(x*1.25, y*1.5, wd/2, wd/4);
triangle(x*1.15, y*1.75,   x*1.15, y*1.5,   x*1.5, y*1.6);
stroke(#000000);
point(x*1.65, y*1.6);


//reference 
stroke(#B91515);
strokeWeight(7);
//point(x-x/1.5,y);
//point(x-x/2,y-y/4); //middle
//point(x-x/1.5,y-y/2);

//
//point(x, y*.75); //top center
//point(x+wd/5, y*.75); //top
//point(x+wd/5, ht/2);//bottom right
//point(x+wd*.05, ht/2);
//point(x, y-ht*.05); //nose bit
//point(x-wd*.05, ht/2);
//point(x-wd/5, ht/2);//bottom left
//point(x-wd/5, y*.75);
//point(x, y*.75); //center

//reference point
//stroke(#B91515);
//point(x*1.75, y*.5); 
//point(x*.25, y*.5); 



