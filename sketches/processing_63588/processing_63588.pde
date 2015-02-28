
 
PImage img1a;
PImage img1b;
PImage img2a;
PImage img2b;
PImage img3a;
PImage img3b;
PImage img4a;
PImage img4b;
void setup() {
  size(1326, 498);
  img1a =loadImage ("1a.png");
  img1b =loadImage ("1b.png");
  img2a =loadImage ("2a.png");
  img2b =loadImage ("2b.png");
  img3a =loadImage ("3a.png");
  img3b =loadImage ("3b.png");
  img4a =loadImage ("4a.png");
  img4b =loadImage ("4b.png");
   
}
void draw() {
  frameRate(30);
  background(255);
  
  image(img1a, 0, 1);
//  image(img1b, 0, 0);
  image(img2a, 332, 0);
//  image(img2b, 332, 0);
  image(img3a, 680, 0);
//  image(img3b, 680, 0);
  image(img4a, 995, 1);
//  image(img4b, 995, 0);
  
  if ((mouseX<=331) && (mouseX>=0) && (mousePressed==true)) {
    background(255);
    image(img1b, 0, 1);
 //   tint(255,102);
    image(img2a, 332, 0);
    image(img3a, 680, 0);
    image(img4a, 995, 1);
 //   noTint();
  } else if ((mouseX<=331) && (mouseX>=0) && (mousePressed==false)) {
       background(255);
       tint(255,200);
       image(img1a, 0, 1);
       noTint();
       image(img2a, 332, 0);
       image(img3a, 680, 0);
       image(img4a, 995, 1);
    }
   
  if ((mouseX<=679) && (mouseX>=332) && (mousePressed==true)) {
    background(255);
    tint(255,200);
    image(img2a, 332,0);
    noTint();
    image(img2b, 332,0);
    image(img1a, 0, 1);
    image(img3a, 680, 0);
    image(img4a, 995, 1);
   } else if ((mouseX<=679) && (mouseX>=332) && (mousePressed==false)) {
     background(255);
     tint(255,200);
     image(img2a, 332,0);
     noTint();
     image(img1a, 0, 1);
     image(img3a, 680, 0);
     image(img4a, 995, 1);
   }
     
     
    if ((mouseX<=994) && (mouseX>=680) && (mousePressed==true)) {
    background(255);
    image(img3b, 680, 0);
    image(img2a, 332, 0);
    image(img1a, 0, 1);
    image(img4a, 995, 1);
   } else if ((mouseX<=994) && (mouseX>=680) && (mousePressed==false)) {
     background(255);
     tint(255,200);
    image(img3a, 680, 0);
    noTint();
    image(img2a, 332, 0);
    image(img1a, 0, 1);
    image(img4a, 995, 1);
   }
     
     if ((mouseX<=1325) && (mouseX>=995) && (mousePressed==true)) {
    background(255);
    image(img4b, 995, 1);
    image(img2a, 332, 0);
    image(img3a, 680, 0);
    image(img1a, 0, 1);
   } else if ((mouseX<=1325) && (mouseX>=995) && (mousePressed==false)) {
    background(255);
    tint(255,200);
    image(img4a, 995, 1);
    noTint();
    image(img2a, 332, 0);
    image(img3a, 680, 0);
    image(img1a, 0, 1);
   }
}


