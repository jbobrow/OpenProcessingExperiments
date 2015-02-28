
//Charlotte Stiles Copyright 2014
size(500, 500);
background(0);
noStroke();
fill(230, 190, 190);
//variables
float x=150;
float y=150;
float wd=200;
float ht=170;
//Head
beginShape();
curveVertex(x, y);
curveVertex(x, y);
curveVertex(x+(wd*.20), (y+ht*-.20));
curveVertex(x+(wd*.5), y+(ht*-.25));
curveVertex(x+(wd*.75), y+(ht*-.20));
curveVertex(x+(wd*.85), y+(ht*-.16));
curveVertex(x+wd, y);
curveVertex(x+(wd*1.07), y+(ht*.20));
curveVertex(x+(wd*1.07), y+(ht*.30));
curveVertex(x+(wd), y+(ht*.40));
curveVertex(x+(wd*1.04), y+(ht*.50));
curveVertex(x+(wd*1.04), y+(ht*.60));
curveVertex(x+(wd), y+(ht*.7));
curveVertex(x+(wd*.9), y+(ht*.8));
curveVertex(x+(wd*.9), y+(ht*.9));
curveVertex(x+(wd*.9), y+(ht));
curveVertex(x+(wd*.8), y+(ht*1.2));
curveVertex(x+(wd*.7), y+(ht*1.4));
curveVertex(x+(wd*.1), y+(ht*1.4));
curveVertex(x, y+(ht*1.4));
curveVertex(x, y+(ht*1.2));
curveVertex(x, y+(ht*.8));
curveVertex(x+(wd*-.07), y+(ht*.67));
curveVertex(x+(wd*-.1), y+(ht*.6));
curveVertex(x+(wd*-.1), y+(ht*.53));
curveVertex(x, y+(ht*.4));
curveVertex(x, y+(ht*.3));
curveVertex(x, y);
endShape();
//eyes
fill(255);
noStroke();
ellipseMode(CENTER);
//left
ellipse ( x +.5 * wd, y + .45 * ht, .25 * wd, .2 * ht);
fill(0);
ellipse ( x +.5 * wd, y + .45 * ht, .13 * wd, .13 * ht);
//right
fill(255);
ellipse ( x + .95 * wd, y + .45 * ht, .2 * wd, .19 * ht);
fill(0);
ellipse ( x + .95 * wd, y + .45 * ht, .12 * wd, .13 * ht);
//shines
fill(255);
ellipse ( x + .99 * wd, y + .44 * ht, .06 * wd, .06 * ht);
ellipse ( x +.55 * wd, y + .44 * ht, .06 * wd, .06 * ht);
//eyebrowz ;*
stroke(150);
strokeWeight(15);
line(x +.37 * wd, y + .33 * ht, x +.61 * wd, y + .33 * ht);
line(x +.87 * wd, y + .33 * ht, x + wd, y + .33 * ht);
//"C" nose
fill(230, 180, 180);
strokeWeight(3);
stroke(180, 129, 120);
arc(x +.75 * wd, y + .57 * ht, .15 * wd, .4 * ht, -PI / 6, PI, OPEN);


// sexy stache
fill(140);
noStroke();
beginShape();
curveVertex(x + wd * .85, y + ht * .82);
curveVertex(x + wd * .7, y + ht * .82);
curveVertex(x + wd * .45, y + ht * .85);
curveVertex(x + wd * .35, y + ht * .95);
curveVertex(x + wd * .3, y + ht * 1.1);
curveVertex(x + wd * .65, y + ht * .96);
curveVertex(x + wd * .75, y + ht * .95);
curveVertex(x + wd * .85, y + ht * 1.1);
curveVertex(x + wd * .94, y + ht * .95);
curveVertex(x + wd * .93, y + ht * .87);
curveVertex(x + wd * .86, y + ht * .85);
curveVertex(x + wd * .5, y + ht * .82);
endShape(CLOSE);
//"S"hur
stroke(140);
strokeWeight(4) ;
strokeCap(ROUND) ;
noFill();
arc( x + wd * .03, y+ ht * .28, wd*.028, ht*.08, HALF_PI, TWO_PI ) ;
arc(x + wd * .03, y + ht * .36, wd*.028, ht*.092, PI+HALF_PI, PI+TWO_PI) ;
arc( x + wd * .08, y+ ht * .28, wd*.028, ht*.08, HALF_PI, TWO_PI ) ;
arc(x + wd * .08, y + ht * .36, wd*.028, ht*.092, PI+HALF_PI, PI+TWO_PI) ;
arc( x + wd * .14, y+ ht * .28, wd*.028, ht*.08, HALF_PI, TWO_PI ) ;
arc(x + wd * .14, y + ht * .36, wd*.028, ht*.092, PI+HALF_PI, PI+TWO_PI) ;
arc( x + wd * .03, y+ ht * .12, wd*.028, ht*.08, HALF_PI, TWO_PI ) ;
arc(x + wd * .03, y + ht * .20, wd*.028, ht*.092, PI+HALF_PI, PI+TWO_PI) ;
arc( x + wd * .08, y+ ht * .12, wd*.028, ht*.08, HALF_PI, TWO_PI ) ;
arc(x + wd * .08, y + ht * .20, wd*.028, ht*.092, PI+HALF_PI, PI+TWO_PI) ;
arc( x + wd * .14, y+ ht * .12, wd*.028, ht*.08, HALF_PI, TWO_PI ) ;
arc(x + wd * .14, y + ht * .20, wd*.028, ht*.092, PI+HALF_PI, PI+TWO_PI) ;
arc( x + wd * .20, y+ ht * .12, wd*.028, ht*.08, HALF_PI, TWO_PI ) ;
arc(x + wd * .20, y + ht * .20, wd*.028, ht*.092, PI+HALF_PI, PI+TWO_PI) ;


arc(x + wd * .03, y + ht * .04, wd*.028, ht*.092, PI+HALF_PI, PI+TWO_PI) ;
arc( x + wd * .08, y+ ht * -.02, wd*.028, ht*.08, HALF_PI, TWO_PI ) ;
arc(x + wd * .08, y + ht * .04, wd*.028, ht*.092, PI+HALF_PI, PI+TWO_PI) ;
arc( x + wd * .14, y+ ht * -.02, wd*.028, ht*.08, HALF_PI, TWO_PI ) ;
arc(x + wd * .14, y + ht * .04, wd*.028, ht*.092, PI+HALF_PI, PI+TWO_PI) ;

//collar
fill(250,100,100);
noStroke();
triangle(x+(wd*-.1), y+(ht*1.2),x+(wd*-.1), y+(ht*1.5),  x+(wd*.66), y+(ht*1.4));
triangle(x+(wd*.8), y+(ht*1.3),x+(wd*.8), y+(ht*1.5),  x+(wd*.56), y+(ht*1.4));

//inner ear
noFill();
stroke(180, 129, 120);
arc(x + wd * -.03, y+ ht * .55, wd*.1, ht*.08, PI, TWO_PI-PI/4);
