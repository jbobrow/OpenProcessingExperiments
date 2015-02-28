
int x, y, wd, ht;

size (400, 400);
smooth ();

x =90;
y= 85;
wd=45;
ht=45;


background (255);

fill (#EA0781);
noStroke ();
rect (x, y, wd+2, ht+2);
fill (#EA0781,200);
rect (x-15, y-15, wd+30, ht+30);
fill (#EA0781, 100);
rect (x-30, y-30, wd+60, ht+60);
fill (#EA0781, 50);
rect (x-45, y-45, wd+90, ht+90);
fill (#EA0781, 30);
rect (x-60, y-60, wd+120, ht+120);


/*
stroke (255, 0,0);
 strokeWeight (10);
 
 point (x+ .5*wd  ,  y+ .2*ht);
 point (x+ .35*wd ,  y+ .15*ht);
 point (x+ .2*wd  ,  y+ .2*ht);
 point (x+ .2*wd  ,  y+ .35*ht);
 point (x+ .4*wd  ,  y+ .5*ht);
 point (x+ .5*wd  ,  y+ .7*ht);
 point (x+ .45*wd ,  y+ .85*ht);
 point (x+ .35*wd ,  y+ .95*ht);
 point (x+ .05*wd ,  y+ .9*ht);
 point (x+ .05*wd ,  y+ .7*ht);
 point (x+.15*wd  ,  y+ .6*ht);
 
 stroke (0, 0, 255);
 strokeWeight (6);
 */

noFill();

//>>>S
stroke (#A4FC03);
strokeWeight (.2*wd);
beginShape ();

curveVertex (x+ .5*wd, y+ .2*ht);

curveVertex (x+ .5*wd, y+ .2*ht);
curveVertex (x+ .35*wd, y+ .15*ht);
curveVertex (x+ .2*wd, y+ .2*ht);
curveVertex (x+ .2*wd, y+ .35*ht);
curveVertex (x+ .4*wd, y+ .5*ht);
curveVertex (x+ .5*wd, y+ .7*ht);
curveVertex (x+ .47*wd, y+ .87*ht);
curveVertex (x+ .35*wd, y+ .95*ht);
curveVertex (x+ .25*wd, y+ .97*ht);
curveVertex (x+ .05*wd, y+ .9*ht);
curveVertex (x+ .05*wd, y+ .7*ht);
curveVertex (x+.15*wd, y+ .6*ht);

curveVertex (x+.15*wd, y+ .6*ht);

endShape ();

//>>  K

// >> straight line
/*
stroke (255, 0,0);
 strokeWeight (5);
 
 point (x+ .6*wd, y+ .15*ht);
 point (x+ .55*wd, y+ .98*ht);
 */

//stroke (0, 0, 255);


beginShape ();

curveVertex (x+ .6*wd, y+ .15*ht);

curveVertex (x+ .6*wd, y+ .15*ht);
curveVertex (x+ .55*wd, y+ .97*ht);

curveVertex (x+ .55*wd, y+ .97*ht);

endShape ();
/*
//>> curvey part of the K
 stroke (255, 0,0);
 strokeWeight (5);
 point (x+ .9*wd  , y+ .15*ht);
 point (x+ .75*wd , y+ .45*ht);
 point (x+ .6*wd  , y+ .5*ht);
 point (x+ .75*wd  , y+ .55*ht);
 point (x+ .8*wd , y+ .6*ht);
 point (x+ .9*wd , y+ .9*ht);
 point (x+ .97*wd , y+ .99*ht);
 */

//stroke (0, 0, 255);


beginShape ();

curveVertex (x+ .9*wd, y+ .15*ht);

curveVertex (x+ .9*wd, y+ .15*ht);
curveVertex (x+ .75*wd, y+ .45*ht);
curveVertex (x+ .6*wd, y+ .5*ht);
curveVertex (x+ .75*wd, y+ .53*ht);
curveVertex (x+ .8*wd, y+ .6*ht);
curveVertex (x+ .9*wd, y+ .9*ht);
curveVertex (x+ .97*wd, y+ .97*ht);

curveVertex (x+ .97*wd, y+ .97*ht);

endShape ();

//>>E

stroke (#0AEFF5);
strokeWeight (.1*wd);

beginShape ();

curveVertex (x+ .65*wd, y+ .35*ht);

curveVertex (x+ .65*wd, y+ .35*ht);
curveVertex (x+ .45*wd, y+ .4*ht);
curveVertex (x+ .4*wd, y+ .45*ht);
curveVertex (x+ .35*wd, y+ .60*ht);
curveVertex (x+ .4*wd, y+ .75*ht);
curveVertex (x+ .45*wd, y+ .8*ht);
curveVertex (x+ .65*wd, y+ .85*ht);

curveVertex (x+ .65*wd, y+ .85*ht);

endShape ();

beginShape ();

curveVertex (x+ .35*wd, y+ .6*ht);

curveVertex (x+ .35*wd, y+ .6*ht);
curveVertex (x+ .5*wd, y+ .6*ht);  

curveVertex (x+ .5*wd, y+ .6*ht);

endShape ();

/*
      for ( int v = x; v < wd+110; v += 10)
 {
 for ( int h = y;  h < ht+110;  h += 10)
 {
 noStroke();
 fill (0,0,0, 100);
 ellipse ( v, h, 3, 3);
 }
 }
 */








