
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m; //sounds
AudioPlayer playerA; //player
AudioPlayer playerB;
AudioPlayer playerC;
AudioPlayer playerD;
AudioPlayer playerE;
AudioPlayer playerF;
AudioPlayer playerG;
AudioPlayer playerAhigh;
AudioPlayer playerBhigh;
AudioPlayer playerChigh;
AudioPlayer playerDhigh;
AudioPlayer playerEhigh;
AudioPlayer playerFhigh;
AudioPlayer playerGhigh;


float x;//ball
float y;
float yspeed = 0;
float xspeed = 0;
float balldiameter=5;
float ballradius = balldiameter/2;
//panels
color pr = 30; color pg = 30; color pb = 30;
color pr1 = 30; color pg1 = 30; color pb1 = 30;
color pr2 = 30; color pg2 = 30; color pb2 = 30;
color pr3 = 30; color pg3 = 30; color pb3 = 30;
color pr4 = 30; color pg4 = 30; color pb4 = 30;
color pr5 = 30; color pg5 = 30; color pb5 = 30;
color pr6 = 30; color pg6 = 30; color pb6 = 30;
//ball glow
color br = 255; color bg = 255; color bb = 255;
float amnt = 7;
//rectangle
color rr = 0; color rg = 0; color rb = 0;
color rr1 = 0; color rg1 = 0; color rb1 = 0;
color rr2 = 0; color rg2 = 0; color rb2 = 0;
color rr3 = 0; color rg3 = 0; color rb3 = 0;
color rr4 = 0; color rg4 = 0; color rb4 = 0;
color rr5 = 0; color rg5 = 0; color rb5 = 0;
color rr6 = 0; color rg6 = 0; color rb6 = 0;
float recttrans = 50;
float recttrans1 = 50;
float recttrans2 = 50;
float recttrans3 = 50;
float recttrans4 = 50;
float recttrans5 = 50;
float recttrans6 = 50;
//rectangles second layer
color lr = 250; color lg = 250; color lb = 250;
color lr1 = 250; color lg1 = 250; color lb1 = 250;
color lr2 = 250; color lg2 = 250; color lb2 = 250;
color lr3 = 250; color lg3 = 250; color lb3 = 250;
color lr4 = 250; color lg4 = 250; color lb4 = 250;
color lr5 = 250; color lg5 = 250; color lb5 = 250;
color lr6 = 250; color lg6 = 250; color lb6 = 250;
float lighttrans = 0;
float lighttrans1 = 0;
float lighttrans2 = 0;
float lighttrans3 = 0;
float lighttrans4 = 0;
float lighttrans5 = 0;
float lighttrans6 = 0;


