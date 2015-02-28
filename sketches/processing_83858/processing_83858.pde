
PImage img;
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;
PImage i;

PImage aa;
PImage bb;
PImage cc;
PImage dd;
PImage ee;
PImage ff;
PImage gg; 
PImage hh;
PImage ii;

int apos = 10;
int aspeed = 5;
int bpos = 100;
int bspeed = 3;
int cpos = 170;
int cspeed = 2;
int dpos = 240;
int dspeed = 4;
int epos = 350;
int espeed = 1;
int fpos = 420;
int fspeed = 3;
int gpos = 500;
int gspeed = 5;
int hpos = 580;
int hspeed = 2;
int ipos = 680;
int ispeed = 3;


boolean overa;
boolean overb;
boolean overc;
boolean overd;
boolean overe;
boolean overf;
boolean overg;
boolean overh;
boolean overi;


PImage snow1;
PImage snow2;
PImage snow3;
PImage snow4;
PImage snow5;
PImage snow6;
PImage snow7;
PImage snow8;
PImage snow9;
PImage snow10;
PImage snow11;
PImage snow12;
PImage snow13;
PImage snow14;
PImage snow15;
PImage snow16;
PImage snow17;
PImage snow18;
PImage snow19;
PImage snow20;

int snowpos1;
int snowpos2;
int snowpos3;
int snowpos4;



void setup(){
  size(800,500);
  }

