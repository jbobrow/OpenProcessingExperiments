
//Copyright Mina Kim 2014
//Name: Mina Kim, andrew id: minak
//minakim0128@gmail.com
//homework number 2, section: 51-257

size (400,400);
background (100,120,120);
noStroke ();



//face 
fill(255,228,196);
ellipse (200,200,200,220);

//ears
fill (255,228,196);
ellipse (150,200,130,80);
ellipse (250,200,130,80);

//hair
fill (100);
ellipse (200,110,130,60);

// eyes
fill (100);
ellipse (230,200,20,20);
ellipse (160,200,20,20);

//glass
fill (0,128,128);
rect (135,190,3,30);
rect (135,190,52,3);
rect (185,190,3,30);
rect (135,220,53,3);
rect (205,190,3,30);
rect (205,190,52,3);
rect (255,190,3,30);
rect (205,220,53,3);
rect (185,210,20,5);


//mouth
fill (240,128,128);
noStroke ();
float a=200;
float b=290;
float wd2=100;
float ht2=40;
beginShape();
  curveVertex(a-wd2,b-ht2);
  curveVertex(a,b);
  curveVertex(a+0.3*wd2,b-.7*ht2);
  curveVertex(a-0.3*wd2,b-.7*ht2);
  curveVertex(a,b);
  curveVertex(a+wd2,b-ht2);
endShape();

//bounding circle
noFill ();
ellipse (200,240,80,80);

//initial M as mustache
strokeWeight (5);
fill(245,255,250);
float x=200;
float y=240;
float wd=100;
float ht=20;
beginShape ();
  curveVertex (x,y);
  curveVertex (x-.4*wd,y+.8*ht);
  curveVertex (x-.2*wd,y-.3*ht);
  curveVertex (x,y+0.2*ht);
  curveVertex (x+.2*wd,y-.3*ht);
  curveVertex (x+.4*wd,y+.8*ht);
  curveVertex (x+.2*wd,y+.3*ht);
  curveVertex (x,y+0.5*ht);
  curveVertex (x-0.2*wd,y+.2*ht);
  curveVertex (x-.4*wd,y+.8*ht);
  curveVertex (x,y);
endShape ();


//saveFrame ("assignment2_caricature_of_jim");