void setup() {
  size (500,500);
  
  fill (255);
  ellipseMode(CENTER);
  smooth();
  noStroke();
  
  x = width/2;
  y = height/2;
  
  m = new Minim(this);
  playerC = m.loadFile("noteC2.wav");
  playerA = m.loadFile("noteA3.wav");
  playerB = m.loadFile("noteB2.wav");
  playerD = m.loadFile("noteD2.wav");
  playerE = m.loadFile("noteE2.wav");
  playerF = m.loadFile("noteF2.wav");
  playerG = m.loadFile("noteG2.wav");
  playerAhigh = m.loadFile("noteA3high.wav");
  playerBhigh = m.loadFile("noteB2high.wav");
  playerChigh = m.loadFile("noteC2high.wav");
  playerDhigh = m.loadFile("noteD2high.wav");
  playerEhigh = m.loadFile("noteE2high.wav");
  playerFhigh = m.loadFile("noteF2high.wav");
  playerGhigh = m.loadFile("noteG2high.wav");
}
  
  void draw() {
  
  mouseChecks();
  boundaryChecks();
  light();
  rectangles();
  panels();
  balllight();
     
   
  
  }
  
  void mouseChecks() {
  if (mousePressed == true) {
    x = mouseX;
    y = mouseY;
    yspeed = mouseY - pmouseY;
    xspeed = mouseX - pmouseX;
    balldiameter++;
    while(balldiameter==100){
      balldiameter = 5;
    }
    
  }


  
  
  ballradius = balldiameter/2;
  
  
  fill(255,255,255,100);
 
  ellipse (x,y,balldiameter,balldiameter);
  //ballglow
  fill(br,bg,bb,30);
  
  
  ellipse (x,y,balldiameter+(balldiameter/10),balldiameter+(balldiameter/10));
  ellipse (x,y,balldiameter+(balldiameter/5),balldiameter+(balldiameter/5));
  ellipse (x,y,balldiameter+(balldiameter/3.3),balldiameter+(balldiameter/3.3));
  ellipse (x,y,balldiameter+(balldiameter/2.5),balldiameter+(balldiameter/2.5));
  ellipse (x,y,balldiameter+(balldiameter/2),balldiameter+(balldiameter/2));
  //
  

  //
  yspeed = yspeed += 0.2;
  xspeed = xspeed;
  y = y + yspeed;
  x = x + xspeed;
}
void boundaryChecks() {
  if (y >= height - ballradius) {
    y = height - ballradius;
    yspeed = -yspeed;
  }
  if (y <= ballradius) {
    y = ballradius;
    yspeed = -yspeed/1.35;
  }
  if (x >= width -ballradius) {
    x = width -ballradius;
    xspeed = -xspeed/1.10;
  }
  if (x <= ballradius) {
    x = ballradius;
    xspeed = -xspeed/1.10;
  }


}
void panels(){
  
  float rh = 10;
  float rpos = height-rh;
  
  
  
  //panels
  fill(pr,pg,pb);
  rect(width/amnt*0,rpos,width/amnt,rh);
  fill(pr1,pg1,pb1);
  rect(width/amnt*1,rpos,width/amnt,rh);
  fill(pr2,pg2,pb2);
  rect(width/amnt*2,rpos,width/amnt,rh);
  fill(pr3,pg3,pb3);
  rect(width/amnt*3,rpos,width/amnt,rh);
  fill(pr4,pg4,pb4);
  rect(width/amnt*4,rpos,width/amnt,rh);
  fill(pr5,pg5,pb5);
  rect(width/amnt*5,rpos,width/amnt,rh);
  fill(pr6,pg6,pb6);
  rect(width/amnt*6,rpos,width/amnt,rh);
  
  //panels ceiling
  fill(pr,pg,pb);
  rect(width/amnt*0,0,width/amnt,rh);
  fill(pr1,pg1,pb1);
  rect(width/amnt*1,0,width/amnt,rh);
  fill(pr2,pg2,pb2);
  rect(width/amnt*2,0,width/amnt,rh);
  fill(pr3,pg3,pb3);
  rect(width/amnt*3,0,width/amnt,rh);
  fill(pr4,pg4,pb4);
  rect(width/amnt*4,0,width/amnt,rh);
  fill(pr5,pg5,pb5);
  rect(width/amnt*5,0,width/amnt,rh);
  fill(pr6,pg6,pb6);
  rect(width/amnt*6,0,width/amnt,rh);
  
  
  
  
//panels light up floor
  if(y>=rpos-ballradius&&x<width/amnt*1+ballradius){//a
    if(balldiameter>50){
    playerA.play();
    playerA.rewind();
    }
    else{
      playerAhigh.play();
      playerAhigh.rewind();
    }
    pr = 132; pg = 126; pb = 226;
    br = 132; bg = 126; bb = 226;
    rr = 132; rg = 126; rb = 226; 
    lr1 = 132; lg1 = 126; lb1 = 226; lighttrans1 = 20 ;
  }
    if(y>=rpos-ballradius&&x<width/amnt*2+ballradius&&x>width/amnt*1){//b
    if(balldiameter>50){
    playerB.play();
    playerB.rewind();
    }
    else{
      playerBhigh.play();
      playerBhigh.rewind();
    }
    pr1 = 232; pg1 = 126; pb1 = 192;
    br = 232; bg = 126; bb = 192;
    rr1 = 232; rg1 = 126; rb1 = 192;//
    lr = 232; lg = 126; lb = 192; lighttrans = 20;
    lr2 = 232; lg2 = 126; lb2 = 192; lighttrans2 = 20;
    }
    if(y>=rpos-ballradius&&x<width/amnt*3+ballradius&&x>width/amnt*2){//c
   if(balldiameter>50){
    playerC.play();
    playerC.rewind();
    }
    else{
      playerChigh.play();
      playerChigh.rewind();
    }
    
    pr2 = 253; pg2 = 240; pb2 = 127;
    br = 253; bg = 240; bb = 127;
    rr2 = 253; rg2 = 240; rb2 = 127;//
    lr1 = 253; lg1 = 240; lb1 = 127; lighttrans1 = 20;
    lr3 = 253; lg3 = 240; lb3 = 127; lighttrans3 = 20;
    }
    if(y>=rpos-ballradius&&x<width/amnt*4+ballradius&&x>width/amnt*3){//d
    if(balldiameter>50){
    playerD.play();
    playerD.rewind();
    }
    else{
      playerDhigh.play();
      playerDhigh.rewind();
    }
    pr3 = 254; pg3 = 154; pb3 = 127;
    br = 254; bg = 154; bb = 127;
    rr3 = 254; rg3 = 154; rb3 = 127;//
     lr4 = 254; lg4 = 154; lb4 = 127; lighttrans4 = 20;
      lr2 = 254; lg2 = 154; lb2 = 127; lighttrans2 = 20;
    }
    if(y>=rpos-ballradius&&x<width/amnt*5+ballradius&&x>width/amnt*4){//e
    if(balldiameter>50){
    playerE.play();
    playerE.rewind();
    }
    else{
      playerEhigh.play();
      playerEhigh.rewind();
    }
    pr4 = 254; pg4 = 126; pb4 = 141;
    br = 254; bg = 126; bb = 141;
    rr4 = 254; rg4 = 126; rb4 = 141;//
    lr3 = 254; lg3 = 126; lb3 = 141; lighttrans3 = 10;
    lr5 = 254; lg5 = 126; lb5 = 141; lighttrans5 = 10;
    }
    if(y>=rpos-ballradius&&x<width/amnt*6+ballradius&&x>width/amnt*5){//f
    if(balldiameter>50){
    playerF.play();
    playerF.rewind();
    }
    else{
      playerFhigh.play();
      playerFhigh.rewind();
    }
    pr5 = 213; pg5 = 230; pb5 = 126;
    br = 213; bg = 230; bb = 126;
    rr5 = 213; rg5 = 230; rb5 = 126;//
    lr4 = 213; lg4 = 230; lb4 = 126; lighttrans4 = 20;
    lr6 = 213; lg6 = 230; lb6 = 126; lighttrans6 = 20;
    }
    if(y>=rpos-ballradius&&x>width/amnt*6){//g
    if(balldiameter>50){
    playerG.play();
    playerG.rewind();
    }
    else{
      playerGhigh.play();
      playerGhigh.rewind();
    }
    pr6 = 253; pg6 = 208; pb6 = 127;
    br = 253; bg = 208; bb = 127;
    rr6 = 253; rg6 = 208; rb6 = 127;//
     lr5 = 253; lg5 = 208; lb5 = 127; lighttrans5 = 20;
    }
    
    //panels light up cieling
    if(y<=rh+ballradius&&x<width/amnt*1+ballradius){//a
    if(balldiameter>50){
    playerA.play();
    playerA.rewind();
    }
    else{
      playerAhigh.play();
      playerAhigh.rewind();
    }
    pr = 132; pg = 126; pb = 226;
    br = 132; bg = 126; bb = 226;
    rr = 132; rg = 126; rb = 226;//
    lr1 = 132; lg1 = 126; lb1 = 226; lighttrans = 20;
  }
    if(y<=rh+ballradius&&x<width/amnt*2+ballradius&&x>width/amnt*1){//b
    if(balldiameter>50){
    playerB.play();
    playerB.rewind();
    }
    else{
      playerBhigh.play();
      playerBhigh.rewind();
    }
    pr1 = 232; pg1 = 126; pb1 = 192;
    br = 232; bg = 126; bb = 192;
    rr1 = 232; rg1 = 126; rb1 = 192;//
    lr = 232; lg = 126; lb = 192; lighttrans = 20;
    lr2 = 232; lg2 = 126; lb2 = 192; lighttrans2 = 20;
    }
    if(y<=rh+ballradius&&x<width/amnt*3+ballradius&&x>width/amnt*2){//c
    if(balldiameter>50){
    playerC.play();
    playerC.rewind();
    }
    else{
      playerChigh.play();
      playerChigh.rewind();
    }
    
    pr2 = 253; pg2 = 240; pb2 = 127;
    br = 253; bg = 240; bb = 127;
    rr2 = 253; rg2 = 240; rb2 = 127;
    lr1 = 253; lg1 = 240; lb1 = 127; lighttrans1 = 20;
    lr3 = 253; lg3 = 240; lb3 = 127; lighttrans3 = 20;
    }
    if(y<=rh+ballradius&&x<width/amnt*4+ballradius&&x>width/amnt*3){//d
    if(balldiameter>50){
    playerD.play();
    playerD.rewind();
    }
    else{
      playerDhigh.play();
      playerDhigh.rewind();
    }
    pr3 = 254; pg3 = 154; pb3 = 127;
    br = 254; bg = 154; bb = 127;
    rr3 = 254; rg3 = 154; rb3 = 127;//
    lr2 = 254; lg2 = 154; lb2 = 127; lighttrans2 = 20;
    lr4 = 254; lg4 = 154; lb4 = 127; lighttrans4 = 20;
    }
    if(y<=rh+ballradius&&x<width/amnt*5+ballradius&&x>width/amnt*4){//e
    if(balldiameter>50){
    playerE.play();
    playerE.rewind();
    }
    else{
      playerEhigh.play();
      playerEhigh.rewind();
    }
    pr4 = 254; pg4 = 126; pb4 = 141;
    br = 254; bg = 126; bb = 141;
    rr4 = 254; rg4 = 126; rb4 = 141;//
    lr3 = 254; lg3 = 126; lb3 = 141; lighttrans3 = 20;
    lr5 = 254; lg5 = 126; lb5 = 141; lighttrans5 = 20;
    }
    if(y<=rh+ballradius&&x<width/amnt*6+ballradius&&x>width/amnt*5){//f
    if(balldiameter>50){
    playerF.play();
    playerF.rewind();
    }
    else{
      playerFhigh.play();
      playerFhigh.rewind();
    }
    pr5 = 213; pg5 = 230; pb5 = 126;
    br = 213; bg = 230; bb = 126;
    rr5 = 213; rg5 = 230; rb5 = 126;
    lr4 = 213; lg4 = 230; lb4 = 126; lighttrans4 = 20;
     lr6 = 213; lg6 = 230; lb6 = 126; lighttrans6 = 20;
    }
    if(y<=rh+ballradius&&x>width/amnt*6){//g
    if(balldiameter>50){
    playerG.play();
    playerG.rewind();
    }
    else{
      playerGhigh.play();
      playerGhigh.rewind();
    }
    pr6 = 253; pg6 = 208; pb6 = 127;
    br = 253; bg = 208; bb = 127;
    rr6 = 253; rg6 = 208; rb6 = 127;
    lr5 = 253; lg5 = 208; lb5 = 127; lighttrans5 = 20;
    }
   //panels go back to normal
  if(y<rpos-ballradius-50&&y>rh+balldiameter)
  {pr = 30; pg = 30; pb = 30;
    pr1 = 30; pg1 = 30; pb1 = 30;//panels floor
    pr2 = 30; pg2 = 30; pb2 = 30;
    pr3 = 30; pg3 = 30; pb3 = 30;
    pr4 = 30; pg4 = 30; pb4 = 30;
    pr5 = 30; pg5 = 30; pb5 = 30;
    pr6 = 30; pg6 = 30; pb6 = 30;
    //rects
    rr = 0; rg = 0; rb = 0; recttrans = 50;
    rr1 = 0; rg1 = 0; rb1 = 0; recttrans1 = 50;
    rr2 = 0; rg2 = 0; rb2 = 0; recttrans2 = 50;
    rr3 = 0; rg3 = 0; rb3 = 0; recttrans3 = 50;
    rr4 = 0; rg4 = 0; rb4 = 0; recttrans4 = 50;
    rr5 = 0; rg5 = 0; rb5 = 0; recttrans5 = 50;
    rr6 = 0; rg6 = 0; rb6 = 0; recttrans6 = 50;
    //light
    lr = 0; lg = 0; lb = 0; lighttrans = 50;
    lr1 = 0; lg1 = 0; lb1 = 0; lighttrans1 = 50;
    lr2 = 0; lg2 = 0; lb2 = 0; lighttrans2 = 50;
    lr3 = 0; lg3 = 0; lb3 = 0; lighttrans3 = 50;
    lr4 = 0; lg4 = 0; lb4 = 0; lighttrans4 = 50;
    lr5 = 0; lg5 = 0; lb5 = 0; lighttrans5 = 50;
    lr6 = 0; lg6 = 0; lb6 = 0; lighttrans6 = 50;
  }
  
  
  
}

