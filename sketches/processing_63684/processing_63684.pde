
float vpos, l1pos, l2pos, l3pos, l4pos, l5pos, l6pos, l7pos, l8pos, l9pos, l10pos;
float l1z, l2z, l3z, l4z, l5z, l6z, l7z, l8z, l9z, l10z;
float fz, f1z, f2z, f3z, f4z, f5z, f6z, f7z, f8z, f9z;
float fpos, f1pos, f2pos, f3pos, f4pos, f5pos, f6pos, f7pos, f8pos, f9pos;
float treepos, treepos2, bfpos, bfpos2, ffpos;
PImage dots, clouds, moon, treel, treeb, tombs, fog, backfog, frontfog, ghosts;
boolean spirit = false;


void setup () {
  size (800, 750);
  dots = loadImage("dots.png");
  clouds = loadImage("clouds.png");
  moon = loadImage("moon.png");
  treel = loadImage("treel.png");
  treeb = loadImage("treeb.png");
  tombs = loadImage("tombs.png");
  fog = loadImage("fog.png");
  backfog = loadImage("backfog.png");
  frontfog = loadImage("frontfog.png");
  ghosts = loadImage("ghosts.png");
  


//  smooth ();
  
  imageMode(CENTER);
  
  float spcng;
  float fspcng;
  spcng = .5; 
  fspcng = spcng/2;
  

  l9z = 1 + 8*spcng;
  l8z = 1 + 7*spcng;
  l7z = 1 + 6*spcng;
  l6z = 1 + 5*spcng;
  l5z = 1 + 4*spcng;
  l4z = 1 + 3*spcng;
  l3z = 1 + 2*spcng;
  l2z = 1 + spcng;
  l1z = 1;
  
  f9z = l9z + fspcng;
  f8z = l8z + fspcng;  
  f7z = l7z + fspcng;
  f6z = l6z + fspcng;
  f5z = l5z + fspcng;
  f4z = l4z + fspcng;
  f3z = l3z + fspcng;
  f2z = l2z + fspcng;
  f1z = l1z + fspcng;
  fz =  .7;
}


