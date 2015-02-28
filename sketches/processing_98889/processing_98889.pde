
/*import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;*/

var boom = document.createElement("audio");
var ouch = document.createElement("audio");

/*
Minim boom, jaja, ouch;
AudioPlayer fesBoom;
AudioPlayer fesJaja;
AudioPlayer fesOuch;*/
PImage homer, homerOuch, nelson;
int numBarreres;
int xShooter,yShooter, xBullet, yBullet, xNelson, yNelson, xHomer, yHomer;
int velXBullet,velYHomer;
int szBullet,aShooter, bShooter,aHomer, bHomer, aNelson, bNelson,bBarreres;
int[] xBarreres; 
int[] yBarreres;
int[] velYBarreres;
int visualitzacioHomerOuch;
boolean shooted;

void setup(){
  size(800,600);
  nelson=loadImage("nelson.gif");
 // jaja=new Minim(this);
 // fesJaja=jaja.loadFile("jaja.mp3");
  boom.setAttribute("src", "boom.mp3");
 boom.play();
  ouch.setAttribute("src", "ouch.mp3");
  ouch.play();
 // boom=new Minim (this);
 // fesBoom=boom.loadFile("boom.mp3");
  //ouch=new Minim(this);
 // fesOuch=ouch.loadFile("ouch.mp3");
  homer=loadImage("homer.jpg");
  homerOuch=loadImage("homerouch.jpg");
  
  visualitzacioHomerOuch=0;
  shooted= false;
  numBarreres=5;
  
  xBarreres = new int[numBarreres];
  xBarreres[0] = width / 2;
  xBarreres[1] = width / 2 + 20;
  xBarreres[2] = width / 2 + 40;
  xBarreres[3] = width / 2 + 60;
  xBarreres[4] = width / 2 + 80;
  
  yBarreres = new int[numBarreres];
  
  velYBarreres = new int[numBarreres];
  for (int i = 0; i < numBarreres; i++) {
    velYBarreres[i] = int(random(1,9));
  }
  /*
  velYBarreres[0] = 2;
  velYBarreres[1] = 3;
  velYBarreres[2] = 1;
  velYBarreres[3] = 5;
  velYBarreres[4] = 4;
  */
  
  velXBullet=5;
  velYHomer=2;
  szBullet=width/40;
  aShooter=width/12;
  bShooter=50;
  aHomer=width/5;
  bHomer=height/5;
  aNelson=width/6;
  bNelson=height/6;
  bBarreres=100;
  xShooter=0;
  yShooter=height/2-bShooter/2;
  xBullet=xShooter;
  yBullet=yShooter;
  xNelson= width/6;
  yNelson= height/6*5;
  xHomer=width*4/5;
  yHomer=height/2-bHomer;
  
}

void draw(){
    background(255);
    for(int i=1; i<width; i+=width/8){
      int xfondo=i;
      for(int j=1; j<height;j+=height/8){
        int yfondo=j;
        fill(103,0,152);
      stroke(255);
      ellipse(xfondo,yfondo,50,50);
      fill(255);
      ellipse(xfondo,yfondo,20,20);
      }
    
    }
    
    if(keyPressed){
      if(key=='x'){
       shootBullet(yShooter + bShooter / 2);
      }
    }
    
    drawShooter();
    drawHomer();
    moveBarreres();
    drawBarreres();
    moveBullet();
    drawBullet();
    
  if(((xBullet>xHomer)&&(xBullet<xHomer+aHomer)&&!((yBullet<yHomer)||(yBullet>yHomer+bHomer)))&&(shooted)){
    visualitzacioHomerOuch+=5;
    drawHomerOuch();
    //ouch.setAttribute("src", "ouch.mp3");
    //ouch.play();
    
   // fesOuch.cue(0);
    //fesOuch.play();
  
    
  }
  for(int i=0; i>numBarreres; i++){
  if((xBullet>=xBarreres[i]-szBullet)&&(xBullet<=xBarreres[i]+5+szBullet)&&(yBullet>=yBarreres[i])&&(yBullet<=yBarreres[i]+bBarreres)){
        shooted=false;
  }
  }
 
   if(visualitzacioHomerOuch>0){
     drawHomerOuch();
    // fesOuch.cue(0);
    // fesOuch.play();
    }
    if(visualitzacioHomerOuch>2){
      visualitzacioHomerOuch=0;
    }
  
  if(xBullet>width-szBullet){
 // drawNelson();
  //iniciaShooted=0;
  }
}

void drawShooter(){
  fill(0);
  stroke(0);
  rect(xShooter,yShooter,aShooter,bShooter);
  if(keyPressed){
  if(key=='a'){
    yShooter-=5;
  }
  if(key=='z'){
    yShooter+=5;
  }
  }
  if(yShooter<00){
  yShooter=0;
  }
  if(yShooter>height-40){
    yShooter=height-40;
  }
}


void drawHomer(){
  yHomer+=velYHomer;
  image(homer,xHomer,yHomer,width/5,height/5);
  if((yHomer<0)||(yHomer>height-height/5)){
  velYHomer=-velYHomer;
  }

}

void moveBarreres () {
  for(int i=0;i<numBarreres; i++){
    yBarreres[i] += velYBarreres[i];
    if (yBarreres[i] < 0) {
      yBarreres[i] = 0;
      velYBarreres[i] = -velYBarreres[i];
    } else if (yBarreres[i] > height - bBarreres) {
      yBarreres[i] = height - bBarreres;
      velYBarreres[i] = -velYBarreres[i];
    }
  }
}

void drawBarreres(){
  for(int i=0;i<numBarreres; i++){
    stroke(247,125,233);
    strokeWeight(5);
    rect(xBarreres[i],yBarreres[i],5,bBarreres);
    
  }
}

void drawHomerOuch(){
  image(homerOuch,xHomer,yHomer,aHomer,bHomer);
  ouch.setAttribute("src", "ouch.mp3");
  ouch.play();
 
 // fesOuch.cue(0);
  //fesOuch.play();
}

void drawNelson(){
  image(nelson,xNelson,yNelson,aNelson,bNelson);
  fesJaja.cue(0);
  fesJaja.play();
}

void shootBullet(int y){
  
  if(!shooted){
    
    boom.setAttribute("src", "boom.mp3");
    boom.play();
    //fesBoom.cue(0);
    //fesBoom.play();
    yBullet = y;
    shooted= true;
  }
}

void drawBullet(){
  if(shooted){
    fill(255,0,0);
    strokeWeight(1);
    ellipse(xBullet,yBullet,szBullet,szBullet);
  }
}
    
void moveBullet(){
 if(shooted){
   xBullet+=velXBullet;
   
   if (xBullet >= width + szBullet) {
    xBullet = 0;
    shooted = false;
  }
 }
}
   



