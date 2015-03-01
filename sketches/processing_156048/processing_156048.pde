
mouseX = 100;
color pix[] = new color [800];
int currentpix = 0;
int rndcl = 0;
float sinrndcl = 1;
int pixshift = 1;
void setup() {
  size(800, 200);
  for (int i = 0; i < pix.length; i+=1) {
    pix[i] = color((int)(random(255)), random(255), random(255), 5);
  }
}

void draw() {

  for (int i = 0; i < width; i++) {
        currentpix = (i*mouseX)%pix.length;
    for (int j = 0; j < height; j++) {
      set (i, j, pix[(currentpix)]);
      // pix[currentpix] += color(   random(rndcl),random(rndcl),random(rndcl), 0    ); 
      pix[currentpix] += color(   rndcl, rndcl, rndcl, 0    );
    }
  }
/*  sinrndcl += 0.1;
  sinrndcl = sin(sinrndcl+((mouseY+1)/(mouseX+1)));
  rndcl = (int)(pow(sinrndcl*10, sinrndcl));
  println(rndcl);*/
  rndcl = mouseX/15;
 
}


