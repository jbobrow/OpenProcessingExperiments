
int page = 1;
float y = 0;
float x = 0;
float y1 = 220;
float y2 = 355;

PImage a;
PImage a1;
PImage b;
PImage b1;
PImage c;
PImage c1;
PImage d;
PImage e;
PImage f;
PImage g;
PImage g1;
PImage h;
PImage i;
PImage j;
PImage k;
PImage l;
PImage m;
PImage n;
PImage o;
PImage o1;
PImage p;
PImage q;
PImage r;
PImage s;
PImage t;

PImage bkey;
PImage blood;
PImage eye;
PImage hands;
PImage heart;
PImage key1;
PImage music1;
PImage music2;
PImage music3;
PImage music4;
PImage music5;
PImage music6;
PImage music7;
PImage spark;
PImage tear;
PImage red1;

void setup(){
  size(640, 480);
  smooth();
  background(0);
  frameRate(30);

  a = loadImage ("1.png");
  a1 = loadImage ("1a.png");
  b = loadImage ("2.png");
  b1 = loadImage ("2a.png");
  c = loadImage ("3.png");
  c1 = loadImage ("3a.png");
  d = loadImage ("4.png");
  e = loadImage ("5.png");
  f = loadImage ("6.png");
  g = loadImage ("7.png");
  g1 = loadImage ("7a.png");
  h = loadImage ("8.png");
  i = loadImage ("9.png");
  j = loadImage ("10.png");
  k = loadImage ("11.png");
  l = loadImage ("12.png");
  m = loadImage ("13.png");
  n = loadImage ("14.png");
  o = loadImage ("15.png");
  o1 = loadImage ("15a.png");
  p = loadImage ("16a.png");
  q = loadImage ("17.png");
  r = loadImage ("18.png");
  s = loadImage ("19a.png");
  t = loadImage ("20.png");
  
  bkey = loadImage ("bkey.png");
  blood = loadImage ("blood.png");
  eye = loadImage ("eye.png");
  hands = loadImage ("hands.png");
  heart = loadImage ("heart.png");
  key1 = loadImage ("key.png");
  music1 = loadImage ("music1.png");
  music2 = loadImage ("music2.png");
  music3 = loadImage ("music3.png");
  music4 = loadImage ("music4.png");
  music5 = loadImage ("music5.png");
  music6 = loadImage ("music6.png");
  music7 = loadImage ("music7.png");
  spark = loadImage ("spark.png");
  tear = loadImage ("tear.png");
  red1 = loadImage ("red.png");
  
}

