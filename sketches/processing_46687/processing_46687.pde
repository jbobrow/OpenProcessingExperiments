
PImage bg;
 
import ddf.minim.*;
Minim minim;
AudioSnippet audioa;
AudioSnippet audiob;
AudioSnippet audioc;
AudioSnippet audiod;
AudioSnippet audioe;
AudioSnippet audiof;
AudioSnippet audiog;
AudioSnippet audioh;
AudioSnippet audioi;
AudioSnippet audioj;
AudioSnippet audiok;
AudioSnippet audiol;
AudioSnippet audiom;
AudioSnippet audion;
AudioSnippet audio1;
AudioSnippet audioo;
AudioSnippet audiop;
AudioSnippet audioq;
AudioSnippet audior;
AudioSnippet audios;
AudioSnippet audiot;
AudioSnippet audiou;
AudioSnippet audiov;
AudioSnippet audiow;
AudioSnippet audiox;
AudioSnippet audioy;
AudioSnippet audioz;





void setup () {
minim = new Minim(this);
audioa = minim.loadSnippet("A.mp3");
audiob = minim.loadSnippet("B.mp3");
audioc = minim.loadSnippet("C.mp3");
audiod = minim.loadSnippet("D.mp3");
audioe = minim.loadSnippet("E.mp3");
audiof = minim.loadSnippet("F.mp3");
audiog = minim.loadSnippet("G.mp3");
audioh = minim.loadSnippet("H.mp3");
audioi = minim.loadSnippet("I.mp3");
audioj = minim.loadSnippet("J.mp3");
audiok = minim.loadSnippet("K.mp3");
audiol = minim.loadSnippet("L.mp3");
audiom = minim.loadSnippet("M.mp3");
audion = minim.loadSnippet("N.mp3");
audio1 = minim.loadSnippet("1.mp3");
audioo = minim.loadSnippet("O.mp3");
audiop = minim.loadSnippet("P.mp3");
audioq = minim.loadSnippet("Q.mp3");
audior = minim.loadSnippet("R.mp3");
audios = minim.loadSnippet("S.mp3");
audiot = minim.loadSnippet("T.mp3");
audiou = minim.loadSnippet("U.mp3");
audiov = minim.loadSnippet("V.mp3");
audiow = minim.loadSnippet("W.mp3");
audiox = minim.loadSnippet("X.mp3");
audioy = minim.loadSnippet("Y.mp3");
audioz = minim.loadSnippet("Z.mp3");


size (700, 400);
 
}
 
float d;
float diam=100;

 
 
 
 
