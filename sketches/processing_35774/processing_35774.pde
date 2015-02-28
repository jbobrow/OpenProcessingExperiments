
// homework 2, sep 1 2011
// copyright manuela kind 2011, cmu pittsburgh, pa 15289


//------------general------------------

size (400, 400);
background (255, 255, 255);
smooth();

//--------variables & ellipse----------

    ellipseMode(CENTER);

float x, y, wd, ht,a ;
x = 200;
y = 200;
wd= 300;
ht= 300;
a = 1;      //strokeWeight

    fill (160, 230, 230);
    noStroke ();

    ellipse (x, y, wd, ht);


//-------------curves-----------------

//------------g-shadow----------------
stroke(255, 255, 255);
strokeWeight(a*15);
noFill();

  beginShape();

    vertex (x+0.01*wd, y-0.51*ht);
    vertex (x-0.5*wd, y);  
    vertex (x, y+0.5*ht);
    vertex (x+0.5*wd, y);
    vertex (x, y);

  endShape();

//----------------g-------------------
stroke(200, 240, 240);
strokeWeight(a*13);

  beginShape();

    vertex (x+0.01*wd, y-0.51*ht);
    vertex (x-0.5*wd, y);  
    vertex (x, y+0.5*ht);
    vertex (x+0.5*wd, y);
    vertex (x, y);

  endShape();

//-----------shadow-m-----------------
strokeWeight(a*10);
stroke(255, 255, 255);

  beginShape();

    curveVertex (x+0.005*wd, y-0.1*ht);
      curveVertex (x+0.005*wd, y-0.1*ht);
      curveVertex (x+0.005*wd, y-0.3*ht);
      curveVertex (x+0.105*wd, y-0.1*ht);
      curveVertex (x+0.205*wd, y-0.3*ht);
      curveVertex (x+0.205*wd, y-0.1*ht);
    curveVertex (x+0.205*wd, y-0.1*ht);

endShape();

//----------------m-------------------

stroke(155, 225, 225);

beginShape();

  curveVertex (x, y-0.1*ht);
    curveVertex (x, y-0.1*ht);
     curveVertex (x, y-0.3*ht);
     curveVertex (x+0.1*wd, y-0.1*ht);
     curveVertex (x+0.2*wd, y-0.3*ht);
     curveVertex (x+0.2*wd, y-0.1*ht);
  curveVertex (x+0.2*wd, y-0.1*ht);

endShape();


//-----------shadow-m2----------------

stroke(255, 255, 255);

beginShape();

  curveVertex (x+0.005*wd, y+0.1*ht);
    curveVertex (x+0.005*wd, y+0.1*ht);
      curveVertex (x+0.005*wd, y+0.3*ht);
      curveVertex (x+0.105*wd, y+0.1*ht);
      curveVertex (x+0.205*wd, y+0.3*ht);
    curveVertex (x+0.205*wd, y+0.1*ht);
  curveVertex (x+0.205*wd, y+0.1*ht);

endShape();

//----------------m2------------------

stroke(155, 225, 225);

beginShape();

  curveVertex (x, y+0.1*ht);
    curveVertex (x, y+0.1*ht);
      curveVertex (x, y+0.3*ht);
      curveVertex (x+0.1*wd, y+0.1*ht);
      curveVertex (x+0.2*wd, y+0.3*ht);
    curveVertex (x+0.2*wd, y+0.1*ht);
  curveVertex (x+0.2*wd, y+0.1*ht);

endShape();

//-------------k-shadow---------------

stroke(255, 255, 255);

beginShape();

  curveVertex (x-0.095*wd, y-0.3*ht);
    curveVertex (x-0.095*wd, y-0.3*ht);

    curveVertex (x-0.095*wd, y+0.3*ht);
  curveVertex (x-0.095*wd, y+0.3*ht);

endShape();

beginShape();

  curveVertex (x-0.345*wd, y-0.3*ht);
    curveVertex (x-0.345*wd, y-0.3*ht);
    curveVertex (x-0.145*wd, y);
    curveVertex (x-0.345*wd, y+0.3*ht);
  curveVertex (x-0.345*wd, y+0.3*ht);

endShape();


//----------------k------------------
stroke(155, 225, 225);

beginShape();

  curveVertex (x-0.1*wd, y-0.3*ht);
    curveVertex (x-0.1*wd, y-0.3*ht);

    curveVertex (x-0.1*wd, y+0.3*ht);
  curveVertex (x-0.1*wd, y+0.3*ht);

endShape();

beginShape();

  curveVertex (x-0.35*wd, y-0.3*ht);
    curveVertex (x-0.35*wd, y-0.3*ht);
    curveVertex (x-0.15*wd, y);
    curveVertex (x-0.35*wd, y+0.3*ht);
  curveVertex (x-0.35*wd, y+0.3*ht);

endShape();



