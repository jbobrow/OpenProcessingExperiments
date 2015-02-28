
//copyright Leslie Bloomfield lbloomfi 2014
size (400, 400);
background (144, 199, 255);

float x = 0;
float y = 0;
float wt = 400;
float ht = 400;


//bounding circle
stroke (255);
strokeWeight(0);
ellipse (x + 0.5*wt, y + 0.5*ht, 0.25*wt, 0.25*ht);

//face
fill (242, 219, 176);
strokeWeight(0);
ellipse (x + 0.5*wt, y + 0.5*ht, wt, ht);


stroke (167, 141, 113);
strokeWeight(2);
//initial L (nose)
beginShape();
vertex (x + 0.55*wt, y + 0.4*ht);
vertex (x + 0.5*wt, y + 0.5*ht);
vertex (x + 0.45*wt, y + 0.6*ht);
vertex(x + 0.55*wt, y + 0.6*ht);
endShape();

//mouth
beginShape();
curveVertex (x + 0.2*wt, y + 0.9*ht); //anchor point
curveVertex  (x + 0.2*wt, y + 0.9*ht);
curveVertex  (x + 0.33*wt, y + 0.75*ht);
curveVertex (x + 0.66*wt, y + 0.75*ht);
curveVertex  (x + 0.8*wt, y + 0.9*ht);
curveVertex (x + 0.8*wt, y + 0.9*ht); //end point
endShape();

//lips
fill (255, 113, 123);
stroke(255, 113, 123);
strokeWeight(0);
arc(x + 0.5*wt, y + 0.77*ht, 0.3*wt, 0.1*ht, 0, PI, OPEN);

ellipse (x + 0.2*wt, y + 0.55*ht, 0.12*wt, 0.05*ht);
ellipse (x + 0.8*wt, y + 0.55*ht, 0.12*wt, 0.05*ht);


//moustache 
fill (183, 177, 177);
stroke(183, 177, 177);
strokeWeight(0);
arc(x + 0.5*wt, y + 0.78*ht, 0.5*wt, 0.33*ht, PI, TWO_PI, OPEN);

//hair
ellipse(x + 0.5*wt, y + 0.12*ht, 0.65*wt, 0.25*ht);


//glasses
stroke(0);
strokeWeight(5);
fill (242, 219, 176);
rect(x + 0.18*wt, y + 0.35*ht, 0.25*wt, 0.15*ht, 7);
rect(x + 0.6*wt, y + 0.35*ht, 0.25*wt, 0.15*ht, 7);
line (x + 0.43*wt, y + 0.38*ht, x + 0.6*wt, y + 0.38*ht);

//eyes
fill (255);
stroke (167, 141, 113);
strokeWeight(1);
ellipse (x + .3*wt, y + 0.42*ht, 0.15*wt, 0.1*ht);
ellipse (x + .72*wt, y + 0.42*ht, 0.15*wt, 0.1*ht);

stroke (255);
strokeWeight (0);
fill (0, 57, 255);
ellipse (x + .3*wt, y + 0.42*ht, 0.09*wt, 0.09*ht);
ellipse (x + .72*wt, y + 0.42*ht, 0.09*wt, 0.09*ht);
fill (0);
ellipse (x + .3*wt, y + 0.42*ht, 0.05*wt, 0.05*ht);
ellipse (x + .72*wt, y + 0.42*ht, 0.05*wt, 0.05*ht);




