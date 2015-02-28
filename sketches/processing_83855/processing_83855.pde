
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
PImage j;

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
int jpos = 740;
int jspeed = 4;

boolean overa;
boolean overb;
boolean overc;
boolean overd;
boolean overe;
boolean overf;
boolean overg;
boolean overh;
boolean overi;
boolean overj;



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
  j = loadImage("10-11.png");
  image(j,(jpos),height-85);
  

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
   jpos = jpos + jspeed*-1;
  if (jpos<0) {
    jspeed=-4;
  }else if (jpos>757){
    jspeed=4;
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

   if(mouseX == j.width || mouseY == j.height){
     overj = true;
   }
   else {
     overj = false;
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
     rect(250,25,300,370);
     aspeed=0;
   }
     else{
       
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
     rect(250,25,300,370);
     bspeed=0;
   }
     else{
       
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
     rect(250,25,300,370);
     cspeed=0;
   }
     else{
       
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
     rect(250,25,300,370);
     dspeed=0;
   }
     else{
       
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
     rect(250,25,300,370);
     espeed=0;
   }
     else{
       
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
     rect(250,25,300,370);
     fspeed=0;
   }
     else{
       
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
     rect(250,25,300,370);
     gspeed=0;
   }
     else{
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
     rect(250,25,300,370);
     hspeed=0;
   }
     else{  
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
     rect(250,25,300,370);
     ispeed=0;
   }
     else{
     }
     //JJJJJJJJJJJJ//
       if ((mouseX>jpos) && (mouseX < jpos+j.width) && (mouseY>(height-94))){
     overj = true;
   }
   else {
     overj = false;
   }
   
   if (overj && mousePressed){
     fill(255);
     rect(250,25,300,370);
     jspeed=0;
   }
     else{
       
     }
}
 

 


