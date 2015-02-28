
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;

PImage img11;
PImage img21;
PImage img31;
PImage img41;
PImage img51;
PImage img61;
PImage img71;

PImage img12;
PImage img22;
PImage img32;
PImage img42;
PImage img52;
PImage img62;
PImage img72;

PImage img13;
PImage img23;
PImage img33;
PImage img43;
PImage img53;
PImage img63;
PImage img73;

PImage img14;
PImage img24;
PImage img34;
PImage img44;
PImage img54;
PImage img64;
PImage img74;

PImage img15;
PImage img25;
PImage img35;
PImage img45;
PImage img55;
PImage img65;
PImage img75;

PImage img16;
PImage img26;
PImage img36;
PImage img46;
PImage img56;
PImage img66;
PImage img76;

void setup() {
  
  img1 = loadImage("Animation000.jpg");
  img2 = loadImage("Animation001.jpg");
  img3 = loadImage("Animation002.jpg");
  img4 = loadImage("Animation003.jpg");
  img5 = loadImage("Animation004.jpg");
  img6 = loadImage("Animation005.jpg");
  img7 = loadImage("Animation006.jpg");

  img11 = loadImage("1Animation000.jpg");
  img21 = loadImage("1Animation001.jpg");
  img31 = loadImage("1Animation002.jpg");
  img41 = loadImage("1Animation003.jpg");
  img51 = loadImage("1Animation004.jpg");
  img61 = loadImage("1Animation005.jpg");
  img71 = loadImage("1Animation006.jpg");
  
  img12 = loadImage("2Animation000.jpg");
  img22 = loadImage("2Animation001.jpg");
  img32 = loadImage("2Animation002.jpg");
  img42 = loadImage("2Animation003.jpg");
  img52 = loadImage("2Animation004.jpg");
  img62 = loadImage("2Animation005.jpg");
  img72 = loadImage("2Animation006.jpg");
  
  img13 = loadImage("3Animation000.jpg");
  img23 = loadImage("3Animation001.jpg");
  img33 = loadImage("3Animation002.jpg");
  img43 = loadImage("3Animation003.jpg");
  img53 = loadImage("3Animation004.jpg");
  img63 = loadImage("3Animation005.jpg");
  img73 = loadImage("3Animation006.jpg");

  img14 = loadImage("4Animation000.jpg");
  img24 = loadImage("4Animation001.jpg");
  img34 = loadImage("4Animation002.jpg");
  img44 = loadImage("4Animation003.jpg");
  img54 = loadImage("4Animation004.jpg");
  img64 = loadImage("4Animation005.jpg");
  img74 = loadImage("4Animation006.jpg");
  
  img15 = loadImage("5Animation000.jpg");
  img25 = loadImage("5Animation001.jpg");
  img35 = loadImage("5Animation002.jpg");
  img45 = loadImage("5Animation003.jpg");
  img55 = loadImage("5Animation004.jpg");
  img65 = loadImage("5Animation005.jpg");
  img75 = loadImage("5Animation006.jpg");
  
  
  img16 = loadImage("6Animation000.jpg");
  img26 = loadImage("6Animation001.jpg");
  img36 = loadImage("6Animation002.jpg");
  img46 = loadImage("6Animation003.jpg");
  img56 = loadImage("6Animation004.jpg");
  img66 = loadImage("6Animation005.jpg");
  img76 = loadImage("6Animation006.jpg");

  size(1024, 532);
}



