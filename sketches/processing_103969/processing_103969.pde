
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
  
  img1 = loadImage("Animotions000.jpg");
  img2 = loadImage("Animotions001.jpg");
  img3 = loadImage("Animotions002.jpg");
  img4 = loadImage("Animotions003.jpg");
  img5 = loadImage("Animotions004.jpg");
  img6 = loadImage("Animotions005.jpg");
  img7 = loadImage("Animotions006.jpg");

  img11 = loadImage("Animotions013.jpg");
  img21 = loadImage("Animotions012.jpg");
  img31 = loadImage("Animotions011.jpg");
  img41 = loadImage("Animotions010.jpg");
  img51 = loadImage("Animotions009.jpg");
  img61 = loadImage("Animotions008.jpg");
  img71 = loadImage("Animotions007.jpg");
  
  img12 = loadImage("Animotions014.jpg");
  img22 = loadImage("Animotions015.jpg");
  img32 = loadImage("Animotions016.jpg");
  img42 = loadImage("Animotions017.jpg");
  img52 = loadImage("Animotions018.jpg");
  img62 = loadImage("Animotions019.jpg");
  img72 = loadImage("Animotions020.jpg");
  
  img13 = loadImage("Animotions027.jpg");
  img23 = loadImage("Animotions026.jpg");
  img33 = loadImage("Animotions025.jpg");
  img43 = loadImage("Animotions024.jpg");
  img53 = loadImage("Animotions023.jpg");
  img63 = loadImage("Animotions022.jpg");
  img73 = loadImage("Animotions021.jpg");

  img14 = loadImage("Animotions028.jpg");
  img24 = loadImage("Animotions029.jpg");
  img34 = loadImage("Animotions030.jpg");
  img44 = loadImage("Animotions031.jpg");
  img54 = loadImage("Animotions032.jpg");
  img64 = loadImage("Animotions033.jpg");
  img74 = loadImage("Animotions034.jpg");
  
  img15 = loadImage("Animotions041.jpg");
  img25 = loadImage("Animotions040.jpg");
  img35 = loadImage("Animotions039.jpg");
  img45 = loadImage("Animotions038.jpg");
  img55 = loadImage("Animotions037.jpg");
  img65 = loadImage("Animotions036.jpg");
  img75 = loadImage("Animotions035.jpg");
  
  
  img16 = loadImage("Animotions042.jpg");
  img26 = loadImage("Animotions043.jpg");
  img36 = loadImage("Animotions044.jpg");
  img46 = loadImage("Animotions045.jpg");
  img56 = loadImage("Animotions046.jpg");
  img66 = loadImage("Animotions047.jpg");
  img76 = loadImage("Animotions048.jpg");

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