void draw(){
  
   img = loadImage("hk-01.png");
  image(img,0,0);
 
  
  a = loadImage("1-02.png");
  image(a,apos,height-94);
  b = loadImage("2-03.png");
  image(b,bpos,height-95);
  c = loadImage("3-04.png");
  image(c,cpos,height-97);
  d = loadImage("4-05.png");
  image(d,dpos,height-84);
  e = loadImage("5-06.png");
  image(e,epos,height-85);
  f = loadImage("6-07.png");
  image(f,fpos,height-93);
  g = loadImage("7-08.png");
  image(g,(gpos),height-95);
  h = loadImage("8-09.png");
  image(h,(hpos),height-96);
  i = loadImage("9-10.png");
  image(i,(ipos),height-83);


  apos = apos + aspeed*-1;
  if (apos<0) {
    aspeed=-5;
  }else if (apos>757){
    aspeed=5;
  }
   bpos = bpos + bspeed*-1;
  if (bpos<0) {
    bspeed=-3;
  }else if (bpos>757){
    bspeed=3;
  }
   cpos = cpos + cspeed*-1;
  if (cpos<0) {
    cspeed=-2;
  }else if (cpos>757){
    cspeed=2;
  }
   dpos = dpos + dspeed*-1;
  if (dpos<0) {
    dspeed=-4;
  }else if (dpos>757){
    dspeed=4;
  }
   epos = epos + espeed*-1;
  if (epos<0) {
    espeed=-1;
  }else if (epos>757){
    espeed=1;
  }
   fpos = fpos + fspeed*-1;
  if (fpos<0) {
    fspeed=-3;
  }else if (fpos>757){
    fspeed=3;
  }
   gpos = gpos + gspeed*-1;
  if (gpos<0) {
    gspeed=-5;
  }else if (gpos>757){
    gspeed=5;
  }
   hpos = hpos + hspeed*-1;
  if (hpos<0) {
    hspeed=-2;
  }else if (hpos>757){
    hspeed=2;
  }
   ipos = ipos + ispeed*-1;
  if (ipos<0) {
    ispeed=-3;
  }else if (ipos>757){
    ispeed=3;
  }


   if ((mouseX>apos) && (mouseX < a.width) && (mouseY<height-94)){
     overa = true;
   }
   else {
     overa = false;
   }

   if(mouseX == b.width || mouseY == b.height){
     overb = true;
   }
   else {
     overb = false;
   }

   if(mouseX == c.width || mouseY == c.height){
     overc = true;
   }
   else {
     overc = false;
   }

   if(mouseX == d.width || mouseY == d.height){
     overd = true;
   }
   else {
     overd = false;
   }

   if(mouseX == e.width || mouseY == e.height){
     overe = true;
   }
   else {
     overe = false;
   }

   if(mouseX == f.width || mouseY == f.height){
     overf = true;
   }
   else {
     overf = false;
   }

   if(mouseX == g.width || mouseY == g.height){
     overg = true;
   }
   else {
     overg = false;
   }

   if(mouseX == h.width || mouseY == h.height){
     overh = true;
   }
   else {
     overh = false;
   }

   if(mouseX == i.width || mouseY == i.height){
     overi = true;
   }
   else {
     overi = false;
   }


   
   //AAAAAAAAAAAA//
   if ((mouseX>apos) && (mouseX < apos+a.width) && (mouseY>(height-94))){
     overa = true;
   }
   else {
     overa = false;
   }
   
   if (overa && mousePressed){
     fill(255);
     aa = loadImage("IMG_1480.jpg");
     image(aa,250,25);
     aspeed=0;
   }
     else{
       ;
     }
  //BBBBBBBBBBBBBB//
    if ((mouseX>bpos) && (mouseX < bpos+b.width) && (mouseY>(height-94))){
     overb = true;
   }
   else {
     overb = false;
   }
   
   if (overb && mousePressed){
     fill(255);
     bb = loadImage("IMG_1485.jpg");
     image(bb,250,25);
     bspeed=0;
   }
     else{
       ;
     }
   //CCCCCCCCCCCCCC//
       if ((mouseX>cpos) && (mouseX < cpos+c.width) && (mouseY>(height-94))){
     overc = true;
   }
   else {
     overc = false;
   }
   
   if (overc && mousePressed){
     fill(255);
     cc = loadImage("IMG_1487 copy.jpg");
     image(cc,250,25);
     cspeed=0;
   }
     else{
       ;
     }
     //DDDDDDDDDDDDDD//
       if ((mouseX>dpos) && (mouseX < dpos+d.width) && (mouseY>(height-94))){
     overd = true;
   }
   else {
     overd = false;
   }
   
   if (overd && mousePressed){
     fill(255);
     dd = loadImage("IMG_1489.jpg");
     image(dd,250,25);
     dspeed=0;
   }
     else{
       ;
     }
     
     //EEEEEEEEEEEEEE// 
       if ((mouseX>epos) && (mouseX < epos+e.width) && (mouseY>(height-94))){
     overe = true;
   }
   else {
     overe = false;
   }
   
   if (overe && mousePressed){
     fill(255);
     ee = loadImage("IMG_1504 copy.jpg");
     image(ee,250,25);
     espeed=0;
   }
     else{
       ;
     }
     //FFFFFFFFFFFFFF//
       if ((mouseX>fpos) && (mouseX < fpos+f.width) && (mouseY>(height-94))){
     overf = true;
   }
   else {
     overf = false;
   }
   
   if (overf && mousePressed){
     fill(255);
     ff = loadImage("IMG_1510.jpg");
     image(ff,250,25);
     fspeed=0;
   }
     else{
       ;
     }
     //GGGGGGGGGGGGGGGGG//
       if ((mouseX>gpos) && (mouseX < gpos+g.width) && (mouseY>(height-94))){
     overg = true;
   }
   else {
     overg = false;
   }
   
   if (overg && mousePressed){
     fill(255);
     gg = loadImage("IMG_2051.jpg");
     image(gg,250,25);
     gspeed=0;
   }
     else{
       ;
     }
     //HHHHHHHHHHHHHHH//
       if ((mouseX>hpos) && (mouseX < hpos+h.width) && (mouseY>(height-94))){
     overh = true;
   }
   else {
     overh = false;
   }
   
   if (overh && mousePressed){
     fill(255);
     hh = loadImage("IMG_2095 copy.jpg");
     image(hh,250,25);
     hspeed=0;
   }
     else{  
       ;
     }
     
     //IIIIIIIIIIIIIII///
       if ((mouseX>ipos) && (mouseX < ipos+i.width) && (mouseY>(height-94))){
     overi = true;
   }
   else {
     overi = false;
   }
   
   if (overi && mousePressed){
     fill(255);
     ii = loadImage("IMG_2102 copy.jpg");
     image(ii,250,25);
     ispeed=0;
   }
     else{
       ;
     }
     
     
     
     
     
     ////SNOW////
     snow1 = loadImage("Snow-01-01.png");
     image(snow1,0,snowpos1);
     snow2 = loadImage("Snow-20.png");
     image(snow2,200,snowpos2);
     snow3 = loadImage("Snow-03.png");
     image(snow3,400,snowpos3);
     snow4 = loadImage("Snow-04.png");
     image(snow4,600,snowpos4);
     snow5 = loadImage("Snow-05.png");
     image(snow5,0,snowpos4+100);
     snow6 = loadImage("Snow-06.png");
     image(snow6,200,snowpos3+100);
     snow7 = loadImage("Snow-07.png");
     image(snow7,400,snowpos2+100);
     snow8 = loadImage("Snow-08.png");
     image(snow8,600,snowpos1+100);
     snow9 = loadImage("Snow-09.png");
     image(snow9,0,snowpos1+200);
     snow10 = loadImage("Snow-10.png");
     image(snow10,200,snowpos1+200);
     snow11 = loadImage("Snow-11.png");
     image(snow11,400,snowpos1+200);
     snow12 = loadImage("Snow-12.png");
     image(snow12,600,snowpos1+200);
     snow13 = loadImage("Snow-13.png");
     image(snow13,0,snowpos2+300);
     snow14 = loadImage("Snow-14.png");
     image(snow14,200,snowpos3+300);
     snow15 = loadImage("Snow-15.png");
     image(snow15,400,snowpos4+300);
     snow16 = loadImage("Snow-16.png");
     image(snow16,600,snowpos4+300);
     snow17 = loadImage("Snow-17.png");
     image(snow17,0,snowpos3+400);
     snow18 = loadImage("Snow-18.png");
     image(snow18,200,snowpos2+400);
     snow19 = loadImage("Snow-19.png");
     image(snow19,400,snowpos1+400);
     snow20 = loadImage("Snow-20.png");
     image(snow20,600,snowpos3+400);

     snowpos1++;
     snowpos2 = snowpos2 + 2;
     snowpos3 = snowpos3 + 3;
     snowpos4 = snowpos4 + 4;
     
     
  
     
}
 

 


