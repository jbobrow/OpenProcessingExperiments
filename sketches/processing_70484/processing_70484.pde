
void setup () {
  size(300, 300);
  background(112,161,191);
}

void draw () {
  noStroke ();
  
/* Sweater */
fill(11,30,57);
ellipse(150,100,150,170);
ellipse(150,255,190,210);
fill(32,81,111);
ellipse(150,265,180,210);
fill(11,30,57);
ellipse(150,255,170,210);

/* Head */
fill(0,0,0);
ellipse(150,110,130,150);

/* Face */
fill(121,93,50);
rect(100,70,100,50);
rect(115,55,74,20);
ellipse(150,125,130,120);

/* Eyebrows */
fill (0,0,0);

ellipse(126,90,33,25);
ellipse(172,90,33,25);

fill(121,93,50);
ellipse(126,93,35,20);
ellipse(172,93,35,20);

/* Shades */
fill(0,0,0);
ellipse(126,110,33,25);
ellipse(172,110,33,25);
rect (139,105,20,10);

/* Mouth */
ellipse(160,150,25,10);

/* Body */
fill(121,93,50);
rect(125,170,50,190);
fill(255,255,255);
rect(125,190,50,180);

}