void rectangles(){
  fill(rr,rg,rb,recttrans);
  rect(width/amnt*0,0,width/amnt,500);//a
  fill(rr1,rg1,rb1,recttrans1);
  rect(width/amnt*1,0,width/amnt,500);//b
  fill(rr2,rg2,rb2,recttrans2);
  rect(width/amnt*2,0,width/amnt,500);//c
  fill(rr3,rg3,rb3,recttrans3);
  rect(width/amnt*3,0,width/amnt,500);//d
  fill(rr4,rg4,rb4,recttrans4);
  rect(width/amnt*4,0,width/amnt,500);//e
  fill(rr5,rg5,rb5,recttrans5);
  rect(width/amnt*5,0,width/amnt,500);//f
  fill(rr6,rg6,rb6,recttrans6);
  rect(width/amnt*6,0,width/amnt,500);//g
}
  //second layer
  void light(){
  fill(lr,lg,lb,lighttrans);
  rect(width/amnt*0,0,width/amnt,500);//a
  fill(lr1,lg1,lb1,lighttrans1);
  rect(width/amnt*1,0,width/amnt,500);//b
  fill(lr2,lg2,lb2,lighttrans2);
  rect(width/amnt*2,0,width/amnt,500);//c
  fill(lr3,lg3,lb3,lighttrans3);
  rect(width/amnt*3,0,width/amnt,500);//d
  fill(lr4,lg4,lb4,lighttrans4);
  rect(width/amnt*4,0,width/amnt,500);//e
  fill(lr5,lg5,lb5,lighttrans5);
  rect(width/amnt*5,0,width/amnt,500);//f
  fill(lr6,lg6,lb6,lighttrans6);
  rect(width/amnt*6,0,width/amnt,500);//g
  }
  
  void balllight(){
    fill(250,250,250);
    ellipse (x,y,balldiameter,balldiameter);
  }
 