void draw () {


  background(0);
  
  float hor = 230;
  float ghoy = 250;
  float bot;
  bot = 630 - hor; 
  
  vpos = mouseX - width/2;
  
  l1pos = -vpos/l1z + width/2;
  l2pos = -vpos/l2z + width/2;
  l3pos = -vpos/l3z + width/2;
  l4pos = -vpos/l4z + width/2;
  l5pos = -vpos/l5z + width/2;
  l6pos = -vpos/l6z + width/2;
  l7pos = -vpos/l7z + width/2;
  l8pos = -vpos/l8z + width/2;
  l9pos = -vpos/l9z + width/2;
  
  treepos = -vpos/70 + width/2;
  treepos2 = -vpos/80 + width/2;
  bfpos = -vpos/40 + width/2;
  bfpos2 = -vpos/20 +width/2;
  ffpos = -vpos/10 + width/2;
  
  fpos = -vpos/fz + width/2;
  f1pos = -vpos/f1z + width/2 - 1000;
  f2pos = -vpos/f2z + width/2 + 500;
  f3pos = -vpos/f3z + width/2 - 400;
  f4pos = -vpos/f4z + width/2 + 350;
  f5pos = -vpos/f5z + width/2 + 40;
  f6pos = -vpos/f6z + width/2 + 20;
  f7pos = -vpos/f7z + width/2 - 31;
  f8pos = -vpos/f8z + width/2 + 11;
  f9pos = -vpos/f9z + width/2;  


  
  float siz = 250; 
  float sizX = 8000;
  
//  ellipse (l7pos, 200 +500/l7z, siz/l7z, siz/l7z);
//  ellipse (l6pos, 200 +500/l6z, siz/l6z, siz/l6z);
//  ellipse (l5pos, 200 +500/l5z, siz/l5z, siz/l5z);
//  ellipse (l4pos, 200 +500/l4z, siz/l4z, siz/l4z);
//  ellipse (l3pos, 200 +500/l3z, siz/l3z, siz/l3z);
//  ellipse (l2pos, 200 +500/l2z, siz/l2z, siz/l2z);
//  ellipse (l1pos, 200 +500/l1z, siz/l1z, siz/l1z);

  
//stationary Z dots  
//  image (dots, l7pos, (200 +500/l7z), sizX/l7z, siz/l7z);
//  image (dots, l6pos, (200 +500/l6z), sizX/l6z, siz/l6z);
//  image (dots, l5pos, (200 +500/l5z), sizX/l5z, siz/l5z);
//  image (dots, l4pos, (200 +500/l4z), sizX/l4z, siz/l4z);
//  image (dots, l3pos, (200 +500/l3z), sizX/l3z, siz/l3z);
//  image (dots, l2pos, (200 +500/l2z), sizX/l2z, siz/l2z);
//  image (dots, l1pos, (200 +500/l1z), sizX/l1z, siz/l1z);

  
//moving Z dots  
//  image (dots, l7pos, 200 + mouseY/l7z, sizX/l7z, siz/l7z);
//  image (dots, l6pos, 200 + mouseY/l6z, sizX/l6z, siz/l6z);
//  image (dots, l5pos, 200 + mouseY/l5z, sizX/l5z, siz/l5z);
//  image (dots, l4pos, 200 + mouseY/l4z, sizX/l4z, siz/l4z);
//  image (dots, l3pos, 200 + mouseY/l3z, sizX/l3z, siz/l3z);
//  image (dots, l2pos, 200 + mouseY/l2z, sizX/l2z, siz/l2z);
//  image (dots, l1pos, 200 + mouseY/l1z, sizX/l1z, siz/l1z);

  image(clouds, 400, 375);
  image(treel, treepos2, 375);
  image(treeb, treepos, 375);
  image(backfog, treepos, 375);
  image(backfog, bfpos, 395);
  image(backfog, bfpos2, 405);

  
  image (fog, f9pos, (220), sizX, 750);  
  image (fog, f8pos, (hor +bot/f9z), sizX/l8z, 750/l8z);

if (spirit ==true){
    image (ghosts, l8pos, hor + (mouseY-ghoy)/l8z, sizX/l8z, 750/l8z);
}
  image (tombs, l8pos, (hor +bot/l8z), sizX/l8z, siz/l8z);  
  image (fog, f7pos, (hor +bot/f8z), sizX/l8z, 750/l8z);

if (spirit ==true){
    image (ghosts, l7pos, hor + (mouseY-ghoy)/l7z, sizX/l7z, 750/l7z);
}
  image (tombs, l7pos, (hor +bot/l7z), sizX/l7z, siz/l7z);
  image (fog, f6pos, (hor +bot/f7z), sizX/l7z, 750/l7z);

if (spirit ==true){
    image (ghosts, l6pos, hor + (mouseY-ghoy)/l6z, sizX/l6z, 750/l6z);
}
  image (tombs, l6pos, (hor +bot/l6z), sizX/l6z, siz/l6z);
  image (fog, f5pos, (hor +bot/f6z), sizX/l6z, 750/l6z);

if (spirit ==true){
    image (ghosts, l5pos, hor + (mouseY-ghoy)/l5z, sizX/l5z, 750/l5z);
}
  image (tombs, l5pos, (hor +bot/l5z), sizX/l5z, siz/l5z);
  image (fog, f4pos, (hor +bot/f5z), sizX/l5z, 750/l5z);

if (spirit ==true){
  image (ghosts, l4pos, hor + (mouseY-ghoy)/l4z, sizX/l4z, 750/l4z);
}
  image (tombs, l4pos, (hor +bot/l4z), sizX/l4z, siz/l4z);
  image (fog, f3pos, (hor +bot/f4z), sizX/l4z, 750/l4z);

if (spirit ==true){
  image (ghosts, l3pos, hor + (mouseY-ghoy)/l3z, sizX/l3z, 750/l3z);
}
  image (tombs, l3pos, (hor +bot/l3z), sizX/l3z, siz/l3z);
  image (fog, f2pos, (hor +bot/f3z), sizX/l3z, 750/l3z);

if (spirit ==true){
  image (ghosts, l2pos, hor + (mouseY-ghoy)/l2z, sizX/l2z, 750/l2z);
}
  image (tombs, l2pos, (hor +bot/l2z), sizX/l2z, siz/l2z);
  image (fog, f1pos, (20+hor +bot/f2z), sizX/l2z, 750/l2z);

if (spirit ==true){
    image (ghosts, l1pos, hor + (mouseY-ghoy)/l1z, sizX/l1z, 750/l1z);
}
  image (tombs, l1pos, (hor +bot/l1z), sizX/l1z, siz/l1z);  
  image (fog, fpos, (20+hor +bot/f1z), sizX/l1z, 750/l1z);  
  
  image(frontfog, ffpos, 375);  








  
  
  

  
}

void mousePressed(){
 spirit = !spirit; 
}

