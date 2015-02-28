
float rect_x = 22.5;
float rect_y = 23;
float rect_w = 250;
float rect_h = 300; 

//void setup(){

size (875, 700);
smooth ();
background (205);
noStroke ();
fill (153,204,153);
//rect (22,22,825,550);
fill (51,10,71);
ellipse (75,40,730,120);
PFont Helvetica;
//}

//area around banner
//void draw() {
//  if (mouseX > rect_x)
//    if (mouseX < rect_x + rect_w)
//      if (mouseY > rect_y) 
//        if (mouseY < rect_h + rect_y) {  
fill (255,255,255);
textSize (40);
text ("The History of Nail Polish",195,80);
textSize (9);
fill (0);
text ("There isn't an exact record of the invention of fingernail polish,but it is believed to have originated in China, somewhere around 3000 B.C. Early batches were made from mixtures of bees' wax, gelatin, egg whites and gum Arabic (a natural product found in the African Acacia tree). Some early Chinese mixtures also included flower petals from roses and orchids, and natural pigments for the creation of different colors.", 85,175, 300, 200);

 
//1960
fill(77, 60, 196);
ellipse(75,375,42,42);
fill(134, 81, 145);
ellipse(75,425,42,42);
fill(246,134,0);
ellipse(75,480,42,42);
textSize (18);
fill(255);
text ("1960's",45,525);
 
//1970
fill (51,51,0);
ellipse (250,475,42,42);
ellipse (250,425,42,42);
ellipse (250,375,42,42);
ellipse (250,325,42,42);
textSize (18);
fill (255);
text ("1970's",228,525);
fill(0);
 
//1980
fill (102,102,0);
ellipse  (430,460, 42, 42);
ellipse  (430, 410,  42, 42);
ellipse (430, 360,  42, 42);
ellipse  (430,310,  42, 42);
textSize (18);
fill(255);
text("1980's",400,525);
 
//1990
fill (102,153,0);
ellipse (610,460,42,42);
ellipse (610,410,42,42);
ellipse (610,360,42,42);
textSize (18);
fill (255);
text ("1990's",590,525);
 
//2000
fill (102,204,0);
ellipse (770,460,42, 42);
ellipse (770,410, 42, 42);
ellipse (770,360,42, 42);
textSize (18);
fill (255);
text ("2000's",750,525);
 
 
strokeWeight (4); //thicker
 line (85,85, 790,85);
 line (290,140,550,140);
