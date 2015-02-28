
PImage hairl;
PImage hairr;
PImage nose; 
PImage cheeks;


void setup() {
  size(500, 500);
  smooth();
  frameRate(20);
  hairl = loadImage("hairleft.png");
  hairr = loadImage("hairright.png");
  nose = loadImage("nose-01.png");
  cheeks = loadImage("blush-01.png");
  
}

void draw()
{
  float pinkgb =map(mouseX, width/2, width, 255, 240);
    pinkgb = constrain (pinkgb, 240,255);
  background(255, pinkgb, pinkgb);

//eyebrows 150,250
  noFill();
  int brwgo=width/4;
  float browstrkw=map(mouseX, brwgo, width, 3, 23);
    browstrkw= constrain (browstrkw, 3, 23);
  float brwleftx=map(mouseX, brwgo, width, 110, 45);
    brwleftx= constrain (brwleftx, 45, 110);
  float brwlefty=map(mouseX, brwgo, width, 170,25);
    brwlefty= constrain(brwlefty,25, 170);
  float brwleftup=map(mouseX, brwgo, width,190,85);
    brwleftup=constrain(brwleftup,85,190);
  float brwleftxx=map(mouseX, brwgo, width,170,180);
     brwleftxx=constrain(brwleftxx,170,180);
  float brwleftyy=map(mouseX, brwgo, width, 180,105); 
    brwleftyy=constrain(brwleftyy,105,180);
  
  float brwrightx=map(mouseX, brwgo, width, 390, 455);
    brwrightx=constrain(brwrightx, 390,455);
  float brwrightxx=map(mouseX, brwgo,width, 330, 320);
    brwrightxx=constrain(brwrightxx, 320,330);

  if(mouseX<brwgo) {noStroke();}
  else{ strokeWeight(browstrkw); }
  
  bezier(brwleftx, brwlefty, 110, brwleftup-15, 150, brwleftup, brwleftxx, brwleftyy);
  bezier(brwrightx, brwlefty, 390, brwleftup-15, 350, brwleftup, brwrightxx, brwleftyy);
  
//hair
  float hrx=map(mouseX, 0, width, -150, -225);
    hrx=constrain(hrx,-225,-150);
  float hlx=map(mouseX, 0, width, -175, -250);
    hlx=constrain(hlx,-250,-175);
  image(hairl, -170, hrx, 500, 500);
  image(hairr, 200, hlx, 500, 500);

  stroke(0);
  strokeWeight(5);
  fill(255);

  float sescale=map(mouseX, 0, width, 20, 70);
    sescale=constrain(sescale,20,70);
  float sestroke=map(mouseX, 0, width, 10, 17);
    sestroke=constrain(sestroke,10,17);
  float selx=map(mouseX, 0, width, 150, 90);
    selx=constrain(selx,90,150);
  float sely=map(mouseX, 0, width, 250, 160);
    sely=constrain(sely, 160,250);
  float serx=map(mouseX, 0, width, 350, 420); 
    serx=constrain(serx,350,420);

  float lashx=map(mouseX, 0, width, 120, 20);
    lashx=constrain(lashx,20,120);
  float lashy=map(mouseX, 0, width, 240, 140);
    lashy=constrain(lashy, 140,240);
  float lash2x=map(mouseX, 0, width, 380, 485);
    lash2x=constrain(lash2x,380,485);


//lashes
  line(selx, sely, lashx, lashy); 
  line(selx, sely, lashx+10, lashy-10); 
  line(selx, sely, lashx+20, lashy-20);
  line(serx, sely, lash2x, lashy); 
  line(serx, sely, lash2x-10, lashy-10); 
  line(serx, sely, lash2x-20, lashy-20);

//eyes big
  float bescalex=map(mouseX, 0, width, 40, 150); bescalex= constrain (bescalex, 40, 150);
  float belx=map(mouseX, 0, width, 150, 110); belx=constrain(belx,110,150);
  float bely=map(mouseX, 0, width, 250, 170); bely=constrain(bely,170, 250);
  float berx=map(mouseX, 0, width, 350, 400); berx=constrain(berx, 350, 400);
  ellipse(belx, bely, bescalex, bescalex);
  ellipse(berx, bely, bescalex, bescalex);

//eyes small
  strokeWeight(sestroke);
  ellipse(selx, sely, sescale, sescale);
  ellipse(serx, sely, sescale, sescale);

//nose    
  image(nose, 0, hrx+180, 500, 500);
  
  
//mouth

  strokeWeight(5);
  float leftbx=map(mouseX, 0, width, 234, 80); leftbx=constrain(leftbx, 80,234);
  float bottomy=map(mouseX, 0, width, 370, 470); bottomy=constrain(bottomy, 370,470);
  float rightbx=map(mouseX, 0, width, 273, 420); rightbx=constrain(rightbx,273, 420);
  float middley=map(mouseX, 0, width, 366, 450); middley=constrain(middley, 366, 450);
  float topleftx=map(mouseX, 0, width, 245, 145); topleftx=constrain(topleftx, 145,245);
  float toprightx=map(mouseX, 0, width, 260, 350); toprightx=constrain(toprightx, 260,350);
  float topy=map(mouseX, 0, width, 350, 275); topy=constrain(topy,275,350);
  
  beginShape();
  curveVertex(250,middley);
  curveVertex(leftbx,bottomy);
  curveVertex(topleftx,topy);
  curveVertex(toprightx,topy);
  curveVertex(rightbx,bottomy);
  curveVertex(250,middley);
  curveVertex(leftbx,bottomy);
  curveVertex(topleftx,topy);
  endShape();
  
//teeth
  int teethgo=width/2;
  noFill();
  float teethstrk=map(mouseX,brwgo,width, 4, 5); teethstrk=constrain(teethstrk,4,5);
    
  if(mouseX<brwgo) {noStroke();}
  else { strokeWeight(teethstrk); }
  
  int tty= 336;
  
  float t1x=map(mouseX,brwgo,width, 225, 183); t1x=constrain(t1x, 183,225);
  float t1y=map(mouseX,brwgo,width, tty, 325); t1y=constrain(t1y, 325, tty);
  float t2x=map(mouseX,brwgo,width, 233, 214); t2x=constrain(t2x,214,233);
  float t2y=map(mouseX,brwgo,width, 325, 268);t2y=constrain(t2y, 268, 325);
  float t3x=map(mouseX,brwgo,width, 243, 240);t3x=constrain(t3x, 240,243); 
  float t3y=map(mouseX,brwgo,width, tty, 317);t3y=constrain(t3y, 317, tty);
  float t4x=map(mouseX,brwgo,width, 251, 269);t4x=constrain(t4x, 251,269);
  float t4y=map(mouseX,brwgo,width, 323, 266);t4y=constrain(t4y,266,323);
  float t5x=map(mouseX,brwgo,width, 261, 290);t5x=constrain(t5x,261,290);
  float t5y=map(mouseX,brwgo,width, tty, 333);t5y=constrain(t5y,333,tty);
  float t6x=map(mouseX,brwgo,width, 272, 315);t6x=constrain(t6x,272,315);
  float t6y=map(mouseX,brwgo,width, 326, 275);t6y=constrain(t6y, 275,326);
  float t7x=map(mouseX,brwgo,width, 278, 333);t7x=constrain(t7x, 278,333);
  float t7y=map(mouseX,brwgo,width, tty, 326);t7y=constrain(t7y, 326,tty);
  
  float tleftx=map(mouseX,brwgo,width, 211, 142); tleftx=constrain(tleftx,142,211);
  float t8x=map(mouseX,brwgo,width, 220, 176);t8x=constrain(t8x,176,220);
  float t8y=map(mouseX,brwgo,width, 387, 404);t8y=constrain(t8y,387,404);
  float t9x=map(mouseX,brwgo,width, 233, 196);t9x=constrain(t9x,196,233);
  float t9y=map(mouseX,brwgo,width, 391, 448);t9y=constrain(t9y, 391,448);
  float t10x=map(mouseX,brwgo,width, 244, 228);t10x=constrain(t10x,228,244);
  
  float t11x=map(mouseX,brwgo,width, 258, 253); t11x=constrain(t11x,253,258);
  float t11y=map(mouseX,brwgo,width, 388, 435);t11y=constrain(t11y,388,435);
  float t12x=map(mouseX,brwgo,width, 274, 290);t12x=constrain(t12x,274,290);
  float t12y=map(mouseX,brwgo,width, 383, 389);t12y=constrain(t12y, 383,389);
  float t13x=map(mouseX,brwgo,width, 286, 308);t13x=constrain(t13x, 286,308);
  float t13y=map(mouseX,brwgo,width, 395, 450);t13y=constrain(t13y, 395,450);
  float t14x=map(mouseX,brwgo,width, 299, 345);t14x=constrain(t14x, 299,345);
  float t14y=map(mouseX,brwgo,width, 389, 407);t14y=constrain(t14y, 389,407);
  float trightx=map(mouseX,brwgo,width, 302, 365);trightx=constrain(trightx, 302,365);
  float trighty=map(mouseX,brwgo,width, 395,472);trighty=constrain(trighty, 395,472);
 
  beginShape(); 
  curveVertex(topleftx,topy); curveVertex(topleftx,topy);
  curveVertex(t1x, t1y);
  curveVertex(t2x, t2y); curveVertex(t2x,t2y);
  endShape();
  
  beginShape(); 
  curveVertex(t2x, t2y); curveVertex(t2x, t2y);
  curveVertex(t3x, t3y);
  curveVertex(t4x, t4y); curveVertex(t4x,t4y);
  endShape();
  
  beginShape(); 
  curveVertex(t4x, t4y); curveVertex(t4x, t4y);
  curveVertex(t5x, t5y);
  curveVertex(t6x, t6y); curveVertex(t6x,t6y);
  endShape();
  
  beginShape(); 
  curveVertex(t6x, t6y); curveVertex(t6x, t6y);
  curveVertex(t7x, t7y);
  curveVertex(toprightx, topy); curveVertex(toprightx,topy);
  endShape();
  
  beginShape(); 
  curveVertex(tleftx, trighty); curveVertex(tleftx, trighty);
  curveVertex(t8x, t8y);
  curveVertex(t9x, t9y); curveVertex(t9x,t9y);
  endShape();
  
  beginShape(); 
  curveVertex(t9x, t9y); curveVertex(t9x, t9y);
  curveVertex(t10x, 386);
  curveVertex(t11x, t11y); curveVertex(t11x,t11y);
  endShape();
  
  beginShape(); 
  curveVertex(t11x, t11y); curveVertex(t11x, t11y);
  curveVertex(t12x, t12y);
  curveVertex(t13x, t13y); curveVertex(t13x,t13y);
  endShape();
  
  beginShape(); 
  curveVertex(t13x, t13y); curveVertex(t13x, t13y);
  curveVertex(t14x, t14y);
  curveVertex(trightx, trighty); curveVertex(trightx, trighty);
  endShape();

//cheeks

int chekgo = width-200;
float chr = random(2, 7);

  float ch=map(mouseX,chekgo,width, 25,0); ch=constrain(ch,0,25);
  float chs=map(mouseX,chekgo,width, 450,500);chs=constrain(chs, 450,500);

  if(mouseX> chekgo) {image(cheeks, ch,ch+chr, chs,chs);}
  else { }

 
//wrinkle
  
  
  float liplx=map(mouseX,0,width, 250,205); liplx=constrain(liplx,205,250);
  float liply=map(mouseX,0,width, 378, 473);liply=constrain(liply, 378,473);
  float lipmy=map(mouseX,0,width, 376,464);lipmy=constrain(lipmy,376,464);
  float liprx=map(mouseX,0,width, 260, 298);liprx=constrain(liprx, 260,298);
  
  beginShape(); 
  curveVertex(liplx,liply); curveVertex(liplx,liply);
  curveVertex(253, lipmy);
  curveVertex(liprx,liply); curveVertex(liprx,liply);
  endShape();
 
}


