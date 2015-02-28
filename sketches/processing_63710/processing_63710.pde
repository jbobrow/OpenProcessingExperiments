
void setup(){
 size (600, 600);
 background (255);
 smooth();
}

void draw(){

  float d=map(mouseX,0, width, 45,110);
  
   background (255);
 
//chin bottom
fill (200);
stroke (100);
strokeWeight(3);
ellipseMode (CENTER);
ellipse (width/2, 485, d/2, d/2);

//earL bottom
fill (200);
stroke (100);
strokeWeight(3);
ellipseMode (CENTER);
ellipse (width/6+5, height/2, d, height/6+.3*d-2);

 
//earR bottom
fill (200);
stroke (100);
strokeWeight(3);
ellipseMode (CENTER);
ellipse (5*width/6-5, height/2,  d, width/6+.3*d-2);
//hair top
fill (200);
stroke(100);
strokeWeight(3);
triangle (width/2,height/6, (4.5*width/6)+ .3*d, (height/6)-.1*d, (5*width/6)-.4*d, height/2);

//head
fill (200);
stroke (100);
strokeWeight(3);
ellipseMode (CENTER);
ellipse (width/2, height/2, (2*width/3)+.1*d, (2*height/3)+.1*d);

//chin top
fill (200);
noStroke ();
ellipseMode (CENTER);
ellipse (width/2, 485, d/2-3, d/2-3);
 
 
//earL top
fill (200);
noStroke ();
ellipseMode (CENTER);
ellipse (width/6+5, height/2+5, d-3, height/6+.3*d-.5*d);
 
 
//earR top
fill (200);
noStroke ();
ellipseMode (CENTER);
ellipse (5*width/6-5, height/2+5,  d-3, width/6+.3*d-.5*d);
 
 
//eyeL
fill (255);
noStroke ();
arc (225, height/2, width/6, height/6, 0, PI*(d/50));
 
//eyeR
fill (255);
noStroke ();
arc (375, height/2, width/6, height/6, 0, PI*(d/50));
 
//eyeL
fill (255);
noStroke ();
arc (225, height/2, width/6, height/6, 0, PI);
 
//eyeR
fill (255);
noStroke ();
arc (375, height/2, width/6, height/6, 0, PI);
 
//eyeballL
fill (0);
noStroke ();
ellipseMode (CENTER);
arc (225, height/2, width/24, height/24, 0, PI*(d/50));
 
//eyeballR
fill (0);
noStroke ();
ellipseMode (CENTER);
arc (375, height/2, width/24, height/24,0, PI*(d/50));
 
//nostrilL
fill (255);
noStroke ();
ellipseMode (CENTER);
arc (275, 375, width/24-.1*d, height/24-.1*d, 0, PI);
 
//nostrilr
fill (255);
noStroke ();
ellipseMode (CENTER);
arc (325, 375, width/24-.1*d, height/24-.1*d, 0, PI);
 
//mouth
fill (255);
noStroke ();
rectMode (CENTER);
rect (300, 437, width/(d/4), d/2);
 
//hair top
fill (200);
noStroke();
triangle (width/2,height/6+2, 4.5*width/6-1, height/6+2, 5*width/6-2, height/2);

//hair streaks

fill (255);
stroke (255);
strokeWeight(5);
line (3.5*width/6, height/3, 4.75*width/6+.1*d, height/7);
line (3.5*width/6+20, height/3-1, 4.75*width/6+.1*d+20, height/7-1);
line (3.5*width/6+40, height/3-2, 4.75*width/6+.1*d+40, height/7-2);
line (3.5*width/6+60, height/3-4, 4.75*width/6+.1*d+60, height/7-4);
line (3.5*width/6+80, height/3-6, 4.75*width/6+.1*d+80, height/7-6);
line (3.5*width/6+100, height/3-8, 4.75*width/6+.1*d+100, height/7-8);
line (3.5*width/6+120, height/3-12, 4.75*width/6+.1*d+120, height/7-12);
}


