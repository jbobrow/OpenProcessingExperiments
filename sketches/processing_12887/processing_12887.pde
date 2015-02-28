
PImage bg;
PImage a, b, c, d, e, f, g, h, i;
float opacitya, opacityb, opacityc, opacityd, opacitye, opacityf, opacityg, opacityh, opacityi;  //opacity levels

float xl;  //left x limit
float xr;  //right x limit
float yt;  //top y limit
float yb;  //bottom y limit

void setup(){
   size(600, 400); 
   smooth();
   
   bg = loadImage("background.jpg");
   a = loadImage("youarehere.png");
   b = loadImage("seetheunseen.png");
   c = loadImage("exploreotherpaths.png");
   d = loadImage("gotheotherway.png");
   e = loadImage("exploreotherpaths.png");
   f = loadImage("gotheotherway.png");
   g = loadImage("seetheunseen.png");
   h = loadImage("exploreotherpaths.png");
   i = loadImage("seetheunseen.png");
}


void draw(){
  background(bg);
  fill(255);
  noStroke();
 
 tint(255, opacitya);
 image(a, 110, 200, a.width/2, a.height/2); 
 
  if (mouseX > 80 && mouseX < 125 && mouseY > 190 && mouseY < 215) {
    opacitya = 255;
  } else {
    opacitya = 0;
  }
 
 tint(255, opacityb);
 image(b, 180, 115, b.width/2, b.height/2); 
 
  if (mouseX > 153 && mouseX < 177 && mouseY > 113 && mouseY < 138) {
    opacityb = 255;
  } else {
    opacityb = 0;
  }
  
  tint(255, opacityc);
 image(c, 104, 342, c.width/2, c.height/2); 
 
  if (mouseX > 65 && mouseX < 104 && mouseY > 342 && mouseY < 365) {
    opacityc = 255;
  } else {
    opacityc = 0;
  }
  
  tint(255, opacityd);
 image(d, 299, 102, d.width/3, d.height/3); 
 
  if (mouseX > 273 && mouseX < 299 && mouseY > 102 && mouseY < 127) {
    opacityd = 255;
  } else {
    opacityd = 0;
  }
  
  tint(255, opacitye);
 image(e, 392, 172, e.width/2, e.height/2); 
 
  if (mouseX > 365 && mouseX < 392 && mouseY > 172 && mouseY < 193) {
    opacitye = 255;
  } else {
    opacitye = 0;
  }
  
  tint(255, opacityf);
 image(f, 377, 342, f.width/3, f.height/3); 
 
  if (mouseX > 354 && mouseX < 377 && mouseY > 342 && mouseY < 364) {
    opacityf = 255;
  } else {
    opacityf = 0;
  }
  
  tint(255, opacityg);
 image(g, 517, 275, g.width/3, g.height/3); 
 
  if (mouseX > 503 && mouseX < 527 && mouseY > 275 && mouseY < 302) {
    opacityg = 255;
  } else {
    opacityg = 0;
  }
  
  tint(255, opacityh);
 image(h, 519, 91, h.width/3, h.height/3); 
 
  if (mouseX > 506 && mouseX < 530 && mouseY > 91 && mouseY < 120) {
    opacityh = 255;
  } else {
    opacityh = 0;
  }
  
  tint(255, opacityi);
 image(i, 480, 37, i.width/3, i.height/3); 
 
  if (mouseX > 457 && mouseX < 480 && mouseY > 37 && mouseY < 62) {
    opacityi = 255;
  } else {
    opacityi = 0;
  } 

}