//page animation/////////////////////////////////////////////////////////////
void draw(){
  if (page == 1) {
    
   y = y + 2;
   if(y > height+470) {
     y = 0;
   }
    image(a, 0, 0);
      pushMatrix();
        translate(150, y-420);
        rotate(radians(frameCount*3));
        image(key1, -23, -38);
      popMatrix();
      pushMatrix();
        translate(250, y-300);
        rotate(radians(-(frameCount+50)));
        image(key1, -23, -38);
      popMatrix();
      pushMatrix();
        translate(112, y-210);
        rotate(radians(frameCount));
        image(key1, -23, -38);
      popMatrix();
      pushMatrix();
        translate(177, y-121);
        rotate(radians(frameCount*2.5));
        image(bkey, -30, -37);
      popMatrix();
      pushMatrix();
        translate(130, y-50);
        rotate(radians(-(frameCount+10)*1.5));
        image(key1, -23, -38);
      popMatrix();
    image(a1, 0, 0);
    
   noCursor();
   
   image(key1, mouseX-27, mouseY-50);
  
 
  }else if (page == 2) {
    image (b, 0, 0);
    
    image(key1, mouseX-27, mouseY-50);
    
    if(mouseX > 15 && mouseX < 324 && mouseY > 312 && mouseY < 436){
      image(b1, 0, 0);
      
       y2 = y2 + 4;
       if(y2 > height) {
       y2 = 355;
       }
        pushMatrix();
           translate (310, y2);
           image(red1, 0, 0);
        popMatrix();
        
        image(blood, mouseX-25, mouseY-25);
    }   
 
  }else if (page == 3) {
    y1 = y1 + .5;
    if(y1 > 238) {
      y1 = 220;
    }
     image (c, 0, 0);
       pushMatrix();
         translate(203, y1);
         image(tear, 0, 0);
       popMatrix();
     image(c1, 0, 0);
     
     image(key1, mouseX-27, mouseY-50);
 
  }else if (page == 4) {
    image (d, 0, 0);
    
    image(heart, mouseX-25, mouseY-25);
 
  }else if (page == 5) {
    image (e, 0, 0);
      pushMatrix();
       translate(319, 109);
        pushMatrix();
          translate(-3, -4);
          rotate(radians(frameCount*50));
          image(spark, -26, -23);
        popMatrix();
        pushMatrix();
          translate(0, -15);
          rotate(radians(frameCount*50));
          image(spark, -26, -23);
        popMatrix();
        pushMatrix();
          translate(10, -11);
          rotate(radians(frameCount*50));
          image(spark, -26, -23);
        popMatrix();
        pushMatrix();
          translate(-10, -10);
          rotate(radians(frameCount*50));
          image(spark, -26, -23);
        popMatrix();
        pushMatrix();
          translate(-16, 0);
          rotate(radians(frameCount*50));
          image(spark, -26, -23);
        popMatrix();
        pushMatrix();
          translate(19, 0);
          rotate(radians(frameCount*50));
          image(spark, -26, -23);
        popMatrix();
        pushMatrix();
          translate(5, 0);
          rotate(radians(frameCount*50));
          image(spark, -26, -23);
        popMatrix();
        pushMatrix();
          translate(0, 2);
          rotate(radians(frameCount*50));
          image(spark, -26, -23);
        popMatrix();
        pushMatrix();
          translate(-10, 10);
          rotate(radians(frameCount*50));
          image(spark, -26, -23);
        popMatrix();
        pushMatrix();
          translate(13, 12);
          rotate(radians(frameCount*50));
          image(spark, -26, -23);
        popMatrix();
        pushMatrix();
          translate(0, 15);
          rotate(radians(frameCount*50));
          image(spark, -26, -23);
        popMatrix(); 
      popMatrix();
      
      image(spark, mouseX-27, mouseY-24);
 
  }else if (page == 6) {
    x = x + 2;
     if(x > width+440) {
       x = 0;
     }
      image (f, 0, 0);
        pushMatrix();
          translate(x-428, 414);
          rotate(radians(frameCount*10));
          image(music1, -25, -25);
        popMatrix();
        pushMatrix();
          translate(x-403, 343);
          rotate(radians(frameCount*10));
          image(music2, -25, -25);
        popMatrix();
        pushMatrix();
          translate(x-263, 327);
          rotate(radians(frameCount*10));
          image(music3, -25, -25);
        popMatrix();
        pushMatrix();
          translate(x-146, 244);
          rotate(radians(frameCount*10));
          image(music4, -25, -25);
        popMatrix();
        pushMatrix();
          translate(x-162, 202);
          rotate(radians(frameCount*10));
          image(music5, -25, -25);
        popMatrix();
        pushMatrix();
          translate(x-72, 168);
          rotate(radians(frameCount*10));
          image(music6, -25, -25);
        popMatrix();
        pushMatrix();
          translate(x-1, 78);
          rotate(radians(frameCount*10));
          image(music7, -25, -25);
        popMatrix();
   
  image(heart, mouseX-25, mouseY-25);
 
  }else if (page == 7) {
    image (g, 0, 0);
    
    image(spark, mouseX-27, mouseY-24);
    
  }else if (page == 8) {
    image (h, 0, 0);
    x = 0; 
    y = 0;
   if (mouseX > 366 && mouseX < 606 && mouseY > 312 && mouseY < 410) {
    x += random(-2, 2);
    y += random(-2, 2);
  }
  image(g1, x, y);
  
  image(bkey, mouseX-26, mouseY-46);
 
  }else if (page == 9) {
    image (i, 0, 0);
    
    image(key1, mouseX-27, mouseY-50);
 
  }else if (page == 10) {
    image (j, 0, 0);
 
         pushMatrix();
          translate(48,27);
          rotate(radians(frameCount*10));
           image(spark, -26, -24);
        popMatrix();
        pushMatrix();
          translate(65, 22);
          rotate(radians(frameCount*10));
           image(spark, -26, -24);
        popMatrix();
        pushMatrix();
          translate(91, 19);
          rotate(radians(frameCount*10));
           image(spark, -26, -24);
        popMatrix();
        pushMatrix();
          translate(122, 18);
          rotate(radians(frameCount*10));
           image(spark, -26, -24);
        popMatrix();
        pushMatrix();
          translate(166, 19);
          rotate(radians(frameCount*10));
           image(spark, -26, -24);
        popMatrix();
        pushMatrix();
          translate(197, 24);
          rotate(radians(frameCount*10));
           image(spark, -26, -24);
        popMatrix();
        pushMatrix();
          translate(221, 26);
          rotate(radians(frameCount*10));
           image(spark, -26, -24);
        popMatrix();
        pushMatrix();
          translate(238, 29);
          rotate(radians(frameCount*10));
           image(spark, -26, -24);
        popMatrix();
        
        image(spark, mouseX-27, mouseY-24);

  }else if (page == 11) {
    image (k, 0, 0);
    
    image(spark, mouseX-27, mouseY-24);
 
  }else if (page == 12) {
    image (l, 0, 0);
    if (mouseX > 371 && mouseX < 605 && mouseY > 317 && mouseY < 413) {
      image(heart, 68, 55);
      image(heart, 295, 184);
      image(heart, 510, 239);
      image(heart, 373, 397);
      image(heart, 39, 388);
    }
    
    image(spark, mouseX-27, mouseY-24);
 
  }else if (page == 13) {
    image (m, 0, 0);
      image(blood, mouseX-25, mouseY-25);
 
  }else if (page == 14) {
    image (n, 0, 0);
    
    noStroke();
    image(blood, mouseX-25 , mouseY-25);
            
    stroke(255, 0, 0);
    line(mouseX, mouseY, pmouseX, pmouseY);
    line(mouseX+5, mouseY+5, pmouseX, pmouseY);
    line(mouseX-5, mouseY-5, pmouseX, pmouseY);
 
  }else if (page == 15) {
    image(o, 0, 0);
    x = 0;
    y = 0;
      image(eye, 0, 0);
            
    if ((mouseX > 131 && mouseX < 223 && mouseY > 357 && mouseY < 396)
   || (mouseX > 522 && mouseX < 614 && mouseY > 416 && mouseY < 448)) {
    x += random(-.2, .2);
    y += random(-.2, .2);
    image(o1, 0, 0);
  }
  image(hands, x+64, y+238);
  
  image(spark, mouseX-27, mouseY-24);
 
  }else if (page == 16) {
    if(mouseX > 432 && mouseX < 611 && mouseY > 367 && mouseY < 439) {
      background(0);
    }
     image(p, 0, 0);
     image(blood, mouseX-25 , mouseY-25);
      
 
  }else if (page == 17) {
    image(q, 0, 0);
    
    image(spark, mouseX-27, mouseY-24);
 
  }else if (page == 18) {
    image(r, 0, 0);
    
    image(spark, mouseX-27, mouseY-24);
 
  }else if (page == 19) {
    if(mouseX > 522 && mouseX < 614 && mouseY > 416 && mouseY < 448) {
      background(0);
    }
    image(s, 0, 0);
           
    image(blood, mouseX-25 , mouseY-25);
    
  }else if (page == 20) {
    image(t, 0, 0);
    
    y = y + 2;
   if(y > height+470) {
     y = 0;
   }
      pushMatrix();
        translate(148, y-24);
        rotate(radians(frameCount*3));
        image(spark, -25, -25);
      popMatrix();
      pushMatrix();
        translate(41, y-184);
        rotate(radians(-(frameCount+50)));
        image(spark, -25, -25);
      popMatrix();
      pushMatrix();
        translate(130, y-445);
        rotate(radians(frameCount));
        image(spark, -25, -25);
      popMatrix();
      pushMatrix();
        translate(239, y-119);
        rotate(radians(frameCount*2.5));
        image(spark, -25, -25);
      popMatrix();
      pushMatrix();
        translate(296, y-247);
        rotate(radians(-(frameCount+10)*1.5));
        image(spark, -25, -25);
      popMatrix();
      pushMatrix();
        translate(597, y-61);
        rotate(radians(-(frameCount)*1.5));
        image(spark, -25, -25);
      popMatrix();
      pushMatrix();
        translate(498, y-305);
        rotate(radians((frameCount+10)*2));
        image(spark, -25, -25);
      popMatrix();
    
    if(mouseX > 466 && mouseX < 617 && mouseY > 400 && mouseY < 455) {
      image(heart, 16, 65);
      image(heart, 471, 12);
      image(heart, 395, 160);
      image(heart, 187, 208);
      image(heart, 525, 347);
    }
    
    image(heart, mouseX-25, mouseY-25);
  }
}

