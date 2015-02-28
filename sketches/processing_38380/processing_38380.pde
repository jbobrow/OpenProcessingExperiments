
void setup() {
  size(500, 500);
  colorMode(RGB, width);
  background(0);
  noLoop();
}

float a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r;

void draw() {
  background(0);
  float accuracy = width/10; 

  //set the origin to the center
  translate (width/2, height/2); 
  for (float z=0; z<360; z++) {
    rotate(radians(z));

    //creates green lines in the second layer
    if (c<(3*width/20) && c>-(3*width/20)) {
      if (d<(3*height/20) &&d>-(3*height/20)) {
        stroke(0, random(width), 0);
        line(0, 0, c, d);
      }
    }

    //creates blue lines in the third layer
    if (e<(2*width/10) && e>-(2*width/10)) {
      if (f<(2*height/10) && f>-(2*height/10)) {
        stroke(0, 0, random(width));
        line(0, 0, e, f);
      }
    }

    //creates yellow lines in the fourth layer
    if (g<width/4 && g>-width/4) {
      if (h<height/4 && h>-height/4) {
        stroke(random(width), width, 0);
        line(0, 0, g, h);
      }
    } 

    //creates blue/green lines in the fifth layer
    if (i<(3*width/10) && i>-(3*width/10)) {
      if (j<(3*height/10) && j>-(3*height/10)) {
        stroke(0, random(width), random(width));
        line(0, 0, i, j);
      }
    }

    //creates green lines in the sixth layer
    if (k<(7*width/20) && k>-(7*width/20)) {
      if (l<(7*height/20) && l>-(7*height/20)) {
        stroke(0, random(width), 0);
        line(0, 0, k, l);
      }
    }

    //creates blue lines in the seventh layer
    if (m<(4*width/10) && m>-(4*width/10)) {
      if (n<(4*height/10) && n>-(4*height/10)) {
        stroke(0, 0, random(width));
        line(0, 0, m, n);
      }
    }

    //creates blue/green lines in the eighth layer
    if (o<(9*width/20) && o>-(9*width/20)) {
      if (p<(9*height/20) && p>-(9*height/20)) {
        stroke(0, random(width), random(width));
        line(0, 0, o, p);
      }
    }
    //creates green line in the ninth layer
    if (q<width/2 && q>-width/2) {
      if (r<height/2 && r>-height/2) {
        stroke(0, random(width), 0);
        line(0, 0, q, r);
      }
    }

    //determines the accurracy of the lines to the prescribed restraints
    c= c+random(-accuracy, accuracy);
    d= d+random(-accuracy, accuracy);
    e= e+random(-accuracy, accuracy);
    f= f+random(-accuracy, accuracy);
    g= g+random(-accuracy, accuracy);
    h= h+random(-accuracy, accuracy);
    i= i+random(-accuracy, accuracy);
    j= j+random(-accuracy, accuracy);
    k= k+random(-accuracy, accuracy);
    l= l+random(-accuracy, accuracy);
    m= m+random(-accuracy, accuracy);
    n= n+random(-accuracy, accuracy);
    o= o+random(-accuracy, accuracy);
    p= p+random(-accuracy, accuracy);
    q= q+random(-accuracy, accuracy);
    r= r+random(-accuracy, accuracy);
  }

  //creates black lines coming from center on top layer
  for (float z=0; z<360; z++) { 
    rotate(radians(z));
    if (a<width/5 && a>-width/5) {
      if (b< height/5 && b>-height/5) {
        stroke(0);
        line(0, 0, a, b);  
        a= a+random(-5, 5); //determines the size of the black center
        b = b+random(-5, 5);
      }
    }
  }
}

//remakes a different iteration whenever the mouse is clicked
void mousePressed() {
  a=0;
  b=0;
  c=0;
  d=0;
  e=0;
  f=0;
  g=0;
  h=0;
  i=0;
  j=0;
  k=0;
  l=0;
  m=0;
  n=0;
  o=0;
  p=0;
  q=0;
  r=0;
  redraw();
}