void draw() {
  if (mouseY >0 && mouseY < 76 && mouseX > 878 && mouseX < 1024){ 
  image(img76, 0, 0);
  }
   if (mouseY >76 && mouseY < 152 && mouseX > 878 && mouseX <1024){ 
  image(img75, 0, 0);
  }
   if (mouseY >152 && mouseY < 228 && mouseX > 878 && mouseX <1024){ 
  image(img74, 0, 0);
  }
   if (mouseY >228 && mouseY < 304 && mouseX > 878 && mouseX <1024){ 
  image(img73, 0, 0);
  }
   if (mouseY >304 && mouseY < 380 && mouseX > 878 && mouseX <1024){ 
  image(img72, 0, 0);
  }
   if (mouseY >380 && mouseY < 456 && mouseX > 878 && mouseX <1024){ 
  image(img71, 0, 0);
  }
   if (mouseY >456 && mouseY < 532 && mouseX > 878 && mouseX <1024){ 
  image(img7, 0, 0);
  }
  
  
  if (mouseY >0 && mouseY < 76 && mouseX > 731 && mouseX < 878){ 
  image(img66, 0, 0);
  }
   if (mouseY >76 && mouseY < 152 && mouseX > 731 && mouseX <878){ 
  image(img65, 0, 0);
  }
   if (mouseY >152 && mouseY < 228 && mouseX > 731 && mouseX <878){ 
  image(img64, 0, 0);
  }
   if (mouseY >228 && mouseY < 304 && mouseX > 731 && mouseX <878){ 
  image(img63, 0, 0);
  }
   if (mouseY >304 && mouseY < 380 && mouseX > 731 && mouseX <878){ 
  image(img62, 0, 0);
  }
   if (mouseY >380 && mouseY < 456 && mouseX > 731 && mouseX <878){ 
  image(img61, 0, 0);
  }
   if (mouseY >456 && mouseY < 532 && mouseX > 731 && mouseX <878){ 
  image(img6, 0, 0);
  }
  
  if (mouseY >0 && mouseY < 76 && mouseX > 585 && mouseX < 731){ 
  image(img56, 0, 0);
  }
   if (mouseY >76 && mouseY < 152 && mouseX > 585 && mouseX <731){ 
  image(img55, 0, 0);
  }
   if (mouseY >152 && mouseY < 228 && mouseX > 585 && mouseX <731){ 
  image(img54, 0, 0);
  }
   if (mouseY >228 && mouseY < 304 && mouseX > 585 && mouseX <731){ 
  image(img53, 0, 0);
  }
   if (mouseY >304 && mouseY < 380 && mouseX > 585 && mouseX <731){ 
  image(img52, 0, 0);
  }
   if (mouseY >380 && mouseY < 456 && mouseX > 585 && mouseX <731){ 
  image(img51, 0, 0);
  }
   if (mouseY >456 && mouseY < 532 && mouseX > 585 && mouseX <731){ 
  image(img5, 0, 0);
  }
  
  if (mouseY >0 && mouseY < 76 && mouseX > 439 && mouseX < 585){ 
  image(img46, 0, 0);
  }
   if (mouseY >76 && mouseY < 152 && mouseX > 439 && mouseX <585){ 
  image(img45, 0, 0);
  }
   if (mouseY >152 && mouseY < 228 && mouseX > 439 && mouseX <585){ 
  image(img44, 0, 0);
  }
   if (mouseY >228 && mouseY < 304 && mouseX > 439 && mouseX <585){ 
  image(img43, 0, 0);
  }
   if (mouseY >304 && mouseY < 380 && mouseX > 439 && mouseX <585){ 
  image(img42, 0, 0);
  }
   if (mouseY >380 && mouseY < 456 && mouseX > 439 && mouseX <585){ 
  image(img41, 0, 0);
  }
   if (mouseY >456 && mouseY < 532 && mouseX > 439 && mouseX <585){ 
  image(img4, 0, 0);
  }
  
  if (mouseY >0 && mouseY < 76 && mouseX > 293 && mouseX < 439){ 
  image(img36, 0, 0);
  }
   if (mouseY >76 && mouseY < 152 && mouseX > 293 && mouseX <439){ 
  image(img35, 0, 0);
  }
   if (mouseY >152 && mouseY < 228 && mouseX > 293 && mouseX <439){ 
  image(img34, 0, 0);
  }
   if (mouseY >228 && mouseY < 304 && mouseX > 293 && mouseX <439){ 
  image(img33, 0, 0);
  }
   if (mouseY >304 && mouseY < 380 && mouseX > 293 && mouseX <439){ 
  image(img32, 0, 0);
  }
   if (mouseY >380 && mouseY < 456 && mouseX > 293 && mouseX <439){ 
  image(img31, 0, 0);
  }
   if (mouseY >456 && mouseY < 532 && mouseX > 293 && mouseX <439){ 
  image(img3, 0, 0);
  }
  
  if (mouseY >0 && mouseY < 76 && mouseX > 146 && mouseX <293){ 
  image(img26, 0, 0);
  }
   if (mouseY >76 && mouseY < 152 && mouseX > 146 && mouseX <293){ 
  image(img25, 0, 0);
  }
   if (mouseY >152 && mouseY < 228 && mouseX > 146 && mouseX <293){ 
  image(img24, 0, 0);
  }
   if (mouseY >228 && mouseY < 304 && mouseX > 146 && mouseX <293){ 
  image(img23, 0, 0);
  }
   if (mouseY >304 && mouseY < 380 && mouseX > 146 && mouseX <293){ 
  image(img22, 0, 0);
  }
   if (mouseY >380 && mouseY < 456 && mouseX > 146 && mouseX <293){ 
  image(img21, 0, 0);
  }
   if (mouseY >456 && mouseY < 532 && mouseX > 146 && mouseX <293){ 
  image(img2, 0, 0);
  }
  
  if (mouseY >0 && mouseY < 76 && mouseX > 0 && mouseX < 146){ 
  image(img16, 0, 0);
  }
   if (mouseY >76 && mouseY < 152 && mouseX > 0 && mouseX <146){ 
  image(img15, 0, 0);
  }
   if (mouseY >152 && mouseY < 228 && mouseX > 0 && mouseX <146){ 
  image(img14, 0, 0);
  }
   if (mouseY >228 && mouseY < 304 && mouseX > 0 && mouseX <146){ 
  image(img13, 0, 0);
  }
   if (mouseY >304 && mouseY < 380 && mouseX > 0 && mouseX <146){ 
  image(img12, 0, 0);
  }
   if (mouseY >380 && mouseY < 456 && mouseX > 0 && mouseX <146){ 
  image(img11, 0, 0);
  }
   if (mouseY >456 && mouseY < 532 && mouseX > 0 && mouseX <146){ 
  image(img1, 0, 0);
  }
  
  
  
 
}



