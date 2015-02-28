
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


Minim minim;
AudioPlayer c4;
AudioPlayer d4;
AudioPlayer e4;
AudioPlayer f4;
AudioPlayer g4;
AudioPlayer a5;
AudioPlayer b5;
AudioPlayer c5;
AudioPlayer d5;
AudioPlayer e5;
AudioPlayer c2;
AudioPlayer d2;
AudioPlayer e2;
AudioPlayer f2;
AudioPlayer g2;
AudioPlayer a3;
AudioPlayer b3;
AudioPlayer c3;
AudioPlayer d3;
AudioPlayer e3;

void setup()
{
  minim = new Minim(this);
  c4 = minim.loadFile("c4.wav");
  d4 = minim.loadFile("d4.wav");
  e4 = minim.loadFile("e4.wav");
  f4 = minim.loadFile("f4.wav");
  g4 = minim.loadFile("g4.wav");
  a5 = minim.loadFile("a5.wav");
  b5 = minim.loadFile("b5.wav");
  c5 = minim.loadFile("c5.wav");
  d5 = minim.loadFile("d5.wav");
  e5 = minim.loadFile("e5.wav");
  c2 = minim.loadFile("c2.wav");
  d2 = minim.loadFile("d2.wav");
  e2 = minim.loadFile("e2.wav");
  f2 = minim.loadFile("f2.wav");
  g2 = minim.loadFile("g2.wav");
  a3 = minim.loadFile("a3.wav");
  b3 = minim.loadFile("b3.wav");
  c3 = minim.loadFile("c3.wav");
  d3 = minim.loadFile("d3.wav");
  e3 = minim.loadFile("e3.wav");
  
  size (500,500);
  background (235,237,213);
  smooth();
  frameRate (80);
  
}
// note "barheight" is y co-ordinate
int barheight = 50;
int a = barheight;
int b = barheight;
int c = barheight;
int d = barheight;
int e = barheight;
int f = barheight;
int g = barheight;
int h = barheight;
int i = barheight;
int j = barheight;



int targetY;
float easing = 0.05;

int wt=5;

int fadetime = 3;

// dark colour
int RR = 13;
int GG = 25;
int BB = 54;

// for a
float aCr= RR;
float aCg=GG;
float aCb=BB;


//for b
int bCr= RR;
int bCg=GG;
int bCb=BB;

// for c
int cCr= RR;
int cCg=GG;
int cCb=BB;

//for d
int dCr= RR;
int dCg=GG;
int dCb=BB;

//for e
int eCr= RR;
int eCg=GG;
int eCb=BB;

//for f
int fCr= RR;
int fCg=GG;
int fCb=BB;

//for g
int gCr= RR;
int gCg=GG;
int gCb=BB;

//for h
int hCr= RR;
int hCg=GG;
int hCb=BB;

//for i
int iCr= RR;
int iCg=GG;
int iCb=BB;

//for j
int jCr= RR;
int jCg=GG;
int jCb=BB;

//light colours

int rr=173;
int gg=198;
int bb=214;

int thin = 5;
float xpos1 = 0;