//change page///////////////////////////////////////////////////////////////
void mousePressed() {
  if (page == 1) {
    if (mouseX > 505 && mouseX < 630 && mouseY > 406 && mouseY < 452) {
      page = 2;
    }
  }else if (page == 2) {
    if(mouseX > 15 && mouseX < 324 && mouseY > 312 && mouseY < 436) {
      page = 3;
    }
  }else if (page == 3) {
    if (mouseX > 522 && mouseX < 614 && mouseY > 416 && mouseY < 448) {
      page = 4;
    }
  }else if (page == 4) {
    if (mouseX > 340 && mouseX < 432 && mouseY > 284 && mouseY < 316) {
      page = 5;
    }else if (mouseX > 522 && mouseX < 614 && mouseY > 416 && mouseY < 448) {
      page = 6;
    }
  }else if (page == 5) {
    if (mouseX > 28 && mouseX < 118 && mouseY > 417 && mouseY < 449) {
      page = 9;
    }else if (mouseX > 522 && mouseX < 614 && mouseY > 416 && mouseY < 448) {
      page = 6;
    }
  }else if (page == 6) {
    if (mouseX > 522 && mouseX < 614 && mouseY > 416 && mouseY < 448) {
      page = 7;
    }
  }else if (page == 7) {
    if (mouseX > 17 && mouseX < 109 && mouseY > 324 && mouseY < 357) {
      page = 9;
    }if (mouseX > 522 && mouseX < 614 && mouseY > 416 && mouseY < 448) {
      page = 8;
    }
  }else if (page == 8) {
    if (mouseX > 366 && mouseX < 606 && mouseY > 312 && mouseY < 410) {
      page = 1;
    }
  }else if (page == 9) {
    if (mouseX > 522 && mouseX < 614 && mouseY > 416 && mouseY < 448) {
      page = 10;
    }
  }else if (page == 10) {
    if (mouseX > 522 && mouseX < 614 && mouseY > 416 && mouseY < 448) {
      page = 11;
    }
  }else if (page == 11) {
    if (mouseX > 25 && mouseX < 110 && mouseY > 415 && mouseY < 451) {
      page = 13;
    }else if(mouseX > 522 && mouseX < 614 && mouseY > 416 && mouseY < 448) {
      page = 12;
    }
  }else if (page == 12) {
    if (mouseX > 371 && mouseX < 605 && mouseY > 317 && mouseY < 413) {
      page = 1;
    }
  }else if (page == 13) {
    if (mouseX > 522 && mouseX < 614 && mouseY > 416 && mouseY < 448) {
      page = 14;
    }
  }else if (page == 14) {
    if (mouseX > 50 && mouseX < 137 && mouseY > 32 && mouseY < 66) {
      page = 15;
    }
  }else if (page == 15) {
    if (mouseX > 131 && mouseX < 223 && mouseY > 357 && mouseY < 396) {
      page = 17;
    }else if (mouseX > 522 && mouseX < 614 && mouseY > 416 && mouseY < 448) {
      page = 16;
    }
  }else if (page == 16) {
    if(mouseX > 432 && mouseX < 611 && mouseY > 367 && mouseY < 439) {
      page = 1;
    }
  }else if (page == 17) {
    if(mouseX > 522 && mouseX < 614 && mouseY > 416 && mouseY < 448) {
      page = 18;
    }
  }else if (page == 18) {
    if(mouseX > 522 && mouseX < 614 && mouseY > 416 && mouseY < 448) {
      page = 19;
    }
  }else if (page == 19) {
    if(mouseX > 21 && mouseX < 110 && mouseY > 376 && mouseY < 412) {
      page = 20;
    }
  }else if (page == 20) {
    if(mouseX > 466 && mouseX < 617 && mouseY > 400 && mouseY < 455) {
      page = 1;
    }
  }
}