void draw() {
  
bg=loadImage("ABECEDARIO.jpg");
image(bg,0,0,700,400);
 
 
  
  //clic A
  
  d=dist(50, 50, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (50, 50, diam, diam);
  audioa.loop();
  audioa.play();
  stroke(0);
  fill(0); 
  }
  
  //clic B
  
  d=dist(150, 50, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (150, 50, diam, diam);
  audiob.loop();
  audiob.play();
  stroke(0);
  fill(0); 
  }
  
   //clic C
  
  d=dist(250, 50, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (250, 50, diam, diam);
  audioc.loop();
  audioc.play();
  stroke(0);
  fill(0); 
  }
  
  //clic D
  
  d=dist(345, 50, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (345, 50, diam, diam);
  audiod.loop();
  audiod.play();
  stroke(0);
  fill(0); 
  }
  
    //clic E
  
  d=dist(440, 50, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (440, 50, diam, diam);
  audioe.loop();
  audioe.play();
  stroke(0);
  fill(0); 
  }
  
    //clic F
  
  d=dist(532, 50, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (532, 50, diam, diam);
  audiof.loop();
  audiof.play();
  stroke(0);
  fill(0); 
  }
  
    //clic G
  
  d=dist(626, 50, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (626, 50, diam, diam);
  audiog.loop();
  audiog.play();
  stroke(0);
  fill(0); 
  }
  
    //clic H
  
  d=dist(50, 150, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (50, 150, diam, diam);
  audioh.loop();
  audioh.play();
  stroke(0);
  fill(0); 
  }
  
  
    //clic I
  
  d=dist(150, 150, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (150, 150, diam, diam);
  audioi.loop();
  audioi.play();
  stroke(0);
  fill(0); 
  }
  
   //clic J
  
  d=dist(250, 150, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (250, 150, diam, diam);
  audioj.loop();
  audioj.play();
  stroke(0);
  fill(0); 
  }
  
   //clic K
  
  d=dist(345, 150, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (345, 150, diam, diam);
  audiok.loop();
  audiok.play();
  stroke(0);
  fill(0); 
  }

   //clic L
  
  d=dist(440, 150, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (440, 150, diam, diam);
  audiol.loop();
  audiol.play();
  stroke(0);
  fill(0); 
  }
  
   //clic M
  
  d=dist(532, 150, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (532, 150, diam, diam);
  audiom.loop();
  audiom.play();
  stroke(0);
  fill(0); 
  }
  
  
   //clic N
  
  d=dist(626, 150, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (626, 150, diam, diam);
  audion.loop();
  audion.play();
  stroke(0);
  fill(0); 
  }
  
   //clic Ñ
  
  d=dist(50, 255, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (50, 255, diam, diam);
  audio1.loop();
  audio1.play();
  stroke(0);
  fill(0); 
  }
    
   //clic O
  
  d=dist(150, 255, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (150, 255, diam, diam);
  audioo.loop();
  audioo.play();
  stroke(0);
  fill(0); 
  }
  
   //clic P
  
  d=dist(250, 255, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (250, 255, diam, diam);
  audiop.loop();
  audiop.play();
  stroke(0);
  fill(0); 
  }
  
   //clic Q
  
  d=dist(345, 255, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (345, 255, diam, diam);
  audioq.loop();
  audioq.play();
  stroke(0);
  fill(0); 
  }
  
  //clic R
  
  d=dist(440, 255, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (440, 255, diam, diam);
  audior.loop();
  audior.play();
  stroke(0);
  fill(0); 
  }
  
  //clic S
  
  d=dist(532, 255, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (532, 255, diam, diam);
  audios.loop();
  audios.play();
  stroke(0);
  fill(0); 
  }
  
  //clic T

  d=dist(626, 255, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (626, 255, diam, diam);
  audiot.loop();
  audiot.play();
  stroke(0);
  fill(0); 
  }
  
  //clic U
  
  d=dist(50, 355, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (50, 355, diam, diam);
  audiou.loop();
  audiou.play();
  stroke(0);
  fill(0); 
  }
  
  //clic V
  
  d=dist(150, 355, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (150, 355, diam, diam);
  audiov.loop();
  audiov.play();
  stroke(0);
  fill(0); 
  }
  
  //clic W
  
  d=dist(250, 355, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (250, 355, diam, diam);
  audiow.loop();
  audiow.play();
  stroke(0);
  fill(0); 
  }
  
  //clic X
 
  d=dist(345, 355, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (345, 355, diam, diam);
  audiox.loop();
  audiox.play();
  stroke(0);
  fill(0); 
  }
  
  //clic Y
  
  d=dist(440, 355, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (440, 355, diam, diam);
  audioy.loop();
  audioy.play();
  stroke(0);
  fill(0); 
  }
  
  //clic Z
  
  d=dist(532, 355, mouseX, mouseY);
  if ((d<=diam/2)&(mousePressed)) {
  fill (0);
  ellipse (532, 355, diam, diam);
  audioz.loop();
  audioz.play();
  stroke(0);
  fill(0); 
  }
  
  
  
  
 triangle(mouseX, mouseY +18, mouseX+16, mouseY-10, mouseX-16, mouseY-10);
 triangle(mouseX, mouseY -18, mouseX+16, mouseY+10, mouseX-16, mouseY+10);
                
                