void draw () {
 background (235,237,213);
 fill(0);
  rect (0,250,width,2);
  stroke (235,237,213);
  fill (aCr,aCg,aCb);
  rect (0,0,50,a); 
  fill (bCr,bCg,bCb);
  rect (50,0,50,b);
  fill (cCr,cCg,cCb);
  rect (100,0,50,c);
  fill (dCr,dCg,dCb);
  rect (150,0,50,d);
  fill (eCr,eCg,eCb);
  rect (200,0,50,e);
  fill (fCr,fCg,fCb);
  rect (250,0,50,f);
  fill (gCr,gCg,gCb);
  rect (300,0,50,g);
  fill (hCr,hCg,hCb);
  rect (350,0,50,h);
  fill (iCr,iCg,iCb);
  rect (400,0,50,i);
  fill (jCr,jCg,jCb);
  rect (450,0,50,j);
  
  
  

  
 //Code to stop bar being dragged further than 300 (the screen)
  if (a>500) {
      a=500;
  }if (b>500) {
      b=500;
  }if (c>500) {
      c=500;
  }if (d>500) {
      d=500;
  }if (e>500) {
      e=500;
  }if (f>500) {
      f=500;
  }if (g>500) {
      g=500;
  }if (h>500) {
      h=500;
  }if (i>500) {
      i=500;
  }if (j>500) {
      j=500;
  }
  
  fill(237,104,2);
  rect(0, xpos1, width, 15);
  
  xpos1 -= 1;
  
  if (xpos1 < -thin) { xpos1 = height+10; }
  if (xpos1 > (height+10)) { xpos1= -thin;}
  


  


  
  
  
//Plays note and lighter colour for bar a
 if ((a==xpos1) && (a<250)) {
   c4.loop(0);
    aCr=rr;
    aCg=gg;
    aCb=bb;
 }
 if ((a==xpos1) && (a>250)) {
   c2.loop(0);
   aCr=rr;
   aCg=gg;
   aCb=bb;
  }
  //fades to darker colour
  if (aCr<=RR){
    aCr=RR;
  }else {
    aCr-=fadetime;
  }if (aCg<=GG){
    aCg=GG;
  }else {
    aCg-=fadetime;
  }if (aCb<=BB){
    aCb=BB;
  }else {
    aCb-=fadetime;
  }
  
  //Plays note and lighter colour for bar 2 a
  // if ((a==xpos2) && (a>250)){
   //c2.loop(0);
    //aCr=rr;
    //aCg=gg;
    //aCb=bb;
//  }
  
  
    
 //Plays note and lighter colour for bar b
 if ((b==xpos1) && (b<250)) {
   d4.loop(0);
    bCr=rr;
    bCg=gg;
    bCb=bb;}
    
    if ((b==xpos1) && (b>250)) {
      d2.loop(0);
       bCr=rr;
    bCg=gg;
    bCb=bb;}
  
    //Plays note and lighter colour for bar2 b
   // if (b==xpos2) {
  // d2.loop(0);
  //  bCr=rr;
   // bCg=gg;
   // bCb=bb;}
    
 //fades to darker colour 
  if (bCr<=RR){
    bCr=RR;
  }else {
    bCr-=fadetime;
  }if (bCg<=GG){
    bCg=GG;
  }else {
    bCg-=fadetime;
  }if (bCb<=BB){
    bCb=BB;
  }else {
    bCb-=fadetime;
  }
  //Plays note and lighter colour for bar c
  if ((c==xpos1) && (c<250)){
   e4.loop(0);
    cCr=rr;
    cCg=gg;
    cCb=bb;}
    
    if ((c==xpos1) && (c>250)){
      e2.loop(0);
      cCr=rr;
    cCg=gg;
    cCb=bb;}
      
    

  //fades to darker colour
  if (cCr<=RR){
    cCr=RR;
  }else {
    cCr-=fadetime;
  }if (cCg<=GG){
    cCg=GG;
  }else {
    cCg-=fadetime;
  }if (cCb<=BB){
    cCb=BB;
  }else {
    cCb-=fadetime;
  }
 
 //}
    //Plays not and darker colour for bar2 d
     if ((d==xpos1) && (d<250)){
   f4.loop(0);
    dCr=rr;
    dCg=gg;
    dCb=bb;}
   
    if ((d==xpos1) && (d>250)){
      f2.loop(0);
      dCr=rr;
    dCg=gg;
    dCb=bb;}
    
  //fades to darker colour
  if (dCr<=RR){
    dCr=RR;
  }else {
    dCr-=fadetime;
  }if (dCg<=GG){
    dCg=GG;
  }else {
    dCg-=fadetime;
  }if (dCb<=BB){
    dCb=BB;
  }else {
    dCb-=fadetime;
  }
  //Plays note and darker colour for bar e 
 if ((e==xpos1) && (e<250)){
   g4.loop(0);
    eCr=rr;
    eCg=gg;
    eCb=bb;}
    
 if ((e==xpos1) && (e>250)){
   g2.loop(0);
    eCr=rr;
    eCg=gg;
    eCb=bb;}
    
  
  
  //fades to darker colour
  if (eCr<=RR){
    eCr=RR;
  }else {
    eCr-=fadetime;
  }if (eCg<=GG){
    eCg=GG;
  }else {
    eCg-=fadetime;
  }if (eCb<=BB){
    eCb=BB;
  }else {
    eCb-=fadetime;
  }
   //Plays note and lighter colour for bar f
 if ((f==xpos1) && (f<250)){
   a5.loop(0);
    fCr=rr;
    fCg=gg;
    fCb=bb;
  }
  if ((f==xpos1) && (f>250)){
    a3.loop(0);
     fCr=rr;
    fCg=gg;
    fCb=bb;
  }
    
 
  //fades to darker colour
  if (fCr<=RR){
    fCr=RR;
  }else {
    fCr-=fadetime;
  }if (fCg<=GG){
    fCg=GG;
  }else {
    fCg-=fadetime;
  }if (fCb<=BB){
    fCb=BB;
  }else {
    fCb-=fadetime;
  }
   //Plays note and darker colour for bar g
 if ((g==xpos1) && (g<250)){
   b5.loop(0);
    gCr=rr;
    gCg=gg;
    gCb=bb;
  }
  
  if ((g==xpos1) && (g>250)){
    b3.loop(0);
     gCr=rr;
    gCg=gg;
    gCb=bb;}
    
 
  
  //fades to darker colour
  if (gCr<=RR){
    gCr=RR;
  }else {
    gCr-=fadetime;
  }if (gCg<=GG){
    gCg=GG;
  }else {
    gCg-=fadetime;
  }if (gCb<=BB){
    gCb=BB;
  }else {
    gCb-=fadetime;
  }
   //Plays note and lighter colour for bar h
 if ((h==xpos1) && (h<250)){
   c5.loop(0);
    hCr=rr;
    hCg=gg;
    hCb=bb;
  }
  if ((h==xpos1) && (h>250)){
    c3.loop(0);
    hCr=rr;
    hCg=gg;
    hCb=bb;
  }
 
  //fades to darker colour
  if (hCr<=RR){
    hCr=RR;
  }else {
    hCr-=fadetime;
  }if (hCg<=GG){
    hCg=GG;
  }else {
    hCg-=fadetime;
  }if (hCb<=BB){
    hCb=BB;
  }else {
    hCb-=fadetime;
  }
  //Plays note and lighter colour for bar i 
 if ((i==xpos1) && (i<250)){
   d5.loop(0);
    iCr=rr;
    iCg=gg;
    iCb=bb;
  }
  if ((i==xpos1) && (i>250)){
    d3.loop(0);
     iCr=rr;
    iCg=gg;
    iCb=bb;
  }
  
  //fades to darker colour
  if (iCr<=RR){
    iCr=RR;
  }else {
    iCr-=fadetime;
  }if (iCg<=GG){
    iCg=GG;
  }else {
    iCg-=fadetime;
  }if (iCb<=BB){
    iCb=BB;
  }else {
    iCb-=fadetime;
  }
  //Plays note and lighter colour for bar j 
 if ((j==xpos1) && (j<250)){
   e5.loop(0);
    jCr=rr;
    jCg=gg;
    jCb=bb;
  }
  
  if ((j==xpos1) && (j>250)){
    e3.loop(0);
      jCr=rr;
    jCg=gg;
    jCb=bb;
  }

  //fades to darker colour
  if (jCr<=RR){
    jCr=RR;
  }else {
    jCr-=fadetime;
  }if (jCg<=GG){
    jCg=GG;
  }else {
    jCg-=fadetime;
  }if (jCb<=BB){
    jCb=BB;
  }else {
    jCb-=fadetime;
  }
 
}

 
  
  
void mouseMoved() {
  
  if ((mouseX>0) && (mouseX<50) && (mouseY>0)) {
     a=mouseY; }
     
  if ((mouseX>50) && (mouseX<100) && (mouseY>0)) {
    b=mouseY; }
    
  if ((mouseX>100) && (mouseX<150) && (mouseY>0)) {
    c=mouseY; }
    
  if ((mouseX>150) && (mouseX<200) && (mouseY>0)) {
    d=mouseY; }
    
  if ((mouseX>200) && (mouseX<250) && (mouseY>0)) {
    e=mouseY; }
    
  if ((mouseX>250) && (mouseX<300) && (mouseY>0)) {
    f=mouseY; }
    
  if ((mouseX>300) && (mouseX<350) && (mouseY>0)) {
    g=mouseY; }
    
  if ((mouseX>350) && (mouseX<400) && (mouseY>0)) {
    h=mouseY; }
    
  if ((mouseX>400) && (mouseX<450) && (mouseY>0)) {
    i=mouseY; }
    
  if ((mouseX>450) && (mouseX<500) && (mouseY>0)) {
    j=mouseY; }
}

void stop()
{
c4.close();
d4.close();
e4.close();
f4.close();
g4.close();
a5.close();
b5.close();
c5.close();
d5.close();
e5.close();

minim.stop();
super.stop();
}

